// ******************************************************************************

// iCEcube Netlister

// Version:            2017.08.27940

// Build Date:         Sep 12 2017 08:25:46

// File Generated:     Oct 12 2020 16:05:25

// Purpose:            Post-Route Verilog/VHDL netlist for timing simulation

// Copyright (C) 2006-2010 by Lattice Semiconductor Corp. All rights reserved.

// ******************************************************************************

// Verilog file for cell "top" view "INTERFACE"

module top (
    TX,
    RX,
    LED4,
    LED3,
    LED2,
    LED1,
    CLK);

    output TX;
    input RX;
    output LED4;
    output LED3;
    output LED2;
    output LED1;
    input CLK;

    wire N__15400;
    wire N__15399;
    wire N__15398;
    wire N__15389;
    wire N__15388;
    wire N__15387;
    wire N__15380;
    wire N__15379;
    wire N__15378;
    wire N__15371;
    wire N__15370;
    wire N__15369;
    wire N__15362;
    wire N__15361;
    wire N__15360;
    wire N__15353;
    wire N__15352;
    wire N__15351;
    wire N__15344;
    wire N__15343;
    wire N__15342;
    wire N__15325;
    wire N__15324;
    wire N__15323;
    wire N__15320;
    wire N__15315;
    wire N__15310;
    wire N__15307;
    wire N__15306;
    wire N__15303;
    wire N__15300;
    wire N__15297;
    wire N__15294;
    wire N__15293;
    wire N__15290;
    wire N__15287;
    wire N__15284;
    wire N__15281;
    wire N__15278;
    wire N__15275;
    wire N__15272;
    wire N__15269;
    wire N__15262;
    wire N__15259;
    wire N__15256;
    wire N__15253;
    wire N__15250;
    wire N__15247;
    wire N__15244;
    wire N__15241;
    wire N__15238;
    wire N__15235;
    wire N__15232;
    wire N__15229;
    wire N__15226;
    wire N__15223;
    wire N__15220;
    wire N__15217;
    wire N__15214;
    wire N__15211;
    wire N__15208;
    wire N__15205;
    wire N__15202;
    wire N__15199;
    wire N__15198;
    wire N__15197;
    wire N__15194;
    wire N__15191;
    wire N__15188;
    wire N__15185;
    wire N__15180;
    wire N__15177;
    wire N__15174;
    wire N__15171;
    wire N__15166;
    wire N__15163;
    wire N__15162;
    wire N__15159;
    wire N__15156;
    wire N__15153;
    wire N__15150;
    wire N__15147;
    wire N__15146;
    wire N__15141;
    wire N__15138;
    wire N__15133;
    wire N__15132;
    wire N__15131;
    wire N__15128;
    wire N__15127;
    wire N__15124;
    wire N__15121;
    wire N__15118;
    wire N__15115;
    wire N__15112;
    wire N__15109;
    wire N__15106;
    wire N__15103;
    wire N__15100;
    wire N__15097;
    wire N__15090;
    wire N__15087;
    wire N__15082;
    wire N__15079;
    wire N__15078;
    wire N__15077;
    wire N__15074;
    wire N__15069;
    wire N__15066;
    wire N__15063;
    wire N__15058;
    wire N__15055;
    wire N__15052;
    wire N__15049;
    wire N__15046;
    wire N__15043;
    wire N__15040;
    wire N__15037;
    wire N__15034;
    wire N__15031;
    wire N__15028;
    wire N__15025;
    wire N__15022;
    wire N__15019;
    wire N__15016;
    wire N__15013;
    wire N__15010;
    wire N__15007;
    wire N__15004;
    wire N__15001;
    wire N__14998;
    wire N__14995;
    wire N__14992;
    wire N__14989;
    wire N__14988;
    wire N__14985;
    wire N__14982;
    wire N__14979;
    wire N__14978;
    wire N__14975;
    wire N__14972;
    wire N__14969;
    wire N__14966;
    wire N__14963;
    wire N__14960;
    wire N__14957;
    wire N__14952;
    wire N__14947;
    wire N__14944;
    wire N__14941;
    wire N__14938;
    wire N__14935;
    wire N__14932;
    wire N__14929;
    wire N__14926;
    wire N__14923;
    wire N__14920;
    wire N__14917;
    wire N__14914;
    wire N__14911;
    wire N__14908;
    wire N__14905;
    wire N__14902;
    wire N__14899;
    wire N__14896;
    wire N__14893;
    wire N__14892;
    wire N__14889;
    wire N__14886;
    wire N__14885;
    wire N__14882;
    wire N__14879;
    wire N__14876;
    wire N__14873;
    wire N__14870;
    wire N__14867;
    wire N__14864;
    wire N__14861;
    wire N__14858;
    wire N__14851;
    wire N__14848;
    wire N__14845;
    wire N__14842;
    wire N__14839;
    wire N__14836;
    wire N__14833;
    wire N__14830;
    wire N__14827;
    wire N__14824;
    wire N__14821;
    wire N__14818;
    wire N__14815;
    wire N__14812;
    wire N__14809;
    wire N__14806;
    wire N__14803;
    wire N__14800;
    wire N__14797;
    wire N__14796;
    wire N__14793;
    wire N__14790;
    wire N__14787;
    wire N__14784;
    wire N__14781;
    wire N__14780;
    wire N__14777;
    wire N__14774;
    wire N__14771;
    wire N__14768;
    wire N__14765;
    wire N__14762;
    wire N__14755;
    wire N__14752;
    wire N__14749;
    wire N__14746;
    wire N__14743;
    wire N__14740;
    wire N__14737;
    wire N__14734;
    wire N__14731;
    wire N__14728;
    wire N__14725;
    wire N__14722;
    wire N__14719;
    wire N__14716;
    wire N__14713;
    wire N__14710;
    wire N__14707;
    wire N__14704;
    wire N__14703;
    wire N__14702;
    wire N__14701;
    wire N__14698;
    wire N__14697;
    wire N__14696;
    wire N__14693;
    wire N__14692;
    wire N__14689;
    wire N__14686;
    wire N__14685;
    wire N__14684;
    wire N__14683;
    wire N__14682;
    wire N__14679;
    wire N__14668;
    wire N__14665;
    wire N__14660;
    wire N__14655;
    wire N__14654;
    wire N__14653;
    wire N__14652;
    wire N__14651;
    wire N__14648;
    wire N__14639;
    wire N__14630;
    wire N__14623;
    wire N__14620;
    wire N__14619;
    wire N__14616;
    wire N__14613;
    wire N__14610;
    wire N__14607;
    wire N__14606;
    wire N__14601;
    wire N__14598;
    wire N__14595;
    wire N__14592;
    wire N__14587;
    wire N__14586;
    wire N__14583;
    wire N__14580;
    wire N__14579;
    wire N__14578;
    wire N__14577;
    wire N__14576;
    wire N__14573;
    wire N__14572;
    wire N__14571;
    wire N__14570;
    wire N__14569;
    wire N__14566;
    wire N__14561;
    wire N__14558;
    wire N__14555;
    wire N__14552;
    wire N__14543;
    wire N__14536;
    wire N__14527;
    wire N__14524;
    wire N__14521;
    wire N__14518;
    wire N__14515;
    wire N__14512;
    wire N__14509;
    wire N__14506;
    wire N__14503;
    wire N__14500;
    wire N__14497;
    wire N__14494;
    wire N__14491;
    wire N__14488;
    wire N__14485;
    wire N__14482;
    wire N__14479;
    wire N__14476;
    wire N__14473;
    wire N__14472;
    wire N__14469;
    wire N__14466;
    wire N__14465;
    wire N__14462;
    wire N__14459;
    wire N__14456;
    wire N__14453;
    wire N__14450;
    wire N__14447;
    wire N__14442;
    wire N__14439;
    wire N__14436;
    wire N__14431;
    wire N__14430;
    wire N__14427;
    wire N__14424;
    wire N__14421;
    wire N__14420;
    wire N__14417;
    wire N__14414;
    wire N__14411;
    wire N__14408;
    wire N__14405;
    wire N__14402;
    wire N__14395;
    wire N__14392;
    wire N__14391;
    wire N__14390;
    wire N__14387;
    wire N__14386;
    wire N__14383;
    wire N__14380;
    wire N__14377;
    wire N__14374;
    wire N__14371;
    wire N__14368;
    wire N__14365;
    wire N__14362;
    wire N__14359;
    wire N__14356;
    wire N__14353;
    wire N__14350;
    wire N__14345;
    wire N__14342;
    wire N__14335;
    wire N__14334;
    wire N__14331;
    wire N__14328;
    wire N__14325;
    wire N__14324;
    wire N__14321;
    wire N__14318;
    wire N__14315;
    wire N__14310;
    wire N__14307;
    wire N__14302;
    wire N__14301;
    wire N__14298;
    wire N__14295;
    wire N__14292;
    wire N__14291;
    wire N__14288;
    wire N__14285;
    wire N__14282;
    wire N__14279;
    wire N__14276;
    wire N__14273;
    wire N__14270;
    wire N__14267;
    wire N__14264;
    wire N__14257;
    wire N__14254;
    wire N__14251;
    wire N__14248;
    wire N__14245;
    wire N__14242;
    wire N__14239;
    wire N__14236;
    wire N__14233;
    wire N__14230;
    wire N__14227;
    wire N__14224;
    wire N__14221;
    wire N__14218;
    wire N__14215;
    wire N__14212;
    wire N__14209;
    wire N__14206;
    wire N__14203;
    wire N__14200;
    wire N__14199;
    wire N__14196;
    wire N__14195;
    wire N__14194;
    wire N__14191;
    wire N__14188;
    wire N__14185;
    wire N__14182;
    wire N__14179;
    wire N__14176;
    wire N__14173;
    wire N__14170;
    wire N__14167;
    wire N__14164;
    wire N__14161;
    wire N__14158;
    wire N__14155;
    wire N__14152;
    wire N__14149;
    wire N__14142;
    wire N__14137;
    wire N__14136;
    wire N__14133;
    wire N__14130;
    wire N__14125;
    wire N__14122;
    wire N__14119;
    wire N__14116;
    wire N__14113;
    wire N__14110;
    wire N__14107;
    wire N__14104;
    wire N__14101;
    wire N__14098;
    wire N__14095;
    wire N__14092;
    wire N__14089;
    wire N__14086;
    wire N__14083;
    wire N__14080;
    wire N__14077;
    wire N__14074;
    wire N__14071;
    wire N__14068;
    wire N__14065;
    wire N__14062;
    wire N__14061;
    wire N__14058;
    wire N__14055;
    wire N__14052;
    wire N__14051;
    wire N__14048;
    wire N__14047;
    wire N__14044;
    wire N__14041;
    wire N__14038;
    wire N__14035;
    wire N__14032;
    wire N__14029;
    wire N__14024;
    wire N__14019;
    wire N__14014;
    wire N__14011;
    wire N__14008;
    wire N__14007;
    wire N__14004;
    wire N__14001;
    wire N__13996;
    wire N__13993;
    wire N__13990;
    wire N__13987;
    wire N__13984;
    wire N__13981;
    wire N__13978;
    wire N__13975;
    wire N__13972;
    wire N__13969;
    wire N__13966;
    wire N__13963;
    wire N__13960;
    wire N__13957;
    wire N__13954;
    wire N__13951;
    wire N__13948;
    wire N__13945;
    wire N__13942;
    wire N__13939;
    wire N__13936;
    wire N__13933;
    wire N__13930;
    wire N__13927;
    wire N__13926;
    wire N__13923;
    wire N__13920;
    wire N__13919;
    wire N__13916;
    wire N__13913;
    wire N__13910;
    wire N__13907;
    wire N__13904;
    wire N__13901;
    wire N__13894;
    wire N__13891;
    wire N__13888;
    wire N__13885;
    wire N__13882;
    wire N__13879;
    wire N__13876;
    wire N__13873;
    wire N__13870;
    wire N__13867;
    wire N__13864;
    wire N__13861;
    wire N__13858;
    wire N__13855;
    wire N__13852;
    wire N__13849;
    wire N__13846;
    wire N__13843;
    wire N__13842;
    wire N__13839;
    wire N__13836;
    wire N__13833;
    wire N__13828;
    wire N__13827;
    wire N__13826;
    wire N__13825;
    wire N__13824;
    wire N__13823;
    wire N__13822;
    wire N__13821;
    wire N__13820;
    wire N__13819;
    wire N__13818;
    wire N__13817;
    wire N__13816;
    wire N__13815;
    wire N__13814;
    wire N__13813;
    wire N__13812;
    wire N__13811;
    wire N__13810;
    wire N__13809;
    wire N__13808;
    wire N__13807;
    wire N__13806;
    wire N__13805;
    wire N__13804;
    wire N__13803;
    wire N__13802;
    wire N__13801;
    wire N__13800;
    wire N__13799;
    wire N__13798;
    wire N__13797;
    wire N__13796;
    wire N__13795;
    wire N__13794;
    wire N__13793;
    wire N__13792;
    wire N__13791;
    wire N__13790;
    wire N__13789;
    wire N__13788;
    wire N__13787;
    wire N__13786;
    wire N__13785;
    wire N__13784;
    wire N__13783;
    wire N__13782;
    wire N__13781;
    wire N__13780;
    wire N__13779;
    wire N__13778;
    wire N__13675;
    wire N__13672;
    wire N__13669;
    wire N__13668;
    wire N__13667;
    wire N__13666;
    wire N__13661;
    wire N__13660;
    wire N__13655;
    wire N__13652;
    wire N__13649;
    wire N__13646;
    wire N__13641;
    wire N__13636;
    wire N__13633;
    wire N__13630;
    wire N__13627;
    wire N__13624;
    wire N__13621;
    wire N__13618;
    wire N__13615;
    wire N__13612;
    wire N__13609;
    wire N__13608;
    wire N__13605;
    wire N__13602;
    wire N__13597;
    wire N__13596;
    wire N__13591;
    wire N__13588;
    wire N__13585;
    wire N__13584;
    wire N__13583;
    wire N__13576;
    wire N__13573;
    wire N__13570;
    wire N__13569;
    wire N__13566;
    wire N__13565;
    wire N__13560;
    wire N__13557;
    wire N__13554;
    wire N__13549;
    wire N__13546;
    wire N__13545;
    wire N__13542;
    wire N__13539;
    wire N__13538;
    wire N__13537;
    wire N__13536;
    wire N__13535;
    wire N__13534;
    wire N__13533;
    wire N__13528;
    wire N__13525;
    wire N__13522;
    wire N__13521;
    wire N__13520;
    wire N__13515;
    wire N__13512;
    wire N__13509;
    wire N__13506;
    wire N__13501;
    wire N__13496;
    wire N__13493;
    wire N__13490;
    wire N__13477;
    wire N__13474;
    wire N__13471;
    wire N__13468;
    wire N__13465;
    wire N__13462;
    wire N__13459;
    wire N__13456;
    wire N__13453;
    wire N__13450;
    wire N__13449;
    wire N__13446;
    wire N__13443;
    wire N__13442;
    wire N__13441;
    wire N__13436;
    wire N__13433;
    wire N__13432;
    wire N__13431;
    wire N__13430;
    wire N__13427;
    wire N__13422;
    wire N__13421;
    wire N__13418;
    wire N__13417;
    wire N__13414;
    wire N__13413;
    wire N__13410;
    wire N__13407;
    wire N__13404;
    wire N__13391;
    wire N__13390;
    wire N__13387;
    wire N__13382;
    wire N__13379;
    wire N__13376;
    wire N__13373;
    wire N__13366;
    wire N__13365;
    wire N__13362;
    wire N__13361;
    wire N__13358;
    wire N__13357;
    wire N__13354;
    wire N__13351;
    wire N__13348;
    wire N__13345;
    wire N__13344;
    wire N__13339;
    wire N__13336;
    wire N__13333;
    wire N__13332;
    wire N__13331;
    wire N__13330;
    wire N__13329;
    wire N__13328;
    wire N__13327;
    wire N__13324;
    wire N__13321;
    wire N__13316;
    wire N__13303;
    wire N__13300;
    wire N__13299;
    wire N__13298;
    wire N__13291;
    wire N__13288;
    wire N__13283;
    wire N__13280;
    wire N__13273;
    wire N__13270;
    wire N__13267;
    wire N__13266;
    wire N__13265;
    wire N__13262;
    wire N__13259;
    wire N__13258;
    wire N__13255;
    wire N__13250;
    wire N__13247;
    wire N__13244;
    wire N__13237;
    wire N__13234;
    wire N__13231;
    wire N__13228;
    wire N__13225;
    wire N__13222;
    wire N__13219;
    wire N__13216;
    wire N__13213;
    wire N__13210;
    wire N__13207;
    wire N__13204;
    wire N__13201;
    wire N__13198;
    wire N__13195;
    wire N__13192;
    wire N__13189;
    wire N__13186;
    wire N__13183;
    wire N__13180;
    wire N__13177;
    wire N__13176;
    wire N__13173;
    wire N__13170;
    wire N__13169;
    wire N__13166;
    wire N__13163;
    wire N__13160;
    wire N__13157;
    wire N__13154;
    wire N__13151;
    wire N__13148;
    wire N__13141;
    wire N__13138;
    wire N__13137;
    wire N__13134;
    wire N__13131;
    wire N__13130;
    wire N__13127;
    wire N__13124;
    wire N__13121;
    wire N__13118;
    wire N__13115;
    wire N__13112;
    wire N__13105;
    wire N__13104;
    wire N__13101;
    wire N__13098;
    wire N__13095;
    wire N__13094;
    wire N__13091;
    wire N__13088;
    wire N__13085;
    wire N__13082;
    wire N__13079;
    wire N__13076;
    wire N__13073;
    wire N__13070;
    wire N__13067;
    wire N__13060;
    wire N__13059;
    wire N__13058;
    wire N__13055;
    wire N__13052;
    wire N__13049;
    wire N__13046;
    wire N__13041;
    wire N__13038;
    wire N__13033;
    wire N__13030;
    wire N__13027;
    wire N__13024;
    wire N__13021;
    wire N__13018;
    wire N__13015;
    wire N__13012;
    wire N__13011;
    wire N__13010;
    wire N__13009;
    wire N__13008;
    wire N__13005;
    wire N__13002;
    wire N__12999;
    wire N__12998;
    wire N__12997;
    wire N__12996;
    wire N__12995;
    wire N__12994;
    wire N__12993;
    wire N__12992;
    wire N__12991;
    wire N__12990;
    wire N__12989;
    wire N__12986;
    wire N__12985;
    wire N__12984;
    wire N__12983;
    wire N__12982;
    wire N__12979;
    wire N__12978;
    wire N__12975;
    wire N__12972;
    wire N__12969;
    wire N__12966;
    wire N__12965;
    wire N__12960;
    wire N__12947;
    wire N__12944;
    wire N__12941;
    wire N__12938;
    wire N__12935;
    wire N__12932;
    wire N__12929;
    wire N__12928;
    wire N__12927;
    wire N__12926;
    wire N__12923;
    wire N__12920;
    wire N__12911;
    wire N__12908;
    wire N__12907;
    wire N__12906;
    wire N__12905;
    wire N__12900;
    wire N__12897;
    wire N__12890;
    wire N__12885;
    wire N__12882;
    wire N__12879;
    wire N__12876;
    wire N__12867;
    wire N__12864;
    wire N__12863;
    wire N__12860;
    wire N__12857;
    wire N__12852;
    wire N__12843;
    wire N__12836;
    wire N__12833;
    wire N__12830;
    wire N__12827;
    wire N__12824;
    wire N__12819;
    wire N__12816;
    wire N__12813;
    wire N__12810;
    wire N__12803;
    wire N__12796;
    wire N__12793;
    wire N__12790;
    wire N__12789;
    wire N__12788;
    wire N__12785;
    wire N__12782;
    wire N__12779;
    wire N__12776;
    wire N__12773;
    wire N__12770;
    wire N__12767;
    wire N__12764;
    wire N__12757;
    wire N__12754;
    wire N__12751;
    wire N__12750;
    wire N__12747;
    wire N__12744;
    wire N__12739;
    wire N__12738;
    wire N__12735;
    wire N__12732;
    wire N__12731;
    wire N__12730;
    wire N__12729;
    wire N__12728;
    wire N__12727;
    wire N__12726;
    wire N__12725;
    wire N__12722;
    wire N__12719;
    wire N__12714;
    wire N__12709;
    wire N__12706;
    wire N__12703;
    wire N__12700;
    wire N__12697;
    wire N__12690;
    wire N__12687;
    wire N__12682;
    wire N__12679;
    wire N__12674;
    wire N__12669;
    wire N__12664;
    wire N__12661;
    wire N__12658;
    wire N__12655;
    wire N__12652;
    wire N__12649;
    wire N__12646;
    wire N__12645;
    wire N__12642;
    wire N__12639;
    wire N__12634;
    wire N__12631;
    wire N__12628;
    wire N__12625;
    wire N__12622;
    wire N__12619;
    wire N__12618;
    wire N__12615;
    wire N__12612;
    wire N__12607;
    wire N__12604;
    wire N__12601;
    wire N__12598;
    wire N__12595;
    wire N__12592;
    wire N__12589;
    wire N__12586;
    wire N__12585;
    wire N__12584;
    wire N__12577;
    wire N__12576;
    wire N__12573;
    wire N__12570;
    wire N__12565;
    wire N__12562;
    wire N__12561;
    wire N__12558;
    wire N__12555;
    wire N__12550;
    wire N__12547;
    wire N__12544;
    wire N__12541;
    wire N__12540;
    wire N__12539;
    wire N__12536;
    wire N__12535;
    wire N__12534;
    wire N__12531;
    wire N__12530;
    wire N__12527;
    wire N__12524;
    wire N__12513;
    wire N__12510;
    wire N__12507;
    wire N__12502;
    wire N__12499;
    wire N__12496;
    wire N__12495;
    wire N__12494;
    wire N__12493;
    wire N__12492;
    wire N__12489;
    wire N__12486;
    wire N__12483;
    wire N__12480;
    wire N__12479;
    wire N__12478;
    wire N__12477;
    wire N__12474;
    wire N__12473;
    wire N__12466;
    wire N__12465;
    wire N__12462;
    wire N__12457;
    wire N__12454;
    wire N__12451;
    wire N__12448;
    wire N__12445;
    wire N__12442;
    wire N__12435;
    wire N__12432;
    wire N__12429;
    wire N__12424;
    wire N__12415;
    wire N__12412;
    wire N__12409;
    wire N__12406;
    wire N__12403;
    wire N__12400;
    wire N__12399;
    wire N__12396;
    wire N__12393;
    wire N__12392;
    wire N__12391;
    wire N__12390;
    wire N__12389;
    wire N__12386;
    wire N__12379;
    wire N__12376;
    wire N__12375;
    wire N__12372;
    wire N__12371;
    wire N__12370;
    wire N__12369;
    wire N__12368;
    wire N__12367;
    wire N__12364;
    wire N__12361;
    wire N__12352;
    wire N__12343;
    wire N__12334;
    wire N__12331;
    wire N__12328;
    wire N__12327;
    wire N__12326;
    wire N__12325;
    wire N__12324;
    wire N__12321;
    wire N__12314;
    wire N__12313;
    wire N__12312;
    wire N__12311;
    wire N__12308;
    wire N__12307;
    wire N__12306;
    wire N__12305;
    wire N__12304;
    wire N__12299;
    wire N__12290;
    wire N__12281;
    wire N__12274;
    wire N__12273;
    wire N__12272;
    wire N__12269;
    wire N__12266;
    wire N__12263;
    wire N__12262;
    wire N__12261;
    wire N__12258;
    wire N__12251;
    wire N__12250;
    wire N__12249;
    wire N__12248;
    wire N__12247;
    wire N__12244;
    wire N__12243;
    wire N__12242;
    wire N__12241;
    wire N__12236;
    wire N__12227;
    wire N__12224;
    wire N__12217;
    wire N__12208;
    wire N__12205;
    wire N__12204;
    wire N__12203;
    wire N__12202;
    wire N__12201;
    wire N__12200;
    wire N__12199;
    wire N__12198;
    wire N__12197;
    wire N__12194;
    wire N__12187;
    wire N__12184;
    wire N__12181;
    wire N__12180;
    wire N__12177;
    wire N__12176;
    wire N__12173;
    wire N__12172;
    wire N__12169;
    wire N__12166;
    wire N__12163;
    wire N__12156;
    wire N__12147;
    wire N__12136;
    wire N__12133;
    wire N__12130;
    wire N__12127;
    wire N__12124;
    wire N__12121;
    wire N__12118;
    wire N__12117;
    wire N__12116;
    wire N__12115;
    wire N__12112;
    wire N__12111;
    wire N__12106;
    wire N__12103;
    wire N__12102;
    wire N__12099;
    wire N__12096;
    wire N__12091;
    wire N__12088;
    wire N__12085;
    wire N__12082;
    wire N__12079;
    wire N__12070;
    wire N__12069;
    wire N__12068;
    wire N__12065;
    wire N__12062;
    wire N__12059;
    wire N__12058;
    wire N__12053;
    wire N__12050;
    wire N__12047;
    wire N__12044;
    wire N__12041;
    wire N__12038;
    wire N__12035;
    wire N__12028;
    wire N__12027;
    wire N__12026;
    wire N__12023;
    wire N__12020;
    wire N__12017;
    wire N__12014;
    wire N__12011;
    wire N__12008;
    wire N__12003;
    wire N__11998;
    wire N__11995;
    wire N__11992;
    wire N__11989;
    wire N__11986;
    wire N__11983;
    wire N__11980;
    wire N__11977;
    wire N__11974;
    wire N__11971;
    wire N__11968;
    wire N__11965;
    wire N__11964;
    wire N__11961;
    wire N__11958;
    wire N__11957;
    wire N__11956;
    wire N__11953;
    wire N__11950;
    wire N__11945;
    wire N__11944;
    wire N__11939;
    wire N__11936;
    wire N__11933;
    wire N__11926;
    wire N__11923;
    wire N__11920;
    wire N__11919;
    wire N__11916;
    wire N__11913;
    wire N__11908;
    wire N__11905;
    wire N__11902;
    wire N__11901;
    wire N__11898;
    wire N__11895;
    wire N__11890;
    wire N__11887;
    wire N__11886;
    wire N__11883;
    wire N__11880;
    wire N__11875;
    wire N__11872;
    wire N__11869;
    wire N__11868;
    wire N__11865;
    wire N__11862;
    wire N__11857;
    wire N__11854;
    wire N__11853;
    wire N__11850;
    wire N__11847;
    wire N__11846;
    wire N__11843;
    wire N__11840;
    wire N__11837;
    wire N__11830;
    wire N__11827;
    wire N__11824;
    wire N__11823;
    wire N__11820;
    wire N__11817;
    wire N__11812;
    wire N__11811;
    wire N__11806;
    wire N__11803;
    wire N__11802;
    wire N__11801;
    wire N__11796;
    wire N__11795;
    wire N__11794;
    wire N__11791;
    wire N__11788;
    wire N__11785;
    wire N__11782;
    wire N__11781;
    wire N__11778;
    wire N__11771;
    wire N__11770;
    wire N__11769;
    wire N__11766;
    wire N__11763;
    wire N__11760;
    wire N__11757;
    wire N__11752;
    wire N__11743;
    wire N__11740;
    wire N__11737;
    wire N__11736;
    wire N__11733;
    wire N__11730;
    wire N__11727;
    wire N__11724;
    wire N__11723;
    wire N__11722;
    wire N__11717;
    wire N__11712;
    wire N__11707;
    wire N__11704;
    wire N__11701;
    wire N__11698;
    wire N__11695;
    wire N__11692;
    wire N__11689;
    wire N__11686;
    wire N__11683;
    wire N__11680;
    wire N__11677;
    wire N__11674;
    wire N__11671;
    wire N__11668;
    wire N__11665;
    wire N__11662;
    wire N__11659;
    wire N__11656;
    wire N__11653;
    wire N__11650;
    wire N__11647;
    wire N__11644;
    wire N__11641;
    wire N__11638;
    wire N__11637;
    wire N__11634;
    wire N__11631;
    wire N__11628;
    wire N__11625;
    wire N__11622;
    wire N__11619;
    wire N__11616;
    wire N__11611;
    wire N__11610;
    wire N__11607;
    wire N__11606;
    wire N__11603;
    wire N__11598;
    wire N__11593;
    wire N__11590;
    wire N__11587;
    wire N__11584;
    wire N__11581;
    wire N__11578;
    wire N__11575;
    wire N__11572;
    wire N__11569;
    wire N__11566;
    wire N__11563;
    wire N__11560;
    wire N__11559;
    wire N__11558;
    wire N__11555;
    wire N__11550;
    wire N__11547;
    wire N__11542;
    wire N__11539;
    wire N__11536;
    wire N__11535;
    wire N__11534;
    wire N__11529;
    wire N__11528;
    wire N__11525;
    wire N__11522;
    wire N__11519;
    wire N__11516;
    wire N__11511;
    wire N__11510;
    wire N__11509;
    wire N__11508;
    wire N__11503;
    wire N__11500;
    wire N__11495;
    wire N__11488;
    wire N__11485;
    wire N__11484;
    wire N__11481;
    wire N__11478;
    wire N__11475;
    wire N__11472;
    wire N__11471;
    wire N__11470;
    wire N__11465;
    wire N__11460;
    wire N__11457;
    wire N__11454;
    wire N__11449;
    wire N__11446;
    wire N__11443;
    wire N__11440;
    wire N__11437;
    wire N__11434;
    wire N__11433;
    wire N__11430;
    wire N__11427;
    wire N__11426;
    wire N__11425;
    wire N__11422;
    wire N__11419;
    wire N__11418;
    wire N__11417;
    wire N__11412;
    wire N__11409;
    wire N__11406;
    wire N__11403;
    wire N__11400;
    wire N__11395;
    wire N__11392;
    wire N__11389;
    wire N__11380;
    wire N__11377;
    wire N__11374;
    wire N__11373;
    wire N__11370;
    wire N__11367;
    wire N__11362;
    wire N__11359;
    wire N__11356;
    wire N__11353;
    wire N__11352;
    wire N__11349;
    wire N__11346;
    wire N__11345;
    wire N__11342;
    wire N__11339;
    wire N__11336;
    wire N__11329;
    wire N__11326;
    wire N__11323;
    wire N__11322;
    wire N__11321;
    wire N__11320;
    wire N__11319;
    wire N__11316;
    wire N__11315;
    wire N__11312;
    wire N__11309;
    wire N__11304;
    wire N__11301;
    wire N__11300;
    wire N__11297;
    wire N__11294;
    wire N__11291;
    wire N__11288;
    wire N__11285;
    wire N__11280;
    wire N__11269;
    wire N__11268;
    wire N__11267;
    wire N__11266;
    wire N__11263;
    wire N__11260;
    wire N__11257;
    wire N__11256;
    wire N__11253;
    wire N__11252;
    wire N__11249;
    wire N__11246;
    wire N__11245;
    wire N__11244;
    wire N__11243;
    wire N__11242;
    wire N__11241;
    wire N__11238;
    wire N__11231;
    wire N__11226;
    wire N__11219;
    wire N__11214;
    wire N__11203;
    wire N__11202;
    wire N__11199;
    wire N__11198;
    wire N__11197;
    wire N__11194;
    wire N__11191;
    wire N__11190;
    wire N__11189;
    wire N__11188;
    wire N__11187;
    wire N__11184;
    wire N__11183;
    wire N__11180;
    wire N__11179;
    wire N__11176;
    wire N__11173;
    wire N__11170;
    wire N__11169;
    wire N__11168;
    wire N__11167;
    wire N__11166;
    wire N__11165;
    wire N__11164;
    wire N__11163;
    wire N__11162;
    wire N__11147;
    wire N__11144;
    wire N__11139;
    wire N__11128;
    wire N__11121;
    wire N__11110;
    wire N__11109;
    wire N__11108;
    wire N__11107;
    wire N__11106;
    wire N__11105;
    wire N__11098;
    wire N__11095;
    wire N__11092;
    wire N__11089;
    wire N__11086;
    wire N__11085;
    wire N__11084;
    wire N__11083;
    wire N__11082;
    wire N__11081;
    wire N__11078;
    wire N__11075;
    wire N__11072;
    wire N__11069;
    wire N__11066;
    wire N__11059;
    wire N__11056;
    wire N__11041;
    wire N__11038;
    wire N__11037;
    wire N__11034;
    wire N__11033;
    wire N__11030;
    wire N__11027;
    wire N__11024;
    wire N__11021;
    wire N__11016;
    wire N__11011;
    wire N__11008;
    wire N__11005;
    wire N__11002;
    wire N__10999;
    wire N__10998;
    wire N__10997;
    wire N__10996;
    wire N__10987;
    wire N__10986;
    wire N__10985;
    wire N__10984;
    wire N__10983;
    wire N__10982;
    wire N__10981;
    wire N__10980;
    wire N__10977;
    wire N__10974;
    wire N__10971;
    wire N__10968;
    wire N__10965;
    wire N__10964;
    wire N__10961;
    wire N__10960;
    wire N__10957;
    wire N__10956;
    wire N__10955;
    wire N__10954;
    wire N__10953;
    wire N__10950;
    wire N__10947;
    wire N__10944;
    wire N__10939;
    wire N__10932;
    wire N__10919;
    wire N__10906;
    wire N__10905;
    wire N__10904;
    wire N__10903;
    wire N__10902;
    wire N__10901;
    wire N__10900;
    wire N__10899;
    wire N__10890;
    wire N__10889;
    wire N__10888;
    wire N__10887;
    wire N__10886;
    wire N__10885;
    wire N__10884;
    wire N__10881;
    wire N__10880;
    wire N__10877;
    wire N__10874;
    wire N__10871;
    wire N__10868;
    wire N__10857;
    wire N__10848;
    wire N__10837;
    wire N__10836;
    wire N__10833;
    wire N__10832;
    wire N__10831;
    wire N__10830;
    wire N__10829;
    wire N__10828;
    wire N__10827;
    wire N__10824;
    wire N__10823;
    wire N__10822;
    wire N__10819;
    wire N__10816;
    wire N__10815;
    wire N__10812;
    wire N__10809;
    wire N__10796;
    wire N__10793;
    wire N__10790;
    wire N__10783;
    wire N__10780;
    wire N__10775;
    wire N__10770;
    wire N__10767;
    wire N__10762;
    wire N__10759;
    wire N__10758;
    wire N__10755;
    wire N__10752;
    wire N__10749;
    wire N__10746;
    wire N__10743;
    wire N__10742;
    wire N__10737;
    wire N__10734;
    wire N__10729;
    wire N__10726;
    wire N__10723;
    wire N__10720;
    wire N__10717;
    wire N__10714;
    wire N__10711;
    wire N__10708;
    wire N__10705;
    wire N__10704;
    wire N__10701;
    wire N__10698;
    wire N__10695;
    wire N__10692;
    wire N__10687;
    wire N__10686;
    wire N__10683;
    wire N__10680;
    wire N__10677;
    wire N__10672;
    wire N__10669;
    wire N__10666;
    wire N__10663;
    wire N__10662;
    wire N__10661;
    wire N__10660;
    wire N__10657;
    wire N__10654;
    wire N__10651;
    wire N__10650;
    wire N__10647;
    wire N__10646;
    wire N__10645;
    wire N__10642;
    wire N__10637;
    wire N__10634;
    wire N__10631;
    wire N__10626;
    wire N__10625;
    wire N__10618;
    wire N__10613;
    wire N__10610;
    wire N__10607;
    wire N__10604;
    wire N__10597;
    wire N__10594;
    wire N__10593;
    wire N__10590;
    wire N__10587;
    wire N__10584;
    wire N__10581;
    wire N__10576;
    wire N__10573;
    wire N__10570;
    wire N__10567;
    wire N__10564;
    wire N__10561;
    wire N__10558;
    wire N__10557;
    wire N__10554;
    wire N__10551;
    wire N__10548;
    wire N__10545;
    wire N__10540;
    wire N__10537;
    wire N__10534;
    wire N__10531;
    wire N__10528;
    wire N__10525;
    wire N__10522;
    wire N__10519;
    wire N__10516;
    wire N__10513;
    wire N__10510;
    wire N__10507;
    wire N__10504;
    wire N__10501;
    wire N__10498;
    wire N__10495;
    wire N__10492;
    wire N__10489;
    wire N__10486;
    wire N__10483;
    wire N__10480;
    wire N__10477;
    wire N__10474;
    wire N__10471;
    wire N__10468;
    wire N__10465;
    wire N__10462;
    wire N__10459;
    wire N__10456;
    wire N__10453;
    wire N__10450;
    wire N__10449;
    wire N__10448;
    wire N__10447;
    wire N__10444;
    wire N__10441;
    wire N__10438;
    wire N__10435;
    wire N__10426;
    wire N__10423;
    wire N__10420;
    wire N__10417;
    wire N__10414;
    wire N__10411;
    wire N__10408;
    wire N__10405;
    wire N__10402;
    wire N__10399;
    wire N__10396;
    wire N__10393;
    wire N__10390;
    wire N__10387;
    wire N__10384;
    wire N__10381;
    wire N__10378;
    wire N__10375;
    wire N__10372;
    wire N__10369;
    wire N__10366;
    wire N__10363;
    wire N__10360;
    wire N__10357;
    wire N__10356;
    wire N__10355;
    wire N__10354;
    wire N__10351;
    wire N__10348;
    wire N__10345;
    wire N__10342;
    wire N__10333;
    wire N__10330;
    wire N__10327;
    wire N__10324;
    wire N__10321;
    wire N__10318;
    wire N__10315;
    wire N__10312;
    wire N__10309;
    wire N__10306;
    wire N__10303;
    wire N__10300;
    wire N__10297;
    wire N__10294;
    wire N__10291;
    wire N__10288;
    wire N__10285;
    wire N__10282;
    wire N__10279;
    wire N__10276;
    wire N__10273;
    wire N__10270;
    wire N__10269;
    wire N__10266;
    wire N__10263;
    wire N__10262;
    wire N__10259;
    wire N__10256;
    wire N__10253;
    wire N__10248;
    wire N__10245;
    wire N__10240;
    wire N__10237;
    wire N__10234;
    wire N__10231;
    wire N__10230;
    wire N__10229;
    wire N__10228;
    wire N__10225;
    wire N__10222;
    wire N__10217;
    wire N__10210;
    wire N__10207;
    wire N__10204;
    wire N__10201;
    wire N__10198;
    wire N__10195;
    wire N__10192;
    wire N__10189;
    wire N__10186;
    wire N__10183;
    wire N__10180;
    wire N__10177;
    wire N__10174;
    wire N__10171;
    wire N__10168;
    wire N__10165;
    wire N__10162;
    wire N__10159;
    wire N__10156;
    wire N__10153;
    wire N__10150;
    wire N__10147;
    wire N__10144;
    wire N__10143;
    wire N__10142;
    wire N__10139;
    wire N__10136;
    wire N__10133;
    wire N__10132;
    wire N__10129;
    wire N__10126;
    wire N__10123;
    wire N__10120;
    wire N__10111;
    wire N__10108;
    wire N__10105;
    wire N__10102;
    wire N__10099;
    wire N__10096;
    wire N__10093;
    wire N__10090;
    wire N__10087;
    wire N__10084;
    wire N__10081;
    wire N__10078;
    wire N__10075;
    wire N__10072;
    wire N__10069;
    wire N__10066;
    wire N__10063;
    wire N__10060;
    wire N__10057;
    wire N__10054;
    wire N__10051;
    wire N__10048;
    wire N__10045;
    wire N__10042;
    wire N__10039;
    wire N__10038;
    wire N__10037;
    wire N__10034;
    wire N__10031;
    wire N__10028;
    wire N__10025;
    wire N__10020;
    wire N__10019;
    wire N__10014;
    wire N__10011;
    wire N__10006;
    wire N__10003;
    wire N__10000;
    wire N__9997;
    wire N__9994;
    wire N__9991;
    wire N__9988;
    wire N__9987;
    wire N__9984;
    wire N__9981;
    wire N__9980;
    wire N__9977;
    wire N__9974;
    wire N__9971;
    wire N__9968;
    wire N__9965;
    wire N__9962;
    wire N__9955;
    wire N__9952;
    wire N__9949;
    wire N__9946;
    wire N__9943;
    wire N__9942;
    wire N__9939;
    wire N__9936;
    wire N__9933;
    wire N__9930;
    wire N__9927;
    wire N__9924;
    wire N__9919;
    wire N__9918;
    wire N__9915;
    wire N__9912;
    wire N__9911;
    wire N__9908;
    wire N__9905;
    wire N__9902;
    wire N__9901;
    wire N__9900;
    wire N__9899;
    wire N__9898;
    wire N__9895;
    wire N__9892;
    wire N__9889;
    wire N__9886;
    wire N__9883;
    wire N__9880;
    wire N__9877;
    wire N__9876;
    wire N__9873;
    wire N__9868;
    wire N__9865;
    wire N__9862;
    wire N__9859;
    wire N__9856;
    wire N__9853;
    wire N__9850;
    wire N__9847;
    wire N__9844;
    wire N__9841;
    wire N__9838;
    wire N__9833;
    wire N__9830;
    wire N__9827;
    wire N__9824;
    wire N__9817;
    wire N__9808;
    wire N__9807;
    wire N__9806;
    wire N__9803;
    wire N__9800;
    wire N__9797;
    wire N__9794;
    wire N__9791;
    wire N__9788;
    wire N__9785;
    wire N__9782;
    wire N__9779;
    wire N__9772;
    wire N__9769;
    wire N__9766;
    wire N__9763;
    wire N__9760;
    wire N__9757;
    wire N__9754;
    wire N__9751;
    wire N__9748;
    wire N__9745;
    wire N__9742;
    wire N__9739;
    wire N__9736;
    wire N__9735;
    wire N__9732;
    wire N__9729;
    wire N__9728;
    wire N__9727;
    wire N__9726;
    wire N__9721;
    wire N__9718;
    wire N__9715;
    wire N__9712;
    wire N__9707;
    wire N__9704;
    wire N__9701;
    wire N__9698;
    wire N__9695;
    wire N__9690;
    wire N__9687;
    wire N__9684;
    wire N__9679;
    wire N__9676;
    wire N__9673;
    wire N__9670;
    wire N__9667;
    wire N__9664;
    wire N__9661;
    wire N__9658;
    wire N__9655;
    wire N__9652;
    wire N__9649;
    wire N__9646;
    wire N__9643;
    wire N__9640;
    wire N__9637;
    wire N__9634;
    wire N__9631;
    wire N__9628;
    wire N__9625;
    wire N__9622;
    wire N__9619;
    wire N__9616;
    wire N__9613;
    wire N__9610;
    wire N__9607;
    wire N__9604;
    wire N__9601;
    wire N__9600;
    wire N__9599;
    wire N__9596;
    wire N__9591;
    wire N__9588;
    wire N__9585;
    wire N__9582;
    wire N__9579;
    wire N__9574;
    wire N__9571;
    wire N__9568;
    wire N__9565;
    wire N__9562;
    wire N__9559;
    wire N__9556;
    wire N__9553;
    wire N__9550;
    wire N__9547;
    wire N__9544;
    wire N__9543;
    wire N__9542;
    wire N__9539;
    wire N__9534;
    wire N__9531;
    wire N__9528;
    wire N__9523;
    wire N__9520;
    wire N__9517;
    wire N__9514;
    wire N__9511;
    wire N__9508;
    wire N__9507;
    wire N__9506;
    wire N__9503;
    wire N__9500;
    wire N__9497;
    wire N__9494;
    wire N__9489;
    wire N__9484;
    wire N__9481;
    wire N__9478;
    wire N__9475;
    wire N__9472;
    wire N__9469;
    wire N__9466;
    wire N__9463;
    wire N__9462;
    wire N__9461;
    wire N__9460;
    wire N__9459;
    wire N__9458;
    wire N__9457;
    wire N__9456;
    wire N__9455;
    wire N__9446;
    wire N__9445;
    wire N__9436;
    wire N__9435;
    wire N__9432;
    wire N__9431;
    wire N__9430;
    wire N__9429;
    wire N__9428;
    wire N__9427;
    wire N__9426;
    wire N__9425;
    wire N__9424;
    wire N__9423;
    wire N__9422;
    wire N__9421;
    wire N__9420;
    wire N__9419;
    wire N__9418;
    wire N__9415;
    wire N__9412;
    wire N__9409;
    wire N__9400;
    wire N__9391;
    wire N__9382;
    wire N__9381;
    wire N__9380;
    wire N__9379;
    wire N__9378;
    wire N__9377;
    wire N__9376;
    wire N__9375;
    wire N__9366;
    wire N__9361;
    wire N__9352;
    wire N__9345;
    wire N__9336;
    wire N__9325;
    wire N__9324;
    wire N__9323;
    wire N__9318;
    wire N__9315;
    wire N__9312;
    wire N__9307;
    wire N__9304;
    wire N__9303;
    wire N__9302;
    wire N__9301;
    wire N__9300;
    wire N__9299;
    wire N__9298;
    wire N__9297;
    wire N__9296;
    wire N__9295;
    wire N__9294;
    wire N__9293;
    wire N__9284;
    wire N__9275;
    wire N__9268;
    wire N__9265;
    wire N__9264;
    wire N__9263;
    wire N__9262;
    wire N__9261;
    wire N__9260;
    wire N__9259;
    wire N__9258;
    wire N__9257;
    wire N__9256;
    wire N__9255;
    wire N__9254;
    wire N__9253;
    wire N__9252;
    wire N__9251;
    wire N__9250;
    wire N__9249;
    wire N__9248;
    wire N__9247;
    wire N__9244;
    wire N__9237;
    wire N__9230;
    wire N__9221;
    wire N__9212;
    wire N__9209;
    wire N__9202;
    wire N__9199;
    wire N__9198;
    wire N__9197;
    wire N__9192;
    wire N__9189;
    wire N__9180;
    wire N__9173;
    wire N__9168;
    wire N__9165;
    wire N__9162;
    wire N__9159;
    wire N__9154;
    wire N__9151;
    wire N__9148;
    wire N__9145;
    wire N__9142;
    wire N__9139;
    wire N__9130;
    wire N__9127;
    wire N__9126;
    wire N__9125;
    wire N__9124;
    wire N__9123;
    wire N__9122;
    wire N__9121;
    wire N__9120;
    wire N__9119;
    wire N__9118;
    wire N__9117;
    wire N__9116;
    wire N__9115;
    wire N__9114;
    wire N__9113;
    wire N__9112;
    wire N__9111;
    wire N__9110;
    wire N__9109;
    wire N__9100;
    wire N__9093;
    wire N__9090;
    wire N__9089;
    wire N__9088;
    wire N__9087;
    wire N__9086;
    wire N__9085;
    wire N__9084;
    wire N__9083;
    wire N__9082;
    wire N__9081;
    wire N__9076;
    wire N__9067;
    wire N__9058;
    wire N__9055;
    wire N__9052;
    wire N__9049;
    wire N__9046;
    wire N__9037;
    wire N__9032;
    wire N__9025;
    wire N__9016;
    wire N__9015;
    wire N__9014;
    wire N__9013;
    wire N__9012;
    wire N__9009;
    wire N__8998;
    wire N__8995;
    wire N__8986;
    wire N__8983;
    wire N__8980;
    wire N__8975;
    wire N__8972;
    wire N__8967;
    wire N__8962;
    wire N__8959;
    wire N__8956;
    wire N__8953;
    wire N__8950;
    wire N__8947;
    wire N__8944;
    wire N__8943;
    wire N__8940;
    wire N__8939;
    wire N__8936;
    wire N__8935;
    wire N__8932;
    wire N__8929;
    wire N__8926;
    wire N__8923;
    wire N__8918;
    wire N__8915;
    wire N__8908;
    wire N__8905;
    wire N__8902;
    wire N__8899;
    wire N__8896;
    wire N__8893;
    wire N__8890;
    wire N__8887;
    wire N__8886;
    wire N__8883;
    wire N__8880;
    wire N__8877;
    wire N__8872;
    wire N__8869;
    wire N__8868;
    wire N__8867;
    wire N__8866;
    wire N__8863;
    wire N__8858;
    wire N__8855;
    wire N__8850;
    wire N__8849;
    wire N__8846;
    wire N__8843;
    wire N__8840;
    wire N__8833;
    wire N__8830;
    wire N__8829;
    wire N__8826;
    wire N__8825;
    wire N__8822;
    wire N__8819;
    wire N__8816;
    wire N__8813;
    wire N__8808;
    wire N__8805;
    wire N__8802;
    wire N__8797;
    wire N__8796;
    wire N__8795;
    wire N__8792;
    wire N__8789;
    wire N__8786;
    wire N__8783;
    wire N__8780;
    wire N__8777;
    wire N__8772;
    wire N__8769;
    wire N__8764;
    wire N__8761;
    wire N__8760;
    wire N__8757;
    wire N__8756;
    wire N__8753;
    wire N__8750;
    wire N__8749;
    wire N__8746;
    wire N__8743;
    wire N__8740;
    wire N__8737;
    wire N__8734;
    wire N__8731;
    wire N__8728;
    wire N__8723;
    wire N__8716;
    wire N__8713;
    wire N__8710;
    wire N__8707;
    wire N__8704;
    wire N__8701;
    wire N__8698;
    wire N__8695;
    wire N__8692;
    wire N__8689;
    wire N__8686;
    wire N__8683;
    wire N__8680;
    wire N__8677;
    wire N__8676;
    wire N__8675;
    wire N__8672;
    wire N__8667;
    wire N__8666;
    wire N__8665;
    wire N__8664;
    wire N__8663;
    wire N__8660;
    wire N__8657;
    wire N__8654;
    wire N__8651;
    wire N__8646;
    wire N__8643;
    wire N__8640;
    wire N__8637;
    wire N__8632;
    wire N__8623;
    wire N__8620;
    wire N__8619;
    wire N__8616;
    wire N__8613;
    wire N__8610;
    wire N__8607;
    wire N__8606;
    wire N__8601;
    wire N__8598;
    wire N__8593;
    wire N__8590;
    wire N__8587;
    wire N__8584;
    wire N__8581;
    wire N__8578;
    wire N__8575;
    wire N__8572;
    wire N__8569;
    wire N__8568;
    wire N__8565;
    wire N__8562;
    wire N__8561;
    wire N__8560;
    wire N__8559;
    wire N__8556;
    wire N__8553;
    wire N__8550;
    wire N__8547;
    wire N__8544;
    wire N__8541;
    wire N__8538;
    wire N__8535;
    wire N__8530;
    wire N__8521;
    wire N__8518;
    wire N__8515;
    wire N__8514;
    wire N__8513;
    wire N__8512;
    wire N__8511;
    wire N__8510;
    wire N__8507;
    wire N__8504;
    wire N__8501;
    wire N__8498;
    wire N__8493;
    wire N__8490;
    wire N__8485;
    wire N__8482;
    wire N__8473;
    wire N__8470;
    wire N__8467;
    wire N__8466;
    wire N__8465;
    wire N__8462;
    wire N__8459;
    wire N__8456;
    wire N__8453;
    wire N__8450;
    wire N__8443;
    wire N__8440;
    wire N__8439;
    wire N__8438;
    wire N__8435;
    wire N__8432;
    wire N__8429;
    wire N__8426;
    wire N__8423;
    wire N__8416;
    wire N__8415;
    wire N__8414;
    wire N__8411;
    wire N__8408;
    wire N__8405;
    wire N__8404;
    wire N__8401;
    wire N__8400;
    wire N__8397;
    wire N__8394;
    wire N__8391;
    wire N__8388;
    wire N__8385;
    wire N__8382;
    wire N__8379;
    wire N__8376;
    wire N__8371;
    wire N__8368;
    wire N__8365;
    wire N__8362;
    wire N__8353;
    wire N__8350;
    wire N__8347;
    wire N__8344;
    wire N__8341;
    wire N__8340;
    wire N__8339;
    wire N__8338;
    wire N__8337;
    wire N__8336;
    wire N__8333;
    wire N__8326;
    wire N__8323;
    wire N__8322;
    wire N__8321;
    wire N__8320;
    wire N__8319;
    wire N__8316;
    wire N__8313;
    wire N__8310;
    wire N__8307;
    wire N__8302;
    wire N__8297;
    wire N__8294;
    wire N__8281;
    wire N__8278;
    wire N__8277;
    wire N__8274;
    wire N__8271;
    wire N__8266;
    wire N__8263;
    wire N__8260;
    wire N__8257;
    wire N__8254;
    wire N__8253;
    wire N__8250;
    wire N__8247;
    wire N__8244;
    wire N__8241;
    wire N__8236;
    wire N__8233;
    wire N__8230;
    wire N__8227;
    wire N__8224;
    wire N__8221;
    wire N__8218;
    wire N__8215;
    wire N__8212;
    wire N__8211;
    wire N__8208;
    wire N__8205;
    wire N__8204;
    wire N__8203;
    wire N__8200;
    wire N__8197;
    wire N__8196;
    wire N__8195;
    wire N__8194;
    wire N__8191;
    wire N__8190;
    wire N__8187;
    wire N__8184;
    wire N__8181;
    wire N__8176;
    wire N__8169;
    wire N__8158;
    wire N__8155;
    wire N__8152;
    wire N__8149;
    wire N__8146;
    wire N__8143;
    wire N__8140;
    wire N__8137;
    wire N__8134;
    wire N__8131;
    wire N__8128;
    wire N__8125;
    wire N__8122;
    wire N__8119;
    wire N__8116;
    wire N__8113;
    wire N__8110;
    wire N__8107;
    wire N__8104;
    wire N__8101;
    wire N__8098;
    wire N__8095;
    wire N__8092;
    wire N__8091;
    wire N__8090;
    wire N__8087;
    wire N__8082;
    wire N__8079;
    wire N__8076;
    wire N__8071;
    wire N__8068;
    wire N__8065;
    wire N__8062;
    wire N__8059;
    wire N__8056;
    wire N__8053;
    wire N__8050;
    wire N__8047;
    wire N__8044;
    wire N__8041;
    wire N__8038;
    wire N__8035;
    wire N__8032;
    wire N__8031;
    wire N__8028;
    wire N__8025;
    wire N__8022;
    wire N__8019;
    wire N__8016;
    wire N__8011;
    wire N__8008;
    wire N__8005;
    wire N__8002;
    wire N__7999;
    wire N__7996;
    wire N__7993;
    wire N__7990;
    wire N__7989;
    wire N__7986;
    wire N__7983;
    wire N__7980;
    wire N__7977;
    wire N__7974;
    wire N__7969;
    wire N__7966;
    wire N__7963;
    wire N__7960;
    wire N__7957;
    wire N__7954;
    wire N__7951;
    wire N__7948;
    wire N__7947;
    wire N__7944;
    wire N__7941;
    wire N__7938;
    wire N__7935;
    wire N__7932;
    wire N__7929;
    wire N__7926;
    wire N__7921;
    wire N__7918;
    wire N__7915;
    wire N__7912;
    wire N__7909;
    wire N__7906;
    wire N__7903;
    wire N__7902;
    wire N__7899;
    wire N__7896;
    wire N__7893;
    wire N__7890;
    wire N__7887;
    wire N__7882;
    wire N__7881;
    wire N__7878;
    wire N__7877;
    wire N__7876;
    wire N__7875;
    wire N__7874;
    wire N__7873;
    wire N__7870;
    wire N__7869;
    wire N__7866;
    wire N__7861;
    wire N__7850;
    wire N__7843;
    wire N__7840;
    wire N__7837;
    wire N__7834;
    wire N__7831;
    wire N__7828;
    wire N__7827;
    wire N__7826;
    wire N__7825;
    wire N__7824;
    wire N__7823;
    wire N__7822;
    wire N__7821;
    wire N__7810;
    wire N__7805;
    wire N__7802;
    wire N__7795;
    wire N__7792;
    wire N__7789;
    wire N__7786;
    wire N__7783;
    wire N__7780;
    wire N__7777;
    wire N__7774;
    wire N__7771;
    wire N__7768;
    wire N__7765;
    wire N__7762;
    wire N__7759;
    wire N__7756;
    wire N__7753;
    wire N__7750;
    wire N__7749;
    wire N__7748;
    wire N__7745;
    wire N__7740;
    wire N__7737;
    wire N__7734;
    wire N__7729;
    wire N__7726;
    wire N__7723;
    wire N__7720;
    wire N__7717;
    wire N__7714;
    wire N__7711;
    wire N__7708;
    wire N__7705;
    wire N__7702;
    wire N__7699;
    wire N__7696;
    wire N__7695;
    wire N__7692;
    wire N__7691;
    wire N__7688;
    wire N__7685;
    wire N__7682;
    wire N__7679;
    wire N__7674;
    wire N__7669;
    wire N__7666;
    wire N__7663;
    wire N__7660;
    wire N__7657;
    wire N__7654;
    wire N__7651;
    wire N__7648;
    wire N__7645;
    wire N__7642;
    wire N__7639;
    wire N__7638;
    wire N__7637;
    wire N__7634;
    wire N__7629;
    wire N__7626;
    wire N__7623;
    wire N__7618;
    wire N__7615;
    wire N__7612;
    wire N__7609;
    wire N__7606;
    wire N__7603;
    wire N__7600;
    wire N__7597;
    wire N__7594;
    wire N__7591;
    wire N__7588;
    wire N__7585;
    wire N__7582;
    wire N__7581;
    wire N__7580;
    wire N__7577;
    wire N__7572;
    wire N__7569;
    wire N__7566;
    wire N__7561;
    wire N__7558;
    wire N__7555;
    wire N__7552;
    wire N__7549;
    wire N__7546;
    wire N__7545;
    wire N__7544;
    wire N__7541;
    wire N__7538;
    wire N__7535;
    wire N__7530;
    wire N__7525;
    wire N__7522;
    wire N__7519;
    wire N__7516;
    wire N__7513;
    wire N__7510;
    wire N__7507;
    wire N__7504;
    wire N__7501;
    wire N__7498;
    wire N__7495;
    wire N__7492;
    wire N__7489;
    wire N__7486;
    wire N__7483;
    wire N__7480;
    wire N__7477;
    wire N__7474;
    wire N__7471;
    wire N__7468;
    wire N__7465;
    wire N__7462;
    wire N__7459;
    wire N__7456;
    wire N__7453;
    wire N__7450;
    wire N__7447;
    wire N__7444;
    wire N__7441;
    wire N__7438;
    wire N__7435;
    wire N__7432;
    wire N__7429;
    wire N__7428;
    wire N__7427;
    wire N__7424;
    wire N__7419;
    wire N__7416;
    wire N__7413;
    wire N__7408;
    wire N__7405;
    wire N__7402;
    wire N__7399;
    wire N__7396;
    wire N__7393;
    wire N__7390;
    wire N__7387;
    wire N__7384;
    wire N__7381;
    wire N__7378;
    wire N__7377;
    wire N__7376;
    wire N__7373;
    wire N__7368;
    wire N__7365;
    wire N__7362;
    wire N__7357;
    wire N__7354;
    wire N__7351;
    wire N__7348;
    wire N__7345;
    wire N__7342;
    wire N__7339;
    wire N__7336;
    wire N__7333;
    wire N__7330;
    wire N__7327;
    wire N__7326;
    wire N__7325;
    wire N__7322;
    wire N__7319;
    wire N__7316;
    wire N__7309;
    wire N__7306;
    wire N__7303;
    wire N__7300;
    wire N__7297;
    wire N__7294;
    wire N__7291;
    wire N__7288;
    wire N__7285;
    wire N__7282;
    wire N__7281;
    wire N__7280;
    wire N__7277;
    wire N__7272;
    wire N__7267;
    wire N__7264;
    wire N__7261;
    wire N__7258;
    wire N__7255;
    wire N__7252;
    wire N__7249;
    wire N__7246;
    wire N__7243;
    wire N__7240;
    wire N__7237;
    wire N__7234;
    wire N__7231;
    wire N__7228;
    wire N__7225;
    wire N__7222;
    wire N__7219;
    wire N__7216;
    wire N__7213;
    wire N__7210;
    wire N__7207;
    wire N__7204;
    wire N__7201;
    wire N__7198;
    wire N__7195;
    wire N__7192;
    wire N__7189;
    wire N__7188;
    wire N__7187;
    wire N__7184;
    wire N__7179;
    wire N__7174;
    wire N__7171;
    wire N__7168;
    wire N__7165;
    wire N__7162;
    wire N__7159;
    wire N__7156;
    wire N__7153;
    wire N__7150;
    wire N__7147;
    wire N__7144;
    wire N__7143;
    wire N__7142;
    wire N__7139;
    wire N__7132;
    wire N__7131;
    wire N__7128;
    wire N__7127;
    wire N__7126;
    wire N__7123;
    wire N__7120;
    wire N__7115;
    wire N__7112;
    wire N__7105;
    wire N__7102;
    wire N__7101;
    wire N__7100;
    wire N__7093;
    wire N__7090;
    wire N__7087;
    wire N__7084;
    wire N__7081;
    wire N__7078;
    wire N__7075;
    wire N__7072;
    wire N__7069;
    wire N__7066;
    wire N__7063;
    wire N__7060;
    wire N__7057;
    wire N__7054;
    wire N__7051;
    wire N__7048;
    wire N__7045;
    wire N__7042;
    wire N__7039;
    wire N__7036;
    wire N__7033;
    wire N__7030;
    wire N__7027;
    wire N__7024;
    wire N__7021;
    wire N__7018;
    wire N__7015;
    wire N__7012;
    wire N__7009;
    wire N__7006;
    wire N__7003;
    wire N__7000;
    wire N__6997;
    wire N__6994;
    wire N__6991;
    wire N__6988;
    wire N__6985;
    wire N__6982;
    wire N__6979;
    wire N__6976;
    wire N__6973;
    wire N__6970;
    wire N__6969;
    wire N__6966;
    wire N__6963;
    wire N__6962;
    wire N__6961;
    wire N__6958;
    wire N__6955;
    wire N__6950;
    wire N__6943;
    wire N__6940;
    wire N__6937;
    wire N__6934;
    wire N__6931;
    wire N__6928;
    wire N__6925;
    wire N__6924;
    wire N__6921;
    wire N__6918;
    wire N__6915;
    wire N__6914;
    wire N__6913;
    wire N__6910;
    wire N__6907;
    wire N__6904;
    wire N__6901;
    wire N__6892;
    wire N__6889;
    wire N__6886;
    wire N__6883;
    wire N__6880;
    wire N__6877;
    wire N__6874;
    wire N__6871;
    wire N__6868;
    wire N__6865;
    wire N__6862;
    wire N__6861;
    wire N__6858;
    wire N__6855;
    wire N__6852;
    wire N__6849;
    wire N__6846;
    wire N__6843;
    wire N__6840;
    wire N__6835;
    wire N__6832;
    wire N__6829;
    wire N__6826;
    wire N__6823;
    wire N__6820;
    wire N__6817;
    wire N__6814;
    wire N__6811;
    wire N__6808;
    wire N__6805;
    wire N__6802;
    wire N__6799;
    wire N__6796;
    wire N__6793;
    wire N__6790;
    wire N__6787;
    wire N__6784;
    wire N__6781;
    wire N__6778;
    wire N__6775;
    wire N__6772;
    wire N__6769;
    wire N__6766;
    wire N__6763;
    wire N__6760;
    wire N__6757;
    wire N__6754;
    wire N__6751;
    wire N__6748;
    wire N__6745;
    wire N__6742;
    wire N__6739;
    wire N__6736;
    wire N__6733;
    wire N__6730;
    wire N__6727;
    wire N__6724;
    wire N__6721;
    wire N__6718;
    wire N__6715;
    wire N__6712;
    wire N__6709;
    wire N__6708;
    wire N__6705;
    wire N__6702;
    wire N__6697;
    wire N__6696;
    wire N__6691;
    wire N__6688;
    wire N__6685;
    wire N__6682;
    wire N__6681;
    wire N__6680;
    wire N__6679;
    wire N__6678;
    wire N__6675;
    wire N__6672;
    wire N__6669;
    wire N__6666;
    wire N__6663;
    wire N__6660;
    wire N__6655;
    wire N__6652;
    wire N__6649;
    wire N__6646;
    wire N__6639;
    wire N__6634;
    wire N__6633;
    wire N__6630;
    wire N__6627;
    wire N__6624;
    wire N__6621;
    wire N__6618;
    wire N__6617;
    wire N__6614;
    wire N__6611;
    wire N__6608;
    wire N__6605;
    wire N__6602;
    wire N__6599;
    wire N__6596;
    wire N__6591;
    wire N__6586;
    wire N__6583;
    wire N__6580;
    wire N__6579;
    wire N__6576;
    wire N__6573;
    wire N__6568;
    wire N__6565;
    wire N__6562;
    wire N__6559;
    wire N__6556;
    wire N__6553;
    wire N__6550;
    wire N__6547;
    wire N__6544;
    wire N__6541;
    wire N__6540;
    wire N__6537;
    wire N__6534;
    wire N__6531;
    wire N__6528;
    wire N__6525;
    wire N__6522;
    wire N__6517;
    wire N__6514;
    wire N__6511;
    wire N__6508;
    wire N__6505;
    wire N__6504;
    wire N__6503;
    wire N__6500;
    wire N__6497;
    wire N__6492;
    wire N__6487;
    wire N__6484;
    wire N__6481;
    wire N__6478;
    wire N__6475;
    wire N__6472;
    wire N__6471;
    wire N__6470;
    wire N__6467;
    wire N__6462;
    wire N__6457;
    wire N__6454;
    wire N__6451;
    wire N__6448;
    wire N__6445;
    wire N__6442;
    wire N__6439;
    wire N__6436;
    wire N__6433;
    wire N__6430;
    wire N__6427;
    wire N__6424;
    wire N__6421;
    wire N__6420;
    wire N__6419;
    wire N__6416;
    wire N__6411;
    wire N__6406;
    wire N__6403;
    wire N__6400;
    wire N__6397;
    wire N__6394;
    wire N__6391;
    wire N__6388;
    wire N__6385;
    wire N__6382;
    wire N__6379;
    wire N__6376;
    wire N__6373;
    wire N__6370;
    wire N__6367;
    wire N__6364;
    wire N__6361;
    wire N__6358;
    wire N__6355;
    wire N__6352;
    wire N__6349;
    wire N__6346;
    wire N__6343;
    wire N__6340;
    wire N__6337;
    wire N__6334;
    wire N__6331;
    wire N__6328;
    wire N__6325;
    wire N__6322;
    wire N__6319;
    wire N__6316;
    wire N__6313;
    wire N__6312;
    wire N__6309;
    wire N__6306;
    wire N__6303;
    wire N__6298;
    wire N__6295;
    wire N__6292;
    wire N__6289;
    wire N__6286;
    wire N__6283;
    wire N__6280;
    wire N__6277;
    wire N__6274;
    wire N__6271;
    wire N__6268;
    wire N__6265;
    wire N__6262;
    wire N__6261;
    wire N__6258;
    wire N__6255;
    wire N__6252;
    wire N__6249;
    wire N__6246;
    wire N__6241;
    wire N__6238;
    wire N__6235;
    wire N__6232;
    wire N__6229;
    wire N__6226;
    wire N__6223;
    wire N__6220;
    wire N__6217;
    wire N__6216;
    wire N__6213;
    wire N__6210;
    wire N__6207;
    wire N__6202;
    wire N__6199;
    wire N__6196;
    wire N__6193;
    wire N__6192;
    wire N__6189;
    wire N__6186;
    wire N__6183;
    wire N__6180;
    wire N__6175;
    wire N__6172;
    wire N__6171;
    wire N__6170;
    wire N__6169;
    wire N__6168;
    wire N__6167;
    wire N__6166;
    wire N__6165;
    wire N__6162;
    wire N__6147;
    wire N__6146;
    wire N__6145;
    wire N__6144;
    wire N__6143;
    wire N__6138;
    wire N__6129;
    wire N__6126;
    wire N__6121;
    wire N__6120;
    wire N__6119;
    wire N__6112;
    wire N__6109;
    wire N__6106;
    wire N__6103;
    wire N__6100;
    wire N__6097;
    wire N__6094;
    wire N__6093;
    wire N__6092;
    wire N__6091;
    wire N__6090;
    wire N__6089;
    wire N__6088;
    wire N__6085;
    wire N__6082;
    wire N__6079;
    wire N__6078;
    wire N__6075;
    wire N__6072;
    wire N__6069;
    wire N__6066;
    wire N__6065;
    wire N__6064;
    wire N__6063;
    wire N__6062;
    wire N__6061;
    wire N__6058;
    wire N__6057;
    wire N__6056;
    wire N__6055;
    wire N__6046;
    wire N__6037;
    wire N__6034;
    wire N__6031;
    wire N__6028;
    wire N__6025;
    wire N__6022;
    wire N__6015;
    wire N__6010;
    wire N__6005;
    wire N__6000;
    wire N__5997;
    wire N__5986;
    wire N__5983;
    wire N__5980;
    wire N__5977;
    wire N__5974;
    wire N__5971;
    wire N__5968;
    wire N__5965;
    wire N__5962;
    wire N__5959;
    wire N__5956;
    wire N__5953;
    wire N__5950;
    wire N__5947;
    wire N__5944;
    wire N__5941;
    wire N__5938;
    wire N__5935;
    wire N__5932;
    wire N__5931;
    wire N__5930;
    wire N__5927;
    wire N__5922;
    wire N__5917;
    wire N__5914;
    wire N__5911;
    wire N__5908;
    wire N__5905;
    wire N__5902;
    wire N__5899;
    wire N__5896;
    wire N__5893;
    wire N__5890;
    wire N__5887;
    wire N__5884;
    wire N__5883;
    wire N__5880;
    wire N__5877;
    wire N__5874;
    wire N__5871;
    wire N__5868;
    wire N__5865;
    wire N__5862;
    wire N__5859;
    wire N__5854;
    wire N__5851;
    wire N__5848;
    wire N__5847;
    wire N__5844;
    wire N__5841;
    wire N__5838;
    wire N__5835;
    wire N__5830;
    wire N__5827;
    wire N__5824;
    wire N__5821;
    wire N__5820;
    wire N__5817;
    wire N__5814;
    wire N__5811;
    wire N__5808;
    wire N__5805;
    wire N__5802;
    wire N__5797;
    wire N__5796;
    wire N__5793;
    wire N__5790;
    wire N__5787;
    wire N__5784;
    wire N__5781;
    wire N__5778;
    wire N__5775;
    wire N__5772;
    wire N__5769;
    wire N__5766;
    wire N__5761;
    wire N__5758;
    wire N__5755;
    wire N__5754;
    wire N__5751;
    wire N__5748;
    wire N__5745;
    wire N__5742;
    wire N__5739;
    wire N__5736;
    wire N__5731;
    wire N__5728;
    wire N__5725;
    wire N__5724;
    wire N__5721;
    wire N__5718;
    wire N__5715;
    wire N__5712;
    wire N__5709;
    wire N__5706;
    wire N__5701;
    wire N__5698;
    wire N__5695;
    wire N__5694;
    wire N__5691;
    wire N__5688;
    wire N__5685;
    wire N__5682;
    wire N__5679;
    wire N__5676;
    wire N__5671;
    wire N__5668;
    wire N__5665;
    wire N__5662;
    wire N__5661;
    wire N__5658;
    wire N__5655;
    wire N__5652;
    wire N__5649;
    wire N__5644;
    wire N__5641;
    wire N__5638;
    wire N__5637;
    wire N__5634;
    wire N__5631;
    wire N__5628;
    wire N__5625;
    wire N__5622;
    wire N__5619;
    wire N__5614;
    wire N__5611;
    wire N__5610;
    wire N__5607;
    wire N__5604;
    wire N__5601;
    wire N__5598;
    wire N__5595;
    wire N__5592;
    wire N__5587;
    wire N__5586;
    wire N__5583;
    wire N__5580;
    wire N__5577;
    wire N__5574;
    wire N__5571;
    wire N__5568;
    wire N__5563;
    wire N__5560;
    wire N__5557;
    wire N__5556;
    wire N__5553;
    wire N__5550;
    wire N__5547;
    wire N__5544;
    wire N__5541;
    wire N__5538;
    wire N__5533;
    wire N__5530;
    wire N__5527;
    wire N__5526;
    wire N__5523;
    wire N__5520;
    wire N__5517;
    wire N__5514;
    wire N__5511;
    wire N__5508;
    wire N__5503;
    wire N__5500;
    wire N__5499;
    wire N__5496;
    wire N__5493;
    wire N__5490;
    wire N__5487;
    wire N__5484;
    wire N__5479;
    wire N__5476;
    wire N__5473;
    wire N__5472;
    wire N__5471;
    wire N__5470;
    wire N__5469;
    wire N__5468;
    wire N__5467;
    wire N__5466;
    wire N__5457;
    wire N__5448;
    wire N__5443;
    wire N__5442;
    wire N__5441;
    wire N__5440;
    wire N__5439;
    wire N__5438;
    wire N__5435;
    wire N__5434;
    wire N__5431;
    wire N__5428;
    wire N__5425;
    wire N__5422;
    wire N__5421;
    wire N__5416;
    wire N__5411;
    wire N__5408;
    wire N__5401;
    wire N__5392;
    wire N__5391;
    wire N__5388;
    wire N__5385;
    wire N__5382;
    wire N__5379;
    wire N__5376;
    wire N__5373;
    wire N__5370;
    wire N__5367;
    wire N__5362;
    wire N__5359;
    wire N__5356;
    wire N__5353;
    wire N__5352;
    wire N__5349;
    wire N__5346;
    wire N__5343;
    wire N__5340;
    wire N__5335;
    wire N__5332;
    wire N__5329;
    wire N__5326;
    wire N__5323;
    wire N__5320;
    wire N__5317;
    wire N__5314;
    wire N__5313;
    wire N__5310;
    wire N__5307;
    wire N__5304;
    wire N__5301;
    wire N__5298;
    wire N__5295;
    wire N__5290;
    wire N__5287;
    wire N__5284;
    wire N__5281;
    wire N__5278;
    wire N__5275;
    wire N__5274;
    wire N__5271;
    wire N__5268;
    wire N__5263;
    wire N__5260;
    wire N__5257;
    wire N__5254;
    wire N__5251;
    wire N__5248;
    wire N__5245;
    wire N__5244;
    wire N__5241;
    wire N__5236;
    wire N__5233;
    wire N__5230;
    wire N__5227;
    wire N__5224;
    wire N__5223;
    wire N__5220;
    wire N__5217;
    wire N__5214;
    wire N__5211;
    wire N__5206;
    wire N__5203;
    wire N__5200;
    wire N__5197;
    wire N__5194;
    wire N__5191;
    wire N__5188;
    wire N__5187;
    wire N__5184;
    wire N__5181;
    wire N__5176;
    wire N__5173;
    wire N__5170;
    wire N__5167;
    wire N__5164;
    wire N__5161;
    wire N__5158;
    wire N__5155;
    wire N__5152;
    wire N__5151;
    wire N__5150;
    wire N__5149;
    wire N__5148;
    wire N__5147;
    wire N__5146;
    wire N__5145;
    wire N__5144;
    wire N__5143;
    wire N__5142;
    wire N__5133;
    wire N__5130;
    wire N__5121;
    wire N__5120;
    wire N__5119;
    wire N__5118;
    wire N__5117;
    wire N__5116;
    wire N__5115;
    wire N__5114;
    wire N__5113;
    wire N__5112;
    wire N__5111;
    wire N__5110;
    wire N__5109;
    wire N__5108;
    wire N__5107;
    wire N__5106;
    wire N__5105;
    wire N__5100;
    wire N__5099;
    wire N__5098;
    wire N__5097;
    wire N__5096;
    wire N__5095;
    wire N__5092;
    wire N__5087;
    wire N__5078;
    wire N__5069;
    wire N__5060;
    wire N__5051;
    wire N__5048;
    wire N__5043;
    wire N__5036;
    wire N__5033;
    wire N__5030;
    wire N__5025;
    wire N__5020;
    wire N__5017;
    wire N__5012;
    wire N__5009;
    wire N__5004;
    wire N__5001;
    wire N__4998;
    wire N__4995;
    wire N__4990;
    wire N__4987;
    wire N__4982;
    wire N__4979;
    wire N__4976;
    wire N__4973;
    wire N__4966;
    wire N__4963;
    wire N__4960;
    wire N__4957;
    wire N__4954;
    wire N__4951;
    wire N__4950;
    wire N__4947;
    wire N__4944;
    wire N__4941;
    wire N__4938;
    wire N__4933;
    wire N__4930;
    wire N__4927;
    wire N__4924;
    wire N__4921;
    wire N__4918;
    wire N__4915;
    wire N__4912;
    wire N__4909;
    wire N__4906;
    wire N__4903;
    wire N__4900;
    wire N__4897;
    wire N__4894;
    wire N__4891;
    wire N__4888;
    wire N__4885;
    wire N__4882;
    wire N__4879;
    wire N__4876;
    wire N__4873;
    wire N__4870;
    wire N__4867;
    wire N__4864;
    wire N__4861;
    wire N__4858;
    wire N__4855;
    wire N__4852;
    wire N__4849;
    wire N__4846;
    wire N__4843;
    wire N__4840;
    wire N__4837;
    wire N__4834;
    wire N__4831;
    wire N__4828;
    wire N__4825;
    wire N__4822;
    wire N__4819;
    wire N__4816;
    wire N__4813;
    wire N__4810;
    wire N__4807;
    wire N__4804;
    wire N__4801;
    wire N__4798;
    wire N__4795;
    wire N__4792;
    wire N__4789;
    wire N__4786;
    wire N__4783;
    wire N__4782;
    wire N__4779;
    wire N__4776;
    wire N__4771;
    wire N__4768;
    wire N__4767;
    wire N__4764;
    wire N__4761;
    wire N__4756;
    wire N__4755;
    wire N__4752;
    wire N__4749;
    wire N__4746;
    wire N__4741;
    wire N__4740;
    wire N__4737;
    wire N__4734;
    wire N__4729;
    wire N__4726;
    wire N__4723;
    wire N__4720;
    wire N__4717;
    wire N__4714;
    wire N__4711;
    wire N__4708;
    wire N__4705;
    wire N__4702;
    wire N__4699;
    wire N__4696;
    wire N__4693;
    wire N__4690;
    wire N__4687;
    wire N__4684;
    wire N__4681;
    wire N__4678;
    wire N__4675;
    wire N__4672;
    wire N__4669;
    wire N__4666;
    wire N__4663;
    wire N__4660;
    wire N__4657;
    wire N__4654;
    wire N__4651;
    wire N__4648;
    wire N__4645;
    wire N__4642;
    wire N__4639;
    wire N__4636;
    wire N__4633;
    wire VCCG0;
    wire \inst_midgetv_core.Wai_8 ;
    wire \inst_midgetv_core.inst_ucodepc.n28 ;
    wire \inst_midgetv_core.inst_ucodepc.n5610 ;
    wire bfn_13_14_0_;
    wire \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_ccntcy_0 ;
    wire \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_ccntcy_1 ;
    wire \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_ccntcy_2 ;
    wire \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_ccntcy_3 ;
    wire \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_ccntcy_4 ;
    wire \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_ccntcy_5 ;
    wire \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_ccntcy_6 ;
    wire \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_ccntcy_7 ;
    wire bfn_13_15_0_;
    wire \inst_midgetv_core.inst_cyclecnt.dbg_rccnt_6 ;
    wire \inst_midgetv_core.inst_cyclecnt.dbg_rccnt_3 ;
    wire \inst_midgetv_core.inst_cyclecnt.dbg_rccnt_2 ;
    wire \inst_midgetv_core.inst_cyclecnt.dbg_rccnt_4 ;
    wire \inst_midgetv_core.inst_immexp_zfind_q.genblk1_sa07h ;
    wire bfn_13_17_0_;
    wire \inst_midgetv_core.inst_alu_carryin.genblk1_genblk1_prealucyin ;
    wire \inst_midgetv_core.alu_carryin ;
    wire \inst_midgetv_core.inst_alu.genblk1_inst.alucy_1 ;
    wire \inst_midgetv_core.QQ_2 ;
    wire \inst_midgetv_core.inst_alu.genblk1_inst.alucy_2 ;
    wire \inst_midgetv_core.QQ_3 ;
    wire \inst_midgetv_core.inst_alu.genblk1_inst.alucy_3 ;
    wire \inst_midgetv_core.QQ_4 ;
    wire \inst_midgetv_core.inst_alu.genblk1_inst.alucy_4 ;
    wire GNDG0;
    wire \inst_midgetv_core.inst_alu.genblk1_inst.alucy_5 ;
    wire \inst_midgetv_core.inst_alu.genblk1_inst.alucy_5_THRU_CRY_0_THRU_CO ;
    wire bfn_13_18_0_;
    wire \inst_midgetv_core.QQ_6 ;
    wire \inst_midgetv_core.inst_alu.genblk1_inst.alucy_6 ;
    wire \inst_midgetv_core.inst_alu.genblk1_inst.alucy_7 ;
    wire \inst_midgetv_core.inst_alu.genblk1_inst.alucy_8 ;
    wire \inst_midgetv_core.inst_alu.genblk1_inst.alucy_9 ;
    wire \inst_midgetv_core.inst_alu.genblk1_inst.alucy_10 ;
    wire \inst_midgetv_core.inst_alu.genblk1_inst.alucy_11 ;
    wire \inst_midgetv_core.inst_alu.genblk1_inst.alucy_12 ;
    wire \inst_midgetv_core.inst_alu.genblk1_inst.alucy_13 ;
    wire bfn_13_19_0_;
    wire \inst_midgetv_core.inst_alu.genblk1_inst.alucy_14 ;
    wire \inst_midgetv_core.inst_alu.genblk1_inst.alucy_15 ;
    wire \inst_midgetv_core.inst_alu.genblk1_inst.alucy_16 ;
    wire \inst_midgetv_core.inst_alu.genblk1_inst.alucy_17 ;
    wire \inst_midgetv_core.inst_alu.genblk1_inst.alucy_18 ;
    wire \inst_midgetv_core.inst_alu.genblk1_inst.alucy_19 ;
    wire \inst_midgetv_core.inst_alu.genblk1_inst.alucy_20 ;
    wire \inst_midgetv_core.inst_alu.genblk1_inst.alucy_21 ;
    wire bfn_13_20_0_;
    wire \inst_midgetv_core.inst_alu.genblk1_inst.alucy_22 ;
    wire \inst_midgetv_core.inst_alu.genblk1_inst.alucy_23 ;
    wire \inst_midgetv_core.inst_alu.genblk1_inst.alucy_24 ;
    wire \inst_midgetv_core.inst_alu.genblk1_inst.alucy_25 ;
    wire \inst_midgetv_core.inst_alu.genblk1_inst.alucy_26 ;
    wire \inst_midgetv_core.inst_alu.genblk1_inst.alucy_27 ;
    wire \inst_midgetv_core.inst_alu.genblk1_inst.alucy_28 ;
    wire \inst_midgetv_core.inst_alu.genblk1_inst.alucy_29 ;
    wire bfn_13_21_0_;
    wire \inst_midgetv_core.inst_alu.genblk1_inst.alucy_30 ;
    wire \inst_midgetv_core.s_alu_2 ;
    wire \inst_midgetv_core.inst_alu.genblk1_inst.alucy_31 ;
    wire \inst_midgetv_core.alu_carryout ;
    wire \inst_midgetv_core.inst_condcode.n2 ;
    wire \inst_midgetv_core.alu_carryout_THRU_CO ;
    wire \inst_midgetv_core.inst_condcode.n6 ;
    wire \inst_midgetv_core.inst_ucodepc.n5608 ;
    wire \inst_midgetv_core.inst_ucodepc.n5609 ;
    wire \inst_midgetv_core.inst_cyclecnt.dbg_rccnt_0 ;
    wire \inst_midgetv_core.QQ_0 ;
    wire \inst_midgetv_core.s_cyclecnt_1 ;
    wire \inst_midgetv_core.inst_cyclecnt.dbg_rccnt_1 ;
    wire \inst_midgetv_core.QQ_1 ;
    wire \inst_midgetv_core.inst_cyclecnt.dbg_rccnt_5 ;
    wire \inst_midgetv_core.QQ_5 ;
    wire bfn_14_15_0_;
    wire \inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy1 ;
    wire \inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy2 ;
    wire \inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy3 ;
    wire \inst_midgetv_core.inst_immexp_zfind_q.genblk1_imm4a ;
    wire \inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy4 ;
    wire \inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy5 ;
    wire \inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy6 ;
    wire \inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy7 ;
    wire \inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy8 ;
    wire bfn_14_16_0_;
    wire \inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy9 ;
    wire \inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy10 ;
    wire \inst_midgetv_core.inst_immexp_zfind_q.genblk1_imm11b ;
    wire \inst_midgetv_core.inst_immexp_zfind_q.genblk1_imm11a ;
    wire \inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy11 ;
    wire \inst_midgetv_core.B_12 ;
    wire \inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy12 ;
    wire \inst_midgetv_core.B_13 ;
    wire \inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy13 ;
    wire \inst_midgetv_core.B_14 ;
    wire \inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy14 ;
    wire \inst_midgetv_core.B_15 ;
    wire \inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy15 ;
    wire \inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy16 ;
    wire \inst_midgetv_core.B_16 ;
    wire bfn_14_17_0_;
    wire \inst_midgetv_core.B_17 ;
    wire \inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy17 ;
    wire \inst_midgetv_core.B_18 ;
    wire \inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy18 ;
    wire \inst_midgetv_core.inst_immexp_zfind_q.genblk1_sa13b ;
    wire \inst_midgetv_core.inst_immexp_zfind_q.genblk1_sa31 ;
    wire \inst_midgetv_core.B_19 ;
    wire \inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy19 ;
    wire \inst_midgetv_core.B_20 ;
    wire \inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy20 ;
    wire \inst_midgetv_core.B_21 ;
    wire \inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy21 ;
    wire \inst_midgetv_core.B_22 ;
    wire \inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy22 ;
    wire \inst_midgetv_core.B_23 ;
    wire \inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy23 ;
    wire \inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy24 ;
    wire \inst_midgetv_core.B_24 ;
    wire bfn_14_18_0_;
    wire \inst_midgetv_core.B_25 ;
    wire \inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy25 ;
    wire \inst_midgetv_core.B_26 ;
    wire \inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy26 ;
    wire \inst_midgetv_core.B_27 ;
    wire \inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy27 ;
    wire \inst_midgetv_core.B_28 ;
    wire \inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy28 ;
    wire \inst_midgetv_core.B_29 ;
    wire \inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy29 ;
    wire \inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy30 ;
    wire \inst_midgetv_core.inst_immexp_zfind_q.genblk1_sa13 ;
    wire \inst_midgetv_core.inst_immexp_zfind_q.genblk1_sa10 ;
    wire \inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy31 ;
    wire \inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy32 ;
    wire bfn_14_19_0_;
    wire \inst_midgetv_core.DAT_O_21 ;
    wire \inst_midgetv_core.Di_21_cascade_ ;
    wire \inst_midgetv_core.inst_alu.genblk1_inst.A_21 ;
    wire \inst_midgetv_core.DAT_O_22 ;
    wire \inst_midgetv_core.ADR_O_22 ;
    wire \inst_midgetv_core.Di_22_cascade_ ;
    wire \inst_midgetv_core.inst_alu.genblk1_inst.A_22 ;
    wire \inst_midgetv_core.DAT_O_23 ;
    wire \inst_midgetv_core.ADR_O_23 ;
    wire \inst_midgetv_core.Di_23_cascade_ ;
    wire \inst_midgetv_core.inst_alu.genblk1_inst.A_23 ;
    wire \inst_midgetv_core.DAT_O_24 ;
    wire \inst_midgetv_core.ADR_O_24 ;
    wire \inst_midgetv_core.Di_24_cascade_ ;
    wire \inst_midgetv_core.inst_alu.genblk1_inst.A_24 ;
    wire \inst_midgetv_core.Wai_7 ;
    wire \inst_midgetv_core.mostofminx0 ;
    wire \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.instr0100 ;
    wire \inst_midgetv_core.rinx_4 ;
    wire \inst_midgetv_core.minx_4 ;
    wire \inst_midgetv_core.rinx_2 ;
    wire \inst_midgetv_core.minx_2 ;
    wire \inst_midgetv_core.sa43 ;
    wire \inst_midgetv_core.inst_progressctrl.n2764 ;
    wire \inst_midgetv_core.inst_progressctrl.ctrlreg_we_N_84 ;
    wire \inst_midgetv_core.sa14 ;
    wire \inst_midgetv_core.inst_immexp_zfind_q.genblk1_nsa14_or_nCORERUNNING ;
    wire DAT_O_0;
    wire \inst_midgetv_core.INSTR_0 ;
    wire \inst_midgetv_core.ADR_O_0 ;
    wire \inst_midgetv_core.Di_0_cascade_ ;
    wire \inst_midgetv_core.inst_alu.genblk1_inst.A_0 ;
    wire DAT_O_1;
    wire \inst_midgetv_core.INSTR_1 ;
    wire \inst_midgetv_core.Di_1_cascade_ ;
    wire \inst_midgetv_core.ADR_O_1 ;
    wire \inst_midgetv_core.inst_alu.genblk1_inst.A_1 ;
    wire \inst_midgetv_core.Di_2_cascade_ ;
    wire \inst_midgetv_core.inst_alu.genblk1_inst.A_2 ;
    wire DAT_O_3;
    wire \inst_midgetv_core.Di_3_cascade_ ;
    wire \inst_midgetv_core.inst_alu.genblk1_inst.A_3 ;
    wire \inst_midgetv_core.DAT_O_4 ;
    wire \inst_midgetv_core.Di_4_cascade_ ;
    wire \inst_midgetv_core.inst_alu.genblk1_inst.A_4 ;
    wire \inst_midgetv_core.DAT_O_5 ;
    wire \inst_midgetv_core.Di_5_cascade_ ;
    wire \inst_midgetv_core.inst_alu.genblk1_inst.A_5 ;
    wire \inst_midgetv_core.DAT_O_6 ;
    wire \inst_midgetv_core.Di_6_cascade_ ;
    wire \inst_midgetv_core.inst_alu.genblk1_inst.A_6 ;
    wire \inst_midgetv_core.DAT_O_8 ;
    wire \inst_midgetv_core.Di_8_cascade_ ;
    wire \inst_midgetv_core.inst_alu.genblk1_inst.A_8 ;
    wire \inst_midgetv_core.DAT_O_10 ;
    wire \inst_midgetv_core.Di_10_cascade_ ;
    wire \inst_midgetv_core.inst_alu.genblk1_inst.A_10 ;
    wire \inst_midgetv_core.DAT_O_11 ;
    wire \inst_midgetv_core.Di_11_cascade_ ;
    wire \inst_midgetv_core.inst_alu.genblk1_inst.A_11 ;
    wire \inst_midgetv_core.ADR_O_10 ;
    wire \inst_midgetv_core.DAT_O_9 ;
    wire \inst_midgetv_core.Di_9_cascade_ ;
    wire \inst_midgetv_core.ADR_O_9 ;
    wire \inst_midgetv_core.inst_alu.genblk1_inst.A_9 ;
    wire \inst_midgetv_core.DAT_O_12 ;
    wire \inst_midgetv_core.ADR_O_12 ;
    wire \inst_midgetv_core.Di_12_cascade_ ;
    wire \inst_midgetv_core.inst_alu.genblk1_inst.A_12 ;
    wire \inst_midgetv_core.DAT_O_29 ;
    wire \inst_midgetv_core.Di_29_cascade_ ;
    wire \inst_midgetv_core.inst_alu.genblk1_inst.A_29 ;
    wire \inst_midgetv_core.DAT_O_30 ;
    wire \inst_midgetv_core.ADR_O_30 ;
    wire \inst_midgetv_core.Di_30_cascade_ ;
    wire \inst_midgetv_core.inst_alu.genblk1_inst.A_30 ;
    wire \inst_midgetv_core.sra_msb ;
    wire \inst_midgetv_core.ADR_O_31 ;
    wire \inst_midgetv_core.Di_31_cascade_ ;
    wire \inst_midgetv_core.A31 ;
    wire \inst_midgetv_core.DAT_O_7 ;
    wire \inst_midgetv_core.Di_7_cascade_ ;
    wire \inst_midgetv_core.inst_alu.genblk1_inst.A_7 ;
    wire \inst_midgetv_core.DAT_O_17 ;
    wire \inst_midgetv_core.Di_17_cascade_ ;
    wire \inst_midgetv_core.inst_alu.genblk1_inst.A_17 ;
    wire \inst_midgetv_core.DAT_O_18 ;
    wire \inst_midgetv_core.ADR_O_18 ;
    wire \inst_midgetv_core.Di_18_cascade_ ;
    wire \inst_midgetv_core.inst_alu.genblk1_inst.A_18 ;
    wire \inst_midgetv_core.DAT_O_19 ;
    wire \inst_midgetv_core.ADR_O_19 ;
    wire \inst_midgetv_core.Di_19_cascade_ ;
    wire \inst_midgetv_core.inst_alu.genblk1_inst.A_19 ;
    wire \inst_midgetv_core.DAT_O_20 ;
    wire \inst_midgetv_core.ADR_O_21 ;
    wire \inst_midgetv_core.ADR_O_20 ;
    wire \inst_midgetv_core.Di_20_cascade_ ;
    wire \inst_midgetv_core.inst_alu.genblk1_inst.A_20 ;
    wire \inst_midgetv_core.DAT_O_25 ;
    wire \inst_midgetv_core.Di_25_cascade_ ;
    wire \inst_midgetv_core.ADR_O_25 ;
    wire \inst_midgetv_core.inst_alu.genblk1_inst.A_25 ;
    wire \inst_midgetv_core.DAT_O_26 ;
    wire \inst_midgetv_core.ADR_O_26 ;
    wire \inst_midgetv_core.Di_26_cascade_ ;
    wire \inst_midgetv_core.inst_alu.genblk1_inst.A_26 ;
    wire \inst_midgetv_core.DAT_O_27 ;
    wire \inst_midgetv_core.ADR_O_27 ;
    wire \inst_midgetv_core.Di_27_cascade_ ;
    wire \inst_midgetv_core.inst_alu.genblk1_inst.A_27 ;
    wire \inst_midgetv_core.ADR_O_29 ;
    wire \inst_midgetv_core.DAT_O_28 ;
    wire \inst_midgetv_core.ADR_O_28 ;
    wire \inst_midgetv_core.Di_28_cascade_ ;
    wire \inst_midgetv_core.inst_alu.genblk1_inst.A_28 ;
    wire \inst_midgetv_core.rinx_1 ;
    wire \inst_midgetv_core.minx_1 ;
    wire \inst_midgetv_core.rinx_5 ;
    wire \inst_midgetv_core.minx_5 ;
    wire \inst_midgetv_core.rinx_7 ;
    wire \inst_midgetv_core.minx_7 ;
    wire \inst_midgetv_core.rinx_3 ;
    wire \inst_midgetv_core.minx_3 ;
    wire \inst_midgetv_core.inst_ucodepc.usedinx_or_RST_I_notcorerunning ;
    wire \inst_midgetv_core.rinx_6 ;
    wire \inst_midgetv_core.inst_ucodepc.illegal ;
    wire \inst_midgetv_core.minx_6 ;
    wire \inst_midgetv_core.inst_ucodepc.n15 ;
    wire \inst_midgetv_core.inst_immexp_zfind_q.genblk1_sa09h ;
    wire \inst_midgetv_core.inst_ucodepc.n5603 ;
    wire \inst_midgetv_core.inst_ucodepc.n17 ;
    wire \inst_midgetv_core.inst_ucodepc.dinx_1_N_145_0 ;
    wire \inst_midgetv_core.inst_ucodepc.n5613 ;
    wire \inst_midgetv_core.inst_ucodepc.inst_illegalop.genblk2_illegal_a ;
    wire \inst_midgetv_core.inst_ucodepc.inst_illegalop.n6 ;
    wire \inst_midgetv_core.inst_ucodepc.inst_illegalop.n2 ;
    wire \inst_midgetv_core.inst_ucodepc.inst_illegalop.genblk1_checkfunct7_N_286 ;
    wire \inst_midgetv_core.inst_ucodepc.inst_illegalop.n5605 ;
    wire \inst_midgetv_core.INSTR_3 ;
    wire \inst_midgetv_core.inst_ucodepc.inst_illegalop.n8 ;
    wire \inst_midgetv_core.FUNC7_2 ;
    wire \inst_midgetv_core.FUNC7_4 ;
    wire \inst_midgetv_core.FUNC7_5 ;
    wire \inst_midgetv_core.inst_ucodepc.inst_illegalop.n497 ;
    wire \inst_midgetv_core.inst_ucodepc.inst_illegalop.n11 ;
    wire \inst_midgetv_core.INSTR_5 ;
    wire \inst_midgetv_core.inst_ucodepc.inst_illegalop.n2575 ;
    wire \inst_midgetv_core.inst_ucodepc.inst_illegalop.genblk1_checkfunct7_N_281 ;
    wire \inst_midgetv_core.raluF ;
    wire \inst_midgetv_core.is_brcond ;
    wire \inst_midgetv_core.rzcy32 ;
    wire \inst_midgetv_core.INSTR_12 ;
    wire \inst_midgetv_core.inst_condcode.n5618 ;
    wire \inst_midgetv_core.inst_ucodepc.inst_illegalop.genblk1_illegal_rs1_rd_N_300 ;
    wire uart_ACK_O;
    wire rDee_8;
    wire \inst_midgetv_core.FUNC7_6 ;
    wire \inst_midgetv_core.FUNC7_1 ;
    wire \inst_midgetv_core.FUNC7_3 ;
    wire \inst_midgetv_core.FUNC7_0 ;
    wire \inst_midgetv_core.inst_ucodepc.inst_illegalop.n12 ;
    wire \inst_midgetv_core.inst_ucodepc.inst_illegalop.n17 ;
    wire \inst_midgetv_core.inst_ucodepc.inst_illegalop.n16 ;
    wire \inst_midgetv_core.DAT_O_13 ;
    wire \inst_midgetv_core.INSTR_13 ;
    wire \inst_midgetv_core.Di_13_cascade_ ;
    wire \inst_midgetv_core.ADR_O_13 ;
    wire \inst_midgetv_core.inst_alu.genblk1_inst.A_13 ;
    wire \inst_midgetv_core.DAT_O_14 ;
    wire \inst_midgetv_core.INSTR_14 ;
    wire \inst_midgetv_core.ADR_O_14 ;
    wire \inst_midgetv_core.Di_14_cascade_ ;
    wire \inst_midgetv_core.inst_alu.genblk1_inst.A_14 ;
    wire \inst_midgetv_core.DAT_O_15 ;
    wire \inst_midgetv_core.ADR_O_15 ;
    wire \inst_midgetv_core.Di_15_cascade_ ;
    wire \inst_midgetv_core.inst_alu.genblk1_inst.A_15 ;
    wire \inst_midgetv_core.ADR_O_17 ;
    wire \inst_midgetv_core.DAT_O_16 ;
    wire \inst_midgetv_core.inst_mimux.genblk1_sa00mod ;
    wire \inst_midgetv_core.ADR_O_16 ;
    wire \inst_midgetv_core.s_alu_1 ;
    wire \inst_midgetv_core.Di_16_cascade_ ;
    wire \inst_midgetv_core.s_alu_0 ;
    wire \inst_midgetv_core.inst_alu.genblk1_inst.A_16 ;
    wire \inst_midgetv_core.B_30 ;
    wire \inst_midgetv_core.sa29 ;
    wire \inst_midgetv_core.is_valid_instrhigh ;
    wire \inst_midgetv_core.progress_ucode ;
    wire \inst_midgetv_core.rinx_0 ;
    wire \inst_midgetv_core.inst_ucodepc.n5624 ;
    wire \inst_midgetv_core.sa33 ;
    wire \inst_midgetv_core.inst_progressctrl.n4 ;
    wire \inst_midgetv_core.enaQ ;
    wire \inst_midgetv_core.sa00 ;
    wire \inst_midgetv_core.Wai_0 ;
    wire bfn_17_15_0_;
    wire \inst_midgetv_core.Wai_1 ;
    wire \inst_midgetv_core.inst_wai.genblk1_waicy0 ;
    wire \inst_midgetv_core.ADR_O_4 ;
    wire \inst_midgetv_core.Wai_2 ;
    wire \inst_midgetv_core.inst_wai.genblk1_waicy1 ;
    wire \inst_midgetv_core.ADR_O_5 ;
    wire \inst_midgetv_core.Wai_3 ;
    wire \inst_midgetv_core.inst_wai.genblk1_waicy2 ;
    wire \inst_midgetv_core.INSTR_11 ;
    wire \inst_midgetv_core.ADR_O_6 ;
    wire \inst_midgetv_core.Wai_4 ;
    wire \inst_midgetv_core.inst_wai.genblk1_waicy3 ;
    wire \inst_midgetv_core.ADR_O_7 ;
    wire \inst_midgetv_core.inst_wai.genblk1_waicy4 ;
    wire \inst_midgetv_core.Wai_5 ;
    wire \inst_midgetv_core.inst_wai.genblk1_preWai0 ;
    wire \inst_midgetv_core.INSTR_7 ;
    wire \inst_midgetv_core.inst_immexp_zfind_q.genblk1_imm0a ;
    wire \inst_midgetv_core.INSTR_9 ;
    wire \inst_midgetv_core.inst_immexp_zfind_q.genblk1_imm2a ;
    wire \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrb.we ;
    wire \inst_midgetv_core.INSTR_6 ;
    wire \inst_midgetv_core.INSTR_2 ;
    wire \inst_midgetv_core.s_cyclecnt_0 ;
    wire \inst_midgetv_core.INSTR_4 ;
    wire \inst_midgetv_core.INSTR_8 ;
    wire \inst_midgetv_core.inst_immexp_zfind_q.genblk1_imm1a ;
    wire \inst_midgetv_core.inst_immexp_zfind_q.genblk1_sa09 ;
    wire \inst_midgetv_core.inst_immexp_zfind_q.genblk1_sa07 ;
    wire \inst_midgetv_core.inst_immexp_zfind_q.genblk1_sa08 ;
    wire \inst_midgetv_core.INSTR_10 ;
    wire \inst_midgetv_core.inst_immexp_zfind_q.genblk1_imm3a ;
    wire \inst_midgetv_core.bmask_0 ;
    wire \inst_midgetv_core.rlastshift ;
    wire \inst_midgetv_core.sa41 ;
    wire corerunning;
    wire \inst_midgetv_core.inst_progressctrl.blka_cmb_bsel_3_cascade_ ;
    wire meta_usartRX;
    wire DAT_O_2;
    wire LED3_c;
    wire \inst_midgetv_core.ADR_O_11 ;
    wire \inst_midgetv_core.Wai_9 ;
    wire SEL_O_3;
    wire DAT_O_31;
    wire bluesource_is_uart;
    wire \i_LEDs.n2766 ;
    wire \i_BBUART.usartTX_N_2 ;
    wire WE_O;
    wire ADR_O_2;
    wire LED1_N_4;
    wire \inst_midgetv_core.inst_progressctrl.n4_adj_311 ;
    wire n2345;
    wire \inst_midgetv_core.B_31 ;
    wire \inst_midgetv_core.sa42 ;
    wire \inst_midgetv_core.inst_progressctrl.badalignment ;
    wire \inst_midgetv_core.buserror ;
    wire CONSTANT_ZERO_NET;
    wire \inst_midgetv_core.sa15 ;
    wire \inst_midgetv_core.sa32 ;
    wire \inst_midgetv_core.inst_ucodepc.maybranch_N_253 ;
    wire \inst_midgetv_core.sa30 ;
    wire \inst_midgetv_core.sa37 ;
    wire \inst_midgetv_core.sa25 ;
    wire ADR_O_3;
    wire \inst_midgetv_core.inst_wai.genblk1_preWai1 ;
    wire \inst_midgetv_core.s_alu_carryin_0 ;
    wire \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.indir_28 ;
    wire \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.indir_31 ;
    wire \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.indir_30 ;
    wire \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.indir_29 ;
    wire \inst_midgetv_core.s_alu_carryin_1 ;
    wire \inst_midgetv_core.sa24 ;
    wire \inst_midgetv_core.inst_progressctrl.blka_usedefault ;
    wire \inst_midgetv_core.inst_progressctrl.blka_en ;
    wire bfn_18_17_0_;
    wire \inst_midgetv_core.inst_shiftcounter.genblk1_d_0 ;
    wire \inst_midgetv_core.inst_shiftcounter.dbg_rshcnt_1 ;
    wire \inst_midgetv_core.inst_shiftcounter.genblk1_shcy_0 ;
    wire \inst_midgetv_core.inst_shiftcounter.dbg_rshcnt_2 ;
    wire \inst_midgetv_core.inst_shiftcounter.genblk1_shcy_1 ;
    wire \inst_midgetv_core.inst_shiftcounter.dbg_rshcnt_3 ;
    wire \inst_midgetv_core.inst_shiftcounter.genblk1_shcy_2 ;
    wire \inst_midgetv_core.inst_shiftcounter.dbg_rshcnt_4 ;
    wire \inst_midgetv_core.inst_shiftcounter.genblk1_shcy_3 ;
    wire CONSTANT_ONE_NET;
    wire \inst_midgetv_core.inst_shiftcounter.genblk1_shcy_4 ;
    wire \inst_midgetv_core.lastshift ;
    wire \inst_midgetv_core.inst_shiftcounter.genblk1_d_2 ;
    wire \inst_midgetv_core.B_1 ;
    wire \inst_midgetv_core.inst_shiftcounter.genblk1_d_3 ;
    wire \inst_midgetv_core.bmask_2 ;
    wire \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrb.we ;
    wire \inst_midgetv_core.bmask_3 ;
    wire \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrh.we ;
    wire \inst_midgetv_core.bmask_1 ;
    wire \inst_midgetv_core.iwe ;
    wire \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrh.we ;
    wire \inst_midgetv_core.s_shift_1 ;
    wire \inst_midgetv_core.B_0 ;
    wire \inst_midgetv_core.inst_shiftcounter.dbg_rshcnt_0 ;
    wire CLK_c;
    wire \inst_midgetv_core.s_shift_0 ;
    wire \inst_midgetv_core.inst_shiftcounter.genblk1_d_1 ;
    wire \inst_midgetv_core.sa23 ;
    wire ACK_I;
    wire \inst_midgetv_core.sa34 ;
    wire \inst_midgetv_core.sa40 ;
    wire \inst_midgetv_core.sram_stb ;
    wire STB_O;
    wire \inst_midgetv_core.sa20 ;
    wire \inst_midgetv_core.inst_rai.genblk1_sel0h ;
    wire \inst_midgetv_core.inst_rai.genblk1_sel0hack ;
    wire \inst_midgetv_core.sa26 ;
    wire \inst_midgetv_core.sa27 ;
    wire \inst_midgetv_core.ADR_O_8 ;
    wire \inst_midgetv_core.Wai_6 ;
    wire \inst_midgetv_core.INSTR_21 ;
    wire \inst_midgetv_core.INSTR_16 ;
    wire \inst_midgetv_core.INSTR_18 ;
    wire \inst_midgetv_core.INSTR_23 ;
    wire \inst_midgetv_core.INSTR_24 ;
    wire \inst_midgetv_core.INSTR_19 ;
    wire \inst_midgetv_core.INSTR_20 ;
    wire \inst_midgetv_core.INSTR_15 ;
    wire \inst_midgetv_core.B_6 ;
    wire \inst_midgetv_core.inst_rai.genblk1_b4a ;
    wire \inst_midgetv_core.Rai_4 ;
    wire \inst_midgetv_core.B_2 ;
    wire \inst_midgetv_core.inst_rai.genblk1_sel_0 ;
    wire \inst_midgetv_core.inst_rai.genblk1_b0a ;
    wire \inst_midgetv_core.Rai_0 ;
    wire \inst_midgetv_core.B_3 ;
    wire \inst_midgetv_core.sa21 ;
    wire \inst_midgetv_core.inst_rai.genblk1_b1a ;
    wire \inst_midgetv_core.Rai_1 ;
    wire \inst_midgetv_core.B_7 ;
    wire \inst_midgetv_core.Rai_5 ;
    wire \inst_midgetv_core.inst_rai.genblk1_sel_3 ;
    wire \inst_midgetv_core.B_5 ;
    wire \inst_midgetv_core.inst_rai.genblk1_b3a ;
    wire \inst_midgetv_core.Rai_3 ;
    wire \inst_midgetv_core.INSTR_22 ;
    wire \inst_midgetv_core.INSTR_17 ;
    wire \inst_midgetv_core.B_4 ;
    wire \inst_midgetv_core.sa22 ;
    wire \inst_midgetv_core.inst_rai.genblk1_b2a ;
    wire \inst_midgetv_core.Rai_2 ;
    wire \inst_midgetv_core.B_10 ;
    wire \inst_midgetv_core.Rai_8 ;
    wire \inst_midgetv_core.B_11 ;
    wire \inst_midgetv_core.Rai_9 ;
    wire \inst_midgetv_core.B_8 ;
    wire \inst_midgetv_core.Rai_6 ;
    wire \inst_midgetv_core.inst_rai.genblk1_ss1 ;
    wire \inst_midgetv_core.B_9 ;
    wire \inst_midgetv_core.inst_rai.genblk1_ss0 ;
    wire \inst_midgetv_core.Rai_7 ;
    wire _gnd_net_;

    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrb.genblk1_ebrb.genblk1_mem_physical .WRITE_MODE=2;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrb.genblk1_ebrb.genblk1_mem_physical .READ_MODE=2;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrb.genblk1_ebrb.genblk1_mem_physical .INIT_F=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrb.genblk1_ebrb.genblk1_mem_physical .INIT_E=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrb.genblk1_ebrb.genblk1_mem_physical .INIT_D=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrb.genblk1_ebrb.genblk1_mem_physical .INIT_C=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrb.genblk1_ebrb.genblk1_mem_physical .INIT_B=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrb.genblk1_ebrb.genblk1_mem_physical .INIT_A=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrb.genblk1_ebrb.genblk1_mem_physical .INIT_9=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrb.genblk1_ebrb.genblk1_mem_physical .INIT_8=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrb.genblk1_ebrb.genblk1_mem_physical .INIT_7=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrb.genblk1_ebrb.genblk1_mem_physical .INIT_6=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrb.genblk1_ebrb.genblk1_mem_physical .INIT_5=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrb.genblk1_ebrb.genblk1_mem_physical .INIT_4=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrb.genblk1_ebrb.genblk1_mem_physical .INIT_3=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrb.genblk1_ebrb.genblk1_mem_physical .INIT_2=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrb.genblk1_ebrb.genblk1_mem_physical .INIT_1=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000100011101110000000011111111000000001111111110001000111111110000000011111111000000001111111100000000111111110110010011101110;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrb.genblk1_ebrb.genblk1_mem_physical .INIT_0=256'b1100110011001100000000000000000010001000111111110000100011001100000000000000000010111001100110011111111011101110010000000000000000001000111111110000000011111111000000001111111100000000111111110000000011111111000000011000100000000000100010000110010001000000;
    SB_RAM40_4K \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrb.genblk1_ebrb.genblk1_mem_physical  (
            .RDATA({dangling_wire_0,dangling_wire_1,DAT_O_3,dangling_wire_2,dangling_wire_3,dangling_wire_4,DAT_O_2,dangling_wire_5,dangling_wire_6,dangling_wire_7,DAT_O_1,dangling_wire_8,dangling_wire_9,dangling_wire_10,DAT_O_0,dangling_wire_11}),
            .RADDR({dangling_wire_12,N__13978,N__14113,N__14851,N__14947,N__14527,N__14755,N__13894,N__14251,N__15256,N__15043}),
            .WADDR({dangling_wire_13,N__10519,N__9667,N__11707,N__4696,N__6388,N__13237,N__10108,N__10210,N__10333,N__10426}),
            .MASK({dangling_wire_14,dangling_wire_15,dangling_wire_16,dangling_wire_17,dangling_wire_18,dangling_wire_19,dangling_wire_20,dangling_wire_21,dangling_wire_22,dangling_wire_23,dangling_wire_24,dangling_wire_25,dangling_wire_26,dangling_wire_27,dangling_wire_28,dangling_wire_29}),
            .WDATA({dangling_wire_30,dangling_wire_31,N__14061,dangling_wire_32,dangling_wire_33,dangling_wire_34,N__14195,dangling_wire_35,dangling_wire_36,dangling_wire_37,N__12738,dangling_wire_38,dangling_wire_39,dangling_wire_40,N__12493,dangling_wire_41}),
            .RCLKE(),
            .RCLK(N__13823),
            .RE(N__13008),
            .WCLKE(N__9942),
            .WCLK(N__13824),
            .WE(N__13012));
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrb.genblk1_ebrh.genblk1_mem_physical .WRITE_MODE=2;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrb.genblk1_ebrh.genblk1_mem_physical .READ_MODE=2;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrb.genblk1_ebrh.genblk1_mem_physical .INIT_F=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrb.genblk1_ebrh.genblk1_mem_physical .INIT_E=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrb.genblk1_ebrh.genblk1_mem_physical .INIT_D=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrb.genblk1_ebrh.genblk1_mem_physical .INIT_C=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrb.genblk1_ebrh.genblk1_mem_physical .INIT_B=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrb.genblk1_ebrh.genblk1_mem_physical .INIT_A=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrb.genblk1_ebrh.genblk1_mem_physical .INIT_9=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrb.genblk1_ebrh.genblk1_mem_physical .INIT_8=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrb.genblk1_ebrh.genblk1_mem_physical .INIT_7=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrb.genblk1_ebrh.genblk1_mem_physical .INIT_6=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrb.genblk1_ebrh.genblk1_mem_physical .INIT_5=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrb.genblk1_ebrh.genblk1_mem_physical .INIT_4=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrb.genblk1_ebrh.genblk1_mem_physical .INIT_3=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrb.genblk1_ebrh.genblk1_mem_physical .INIT_2=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrb.genblk1_ebrh.genblk1_mem_physical .INIT_1=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010100011100011000000000011111011000101010000000111001110101000001010101010010001100010101010001000100010100000000010011000000;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrb.genblk1_ebrh.genblk1_mem_physical .INIT_0=256'b1100110011001100000000000000000001101100110100101100000010001100000000000000000010111011100110011101111111101110000000000000000001011100110000111111110111110000010001000100000101110000110011110100010011000001100000000000110000000000000000010100000001000100;
    SB_RAM40_4K \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrb.genblk1_ebrh.genblk1_mem_physical  (
            .RDATA({dangling_wire_42,dangling_wire_43,\inst_midgetv_core.DAT_O_7 ,dangling_wire_44,dangling_wire_45,dangling_wire_46,\inst_midgetv_core.DAT_O_6 ,dangling_wire_47,dangling_wire_48,dangling_wire_49,\inst_midgetv_core.DAT_O_5 ,dangling_wire_50,dangling_wire_51,dangling_wire_52,\inst_midgetv_core.DAT_O_4 ,dangling_wire_53}),
            .RADDR({dangling_wire_54,N__13972,N__14107,N__14845,N__14941,N__14521,N__14749,N__13888,N__14245,N__15250,N__15037}),
            .WADDR({dangling_wire_55,N__10513,N__9661,N__11701,N__4690,N__6382,N__13231,N__10102,N__10204,N__10327,N__10420}),
            .MASK({dangling_wire_56,dangling_wire_57,dangling_wire_58,dangling_wire_59,dangling_wire_60,dangling_wire_61,dangling_wire_62,dangling_wire_63,dangling_wire_64,dangling_wire_65,dangling_wire_66,dangling_wire_67,dangling_wire_68,dangling_wire_69,dangling_wire_70,dangling_wire_71}),
            .WDATA({dangling_wire_72,dangling_wire_73,N__13927,dangling_wire_74,dangling_wire_75,dangling_wire_76,N__14301,dangling_wire_77,dangling_wire_78,dangling_wire_79,N__15293,dangling_wire_80,dangling_wire_81,dangling_wire_82,N__15133,dangling_wire_83}),
            .RCLKE(),
            .RCLK(N__13820),
            .RE(N__13011),
            .WCLKE(N__9943),
            .WCLK(N__13821),
            .WE(N__12978));
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrh.genblk1_ebrb.genblk1_mem_physical .WRITE_MODE=2;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrh.genblk1_ebrb.genblk1_mem_physical .READ_MODE=2;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrh.genblk1_ebrb.genblk1_mem_physical .INIT_F=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrh.genblk1_ebrb.genblk1_mem_physical .INIT_E=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrh.genblk1_ebrb.genblk1_mem_physical .INIT_D=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrh.genblk1_ebrb.genblk1_mem_physical .INIT_C=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrh.genblk1_ebrb.genblk1_mem_physical .INIT_B=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrh.genblk1_ebrb.genblk1_mem_physical .INIT_A=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrh.genblk1_ebrb.genblk1_mem_physical .INIT_9=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrh.genblk1_ebrb.genblk1_mem_physical .INIT_8=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrh.genblk1_ebrb.genblk1_mem_physical .INIT_7=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrh.genblk1_ebrb.genblk1_mem_physical .INIT_6=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrh.genblk1_ebrb.genblk1_mem_physical .INIT_5=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrh.genblk1_ebrb.genblk1_mem_physical .INIT_4=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrh.genblk1_ebrb.genblk1_mem_physical .INIT_3=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrh.genblk1_ebrb.genblk1_mem_physical .INIT_2=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrh.genblk1_ebrb.genblk1_mem_physical .INIT_1=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000100000000011110000111001000101111000100010101001101000101011110011000000101011011110001000100111110100000100000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrh.genblk1_ebrb.genblk1_mem_physical .INIT_0=256'b1100110011001100000000000000000001000100010100000000000000000110000000000000000010011001100110011010101010101010000000000000010001000100011000000010011101100010010011100101000100000000111011100100111011010000000000000000000000000000000000000100000001000000;
    SB_RAM40_4K \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrh.genblk1_ebrb.genblk1_mem_physical  (
            .RDATA({dangling_wire_84,dangling_wire_85,\inst_midgetv_core.DAT_O_11 ,dangling_wire_86,dangling_wire_87,dangling_wire_88,\inst_midgetv_core.DAT_O_10 ,dangling_wire_89,dangling_wire_90,dangling_wire_91,\inst_midgetv_core.DAT_O_9 ,dangling_wire_92,dangling_wire_93,dangling_wire_94,\inst_midgetv_core.DAT_O_8 ,dangling_wire_95}),
            .RADDR({dangling_wire_96,N__13966,N__14101,N__14839,N__14935,N__14515,N__14743,N__13882,N__14239,N__15244,N__15031}),
            .WADDR({dangling_wire_97,N__10507,N__9655,N__11695,N__4684,N__6376,N__13225,N__10096,N__10198,N__10321,N__10414}),
            .MASK({dangling_wire_98,dangling_wire_99,dangling_wire_100,dangling_wire_101,dangling_wire_102,dangling_wire_103,dangling_wire_104,dangling_wire_105,dangling_wire_106,dangling_wire_107,dangling_wire_108,dangling_wire_109,dangling_wire_110,dangling_wire_111,dangling_wire_112,dangling_wire_113}),
            .WDATA({dangling_wire_114,dangling_wire_115,N__14893,dangling_wire_116,dangling_wire_117,dangling_wire_118,N__14988,dangling_wire_119,dangling_wire_120,dangling_wire_121,N__14623,dangling_wire_122,dangling_wire_123,dangling_wire_124,N__14796,dangling_wire_125}),
            .RCLKE(),
            .RCLK(N__13816),
            .RE(N__12905),
            .WCLKE(N__12561),
            .WCLK(N__13817),
            .WE(N__12965));
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrh.genblk1_ebrh.genblk1_mem_physical .WRITE_MODE=2;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrh.genblk1_ebrh.genblk1_mem_physical .READ_MODE=2;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrh.genblk1_ebrh.genblk1_mem_physical .INIT_F=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrh.genblk1_ebrh.genblk1_mem_physical .INIT_E=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrh.genblk1_ebrh.genblk1_mem_physical .INIT_D=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrh.genblk1_ebrh.genblk1_mem_physical .INIT_C=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrh.genblk1_ebrh.genblk1_mem_physical .INIT_B=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrh.genblk1_ebrh.genblk1_mem_physical .INIT_A=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrh.genblk1_ebrh.genblk1_mem_physical .INIT_9=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrh.genblk1_ebrh.genblk1_mem_physical .INIT_8=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrh.genblk1_ebrh.genblk1_mem_physical .INIT_7=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrh.genblk1_ebrh.genblk1_mem_physical .INIT_6=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrh.genblk1_ebrh.genblk1_mem_physical .INIT_5=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrh.genblk1_ebrh.genblk1_mem_physical .INIT_4=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrh.genblk1_ebrh.genblk1_mem_physical .INIT_3=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrh.genblk1_ebrh.genblk1_mem_physical .INIT_2=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrh.genblk1_ebrh.genblk1_mem_physical .INIT_1=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001010100011001000000001000001010100100000101000010001000101010001000000010000001100000001010000010110000101101001100010011000100;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrh.genblk1_ebrh.genblk1_mem_physical .INIT_0=256'b1100110011001100000000000000000010111100100110000100000000000000000000000000000010001001100110011010101010101010000000000000000010100000000001000111000100010100100001011110000101011010100000100010000010100100000000000000000000000000000000000100000001000100;
    SB_RAM40_4K \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrh.genblk1_ebrh.genblk1_mem_physical  (
            .RDATA({dangling_wire_126,dangling_wire_127,\inst_midgetv_core.DAT_O_15 ,dangling_wire_128,dangling_wire_129,dangling_wire_130,\inst_midgetv_core.DAT_O_14 ,dangling_wire_131,dangling_wire_132,dangling_wire_133,\inst_midgetv_core.DAT_O_13 ,dangling_wire_134,dangling_wire_135,dangling_wire_136,\inst_midgetv_core.DAT_O_12 ,dangling_wire_137}),
            .RADDR({dangling_wire_138,N__13960,N__14095,N__14833,N__14929,N__14509,N__14737,N__13876,N__14233,N__15238,N__15025}),
            .WADDR({dangling_wire_139,N__10501,N__9649,N__11689,N__4678,N__6370,N__13219,N__10090,N__10192,N__10315,N__10408}),
            .MASK({dangling_wire_140,dangling_wire_141,dangling_wire_142,dangling_wire_143,dangling_wire_144,dangling_wire_145,dangling_wire_146,dangling_wire_147,dangling_wire_148,dangling_wire_149,dangling_wire_150,dangling_wire_151,dangling_wire_152,dangling_wire_153,dangling_wire_154,dangling_wire_155}),
            .WDATA({dangling_wire_156,dangling_wire_157,N__5587,dangling_wire_158,dangling_wire_159,dangling_wire_160,N__5614,dangling_wire_161,dangling_wire_162,dangling_wire_163,N__5641,dangling_wire_164,dangling_wire_165,dangling_wire_166,N__5317,dangling_wire_167}),
            .RCLKE(),
            .RCLK(N__13804),
            .RE(N__12863),
            .WCLKE(N__12565),
            .WCLK(N__13805),
            .WE(N__12907));
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrb.genblk1_ebrb.genblk1_mem_physical .WRITE_MODE=2;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrb.genblk1_ebrb.genblk1_mem_physical .READ_MODE=2;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrb.genblk1_ebrb.genblk1_mem_physical .INIT_F=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrb.genblk1_ebrb.genblk1_mem_physical .INIT_E=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrb.genblk1_ebrb.genblk1_mem_physical .INIT_D=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrb.genblk1_ebrb.genblk1_mem_physical .INIT_C=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrb.genblk1_ebrb.genblk1_mem_physical .INIT_B=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrb.genblk1_ebrb.genblk1_mem_physical .INIT_A=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrb.genblk1_ebrb.genblk1_mem_physical .INIT_9=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrb.genblk1_ebrb.genblk1_mem_physical .INIT_8=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrb.genblk1_ebrb.genblk1_mem_physical .INIT_7=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrb.genblk1_ebrb.genblk1_mem_physical .INIT_6=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrb.genblk1_ebrb.genblk1_mem_physical .INIT_5=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrb.genblk1_ebrb.genblk1_mem_physical .INIT_4=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrb.genblk1_ebrb.genblk1_mem_physical .INIT_3=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrb.genblk1_ebrb.genblk1_mem_physical .INIT_2=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrb.genblk1_ebrb.genblk1_mem_physical .INIT_1=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000100010101000000111100001111000010010010001010001100100111010000111000010001000011000001010100001011010001000100110001000100;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrb.genblk1_ebrb.genblk1_mem_physical .INIT_0=256'b1100110011001100000000000000000010001000100010000000000000000100000000000000000010011001100110010010001000100010000000000000000000000000000011110000000010010001000011000001000100000010110011100000011000000000000000000000000000000000000000000100010000000100;
    SB_RAM40_4K \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrb.genblk1_ebrb.genblk1_mem_physical  (
            .RDATA({dangling_wire_168,dangling_wire_169,\inst_midgetv_core.DAT_O_19 ,dangling_wire_170,dangling_wire_171,dangling_wire_172,\inst_midgetv_core.DAT_O_18 ,dangling_wire_173,dangling_wire_174,dangling_wire_175,\inst_midgetv_core.DAT_O_17 ,dangling_wire_176,dangling_wire_177,dangling_wire_178,\inst_midgetv_core.DAT_O_16 ,dangling_wire_179}),
            .RADDR({dangling_wire_180,N__13954,N__14089,N__14827,N__14923,N__14503,N__14731,N__13870,N__14227,N__15232,N__15019}),
            .WADDR({dangling_wire_181,N__10495,N__9643,N__11683,N__4672,N__6364,N__13213,N__10084,N__10186,N__10309,N__10402}),
            .MASK({dangling_wire_182,dangling_wire_183,dangling_wire_184,dangling_wire_185,dangling_wire_186,dangling_wire_187,dangling_wire_188,dangling_wire_189,dangling_wire_190,dangling_wire_191,dangling_wire_192,dangling_wire_193,dangling_wire_194,dangling_wire_195,dangling_wire_196,dangling_wire_197}),
            .WDATA({dangling_wire_198,dangling_wire_199,N__5392,dangling_wire_200,dangling_wire_201,dangling_wire_202,N__5499,dangling_wire_203,dangling_wire_204,dangling_wire_205,N__5533,dangling_wire_206,dangling_wire_207,dangling_wire_208,N__5563,dangling_wire_209}),
            .RCLKE(),
            .RCLK(N__13795),
            .RE(N__12927),
            .WCLKE(N__12645),
            .WCLK(N__13796),
            .WE(N__12926));
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrb.genblk1_ebrh.genblk1_mem_physical .WRITE_MODE=2;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrb.genblk1_ebrh.genblk1_mem_physical .READ_MODE=2;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrb.genblk1_ebrh.genblk1_mem_physical .INIT_F=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrb.genblk1_ebrh.genblk1_mem_physical .INIT_E=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrb.genblk1_ebrh.genblk1_mem_physical .INIT_D=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrb.genblk1_ebrh.genblk1_mem_physical .INIT_C=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrb.genblk1_ebrh.genblk1_mem_physical .INIT_B=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrb.genblk1_ebrh.genblk1_mem_physical .INIT_A=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrb.genblk1_ebrh.genblk1_mem_physical .INIT_9=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrb.genblk1_ebrh.genblk1_mem_physical .INIT_8=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrb.genblk1_ebrh.genblk1_mem_physical .INIT_7=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrb.genblk1_ebrh.genblk1_mem_physical .INIT_6=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrb.genblk1_ebrh.genblk1_mem_physical .INIT_5=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrb.genblk1_ebrh.genblk1_mem_physical .INIT_4=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrb.genblk1_ebrh.genblk1_mem_physical .INIT_3=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrb.genblk1_ebrh.genblk1_mem_physical .INIT_2=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrb.genblk1_ebrh.genblk1_mem_physical .INIT_1=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001110100001101000100001111001011010101000000000010100110000011001010001000100010101001100000010010100001000100010000101010101100;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrb.genblk1_ebrh.genblk1_mem_physical .INIT_0=256'b1100110011001100000000000000000010101010001111110010000000000100000000000000000010011001100110010010001000100010000000000000000000000000000000000000011110101001101001100100010111000000010000110010000000000000100000000000000000000000000000000100000001000000;
    SB_RAM40_4K \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrb.genblk1_ebrh.genblk1_mem_physical  (
            .RDATA({dangling_wire_210,dangling_wire_211,\inst_midgetv_core.DAT_O_23 ,dangling_wire_212,dangling_wire_213,dangling_wire_214,\inst_midgetv_core.DAT_O_22 ,dangling_wire_215,dangling_wire_216,dangling_wire_217,\inst_midgetv_core.DAT_O_21 ,dangling_wire_218,dangling_wire_219,dangling_wire_220,\inst_midgetv_core.DAT_O_20 ,dangling_wire_221}),
            .RADDR({dangling_wire_222,N__13948,N__14083,N__14821,N__14917,N__14497,N__14725,N__13864,N__14221,N__15226,N__15013}),
            .WADDR({dangling_wire_223,N__10489,N__9637,N__11677,N__4666,N__6358,N__13207,N__10078,N__10180,N__10303,N__10396}),
            .MASK({dangling_wire_224,dangling_wire_225,dangling_wire_226,dangling_wire_227,dangling_wire_228,dangling_wire_229,dangling_wire_230,dangling_wire_231,dangling_wire_232,dangling_wire_233,dangling_wire_234,dangling_wire_235,dangling_wire_236,dangling_wire_237,dangling_wire_238,dangling_wire_239}),
            .WDATA({dangling_wire_240,dangling_wire_241,N__5827,dangling_wire_242,dangling_wire_243,dangling_wire_244,N__5854,dangling_wire_245,dangling_wire_246,dangling_wire_247,N__5887,dangling_wire_248,dangling_wire_249,dangling_wire_250,N__5362,dangling_wire_251}),
            .RCLKE(),
            .RCLK(N__13787),
            .RE(N__12928),
            .WCLKE(N__12649),
            .WCLK(N__13788),
            .WE(N__12982));
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrh.genblk1_ebrb.genblk1_mem_physical .WRITE_MODE=2;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrh.genblk1_ebrb.genblk1_mem_physical .READ_MODE=2;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrh.genblk1_ebrb.genblk1_mem_physical .INIT_F=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrh.genblk1_ebrb.genblk1_mem_physical .INIT_E=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrh.genblk1_ebrb.genblk1_mem_physical .INIT_D=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrh.genblk1_ebrb.genblk1_mem_physical .INIT_C=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrh.genblk1_ebrb.genblk1_mem_physical .INIT_B=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrh.genblk1_ebrb.genblk1_mem_physical .INIT_A=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrh.genblk1_ebrb.genblk1_mem_physical .INIT_9=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrh.genblk1_ebrb.genblk1_mem_physical .INIT_8=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrh.genblk1_ebrb.genblk1_mem_physical .INIT_7=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrh.genblk1_ebrb.genblk1_mem_physical .INIT_6=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrh.genblk1_ebrb.genblk1_mem_physical .INIT_5=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrh.genblk1_ebrb.genblk1_mem_physical .INIT_4=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrh.genblk1_ebrb.genblk1_mem_physical .INIT_3=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrh.genblk1_ebrb.genblk1_mem_physical .INIT_2=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrh.genblk1_ebrb.genblk1_mem_physical .INIT_1=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001100010011001000100010001000100011000100010000010111001000100000011001100110010001100010001000001000100010000000110010000100010;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrh.genblk1_ebrb.genblk1_mem_physical .INIT_0=256'b1100110011001100000000000000000011101110111000100000000000000000000000000000000010011001100110010010001000100010000000000000000001000000010000001111111100110000011001000100000000000000000000001100010001000001000000000000000000000000000000000100010001000000;
    SB_RAM40_4K \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrh.genblk1_ebrb.genblk1_mem_physical  (
            .RDATA({dangling_wire_252,dangling_wire_253,\inst_midgetv_core.DAT_O_27 ,dangling_wire_254,dangling_wire_255,dangling_wire_256,\inst_midgetv_core.DAT_O_26 ,dangling_wire_257,dangling_wire_258,dangling_wire_259,\inst_midgetv_core.DAT_O_25 ,dangling_wire_260,dangling_wire_261,dangling_wire_262,\inst_midgetv_core.DAT_O_24 ,dangling_wire_263}),
            .RADDR({dangling_wire_264,N__13942,N__14077,N__14815,N__14911,N__14491,N__14719,N__13858,N__14215,N__15220,N__15007}),
            .WADDR({dangling_wire_265,N__10483,N__9631,N__11671,N__4660,N__6352,N__13201,N__10072,N__10174,N__10297,N__10390}),
            .MASK({dangling_wire_266,dangling_wire_267,dangling_wire_268,dangling_wire_269,dangling_wire_270,dangling_wire_271,dangling_wire_272,dangling_wire_273,dangling_wire_274,dangling_wire_275,dangling_wire_276,dangling_wire_277,dangling_wire_278,dangling_wire_279,dangling_wire_280,dangling_wire_281}),
            .WDATA({dangling_wire_282,dangling_wire_283,N__5701,dangling_wire_284,dangling_wire_285,dangling_wire_286,N__5731,dangling_wire_287,dangling_wire_288,dangling_wire_289,N__5761,dangling_wire_290,dangling_wire_291,dangling_wire_292,N__5797,dangling_wire_293}),
            .RCLKE(),
            .RCLK(N__13783),
            .RE(N__12984),
            .WCLKE(N__12618),
            .WCLK(N__13784),
            .WE(N__12983));
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrh.genblk1_ebrh.genblk1_mem_physical .INIT_0=256'b1100110011001100000000000000000011001110111011100000101010000000000000000000000010011001100110010010001000100010000000000000000001000100010001001111111111111111010001000100010000000000000000000100010001000100000000100010000010000000000000000100010000000100;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrh.genblk1_ebrh.genblk1_mem_physical .WRITE_MODE=2;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrh.genblk1_ebrh.genblk1_mem_physical .READ_MODE=2;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrh.genblk1_ebrh.genblk1_mem_physical .INIT_F=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrh.genblk1_ebrh.genblk1_mem_physical .INIT_E=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrh.genblk1_ebrh.genblk1_mem_physical .INIT_D=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrh.genblk1_ebrh.genblk1_mem_physical .INIT_C=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrh.genblk1_ebrh.genblk1_mem_physical .INIT_B=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrh.genblk1_ebrh.genblk1_mem_physical .INIT_A=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrh.genblk1_ebrh.genblk1_mem_physical .INIT_9=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrh.genblk1_ebrh.genblk1_mem_physical .INIT_8=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrh.genblk1_ebrh.genblk1_mem_physical .INIT_7=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrh.genblk1_ebrh.genblk1_mem_physical .INIT_6=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrh.genblk1_ebrh.genblk1_mem_physical .INIT_5=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrh.genblk1_ebrh.genblk1_mem_physical .INIT_4=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrh.genblk1_ebrh.genblk1_mem_physical .INIT_3=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrh.genblk1_ebrh.genblk1_mem_physical .INIT_2=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrh.genblk1_ebrh.genblk1_mem_physical .INIT_1=256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000100010000000100010001000100001000100010001010011001100110010011001100110011000101010001000101000100010001000100010001000100;
    SB_RAM40_4K \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrh.genblk1_ebrh.genblk1_mem_physical  (
            .RDATA({dangling_wire_294,dangling_wire_295,DAT_O_31,dangling_wire_296,dangling_wire_297,dangling_wire_298,\inst_midgetv_core.DAT_O_30 ,dangling_wire_299,dangling_wire_300,dangling_wire_301,\inst_midgetv_core.DAT_O_29 ,dangling_wire_302,dangling_wire_303,dangling_wire_304,\inst_midgetv_core.DAT_O_28 ,dangling_wire_305}),
            .RADDR({dangling_wire_306,N__13936,N__14071,N__14809,N__14905,N__14485,N__14713,N__13852,N__14209,N__15214,N__15001}),
            .WADDR({dangling_wire_307,N__10477,N__9625,N__11665,N__4654,N__6346,N__13195,N__10066,N__10168,N__10291,N__10384}),
            .MASK({dangling_wire_308,dangling_wire_309,dangling_wire_310,dangling_wire_311,dangling_wire_312,dangling_wire_313,dangling_wire_314,dangling_wire_315,dangling_wire_316,dangling_wire_317,dangling_wire_318,dangling_wire_319,dangling_wire_320,dangling_wire_321,dangling_wire_322,dangling_wire_323}),
            .WDATA({dangling_wire_324,dangling_wire_325,N__11434,dangling_wire_326,dangling_wire_327,dangling_wire_328,N__8950,dangling_wire_329,dangling_wire_330,dangling_wire_331,N__6202,dangling_wire_332,dangling_wire_333,dangling_wire_334,N__5671,dangling_wire_335}),
            .RCLKE(),
            .RCLK(N__13780),
            .RE(N__12985),
            .WCLKE(N__12619),
            .WCLK(N__13781),
            .WE(N__13009));
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.ucode0_physical .WRITE_MODE=0;
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.ucode0_physical .READ_MODE=0;
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.ucode0_physical .INIT_F=256'b0101000011000111010000000100011001010000011111100111011001001001011101100110101101111100010001010000000000000000011101100001001101110110101010110101110011111010011101101101101111111100000000000100100011011101010100001110011001110110000111100111100101110010;
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.ucode0_physical .INIT_E=256'b1100110011011110010000001111111000000000000000001101000000010001111110100101011000000000000000000101110011000110000000000000000001110110000111101100110011011110010111001011000111111010000110100000000000000000000000000000000001111001000111010000000000000000;
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.ucode0_physical .INIT_D=256'b1111011011110100111101101111010001110110111001010111011001001001011001001001001001010000100100010000000000000000011101100001001101110110101000010100000011111110000000000000000001100100100100100111011000011110011110010000011001110110110010010111110000110111;
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.ucode0_physical .INIT_C=256'b0101000001001111010000001111111000000000000000001101000000100110011101101110011000000000000000000101110010100101000000000000000001110001110010111111101101000111011110100110111111110010111000010000000000000000000000000000000001110110111010010000000000000000;
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.ucode0_physical .INIT_B=256'b1111100111000001111110010001111111101011110111100111011001001001111111011011010111111010000110100000000000000000011101100001001101011100101111010101110010011010011101101001111000000000000000000000000000000000110011001101111001000100100100100101110010110010;
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.ucode0_physical .INIT_A=256'b0111110011000101010000000011111100000000000000000100000000111111011100011001101000000000000000001110010000110100000000000000000001111100011000011110111011010000011111001010111110100110001110100000000000000000000000000000000001011100101101101011110001011110;
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.ucode0_physical .INIT_9=256'b0110100111110010011110011001111100000000000000000000000000000000000000000000000011000100001101000100000011111110011101100001001101100110100100111111100110111011110111001001010011100101001101001111000110010101111000010011010001000100100100100111011000110100;
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.ucode0_physical .INIT_8=256'b0111110010101001010000001111111000000000000000001101000000101001011101001110011000000000000000000000000000000000000000000000000001100001011111110100010000110100111110011111000011111010001000010000000000000000000000000000000001100001011111011011110010000101;
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.ucode0_physical .INIT_7=256'b0110000101111101011100011001000011100001001101000111011001001001011011100011001001101001111100100000000000000000000000000000000001100100011111010111100001110111010000000111001111110001111101000111000101110110011110100001101001110110000111100111100110111010;
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.ucode0_physical .INIT_6=256'b0111110011001111000000000000000000000000000000000101000000110001011110010111101000000000000000000000000000000000000000000000000001100110100100110110100111110010010100001110111111111010001010110000000000000000000000000000000001110010111101110000000000000000;
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.ucode0_physical .INIT_5=256'b0110111011011010111110010111000011111101111110110111011001001001011011100011001011111001010111010000000000000000000000000000000001111000100010110111101101010111011101100001111001111001111010110110111011011010111110010101010001101110110110101111000111100110;
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.ucode0_physical .INIT_4=256'b0111110011100110010000001111111000000000000000000101000000110001011010011011000001111100011001100111110001001011011111000110011001110001100011110110000101000111011111000110010111111010001010110000000000000000000000000000000001111100000010111111110001010000;
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.ucode0_physical .INIT_3=256'b1010000100111010101000010011010101111001000000110111011001001001011011100011001001111001001111010000000000000000011101100001001101110001110101111111110100000011111110010011011011101001110111100110010010000001011101001000011011111000001010110111011011100110;
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.ucode0_physical .INIT_2=256'b0111011011100110000000000000000001110110111001100100000000111110011101000011000000111100100101100111100000100001001111001001011001111100000111010111000000100111010010000000010010100110001101010101000011100110000000000000000001110000111001101011110001010010;
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.ucode0_physical .INIT_1=256'b0111011010110111010111001101010001110111111001101110111010100110011011100011001001110011111001100111010001000001011101100001001111111100011101001100111011011110011110010001011001111100000101011111100000010100000000000000000001111000000110101111100010001011;
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.ucode0_physical .INIT_0=256'b0111011011100110010100000001000001110110111001100111100100000100011100111000011000111100010110101111100010001011001111000101101011111011000010010111101000000111010010000000010001110100111001100101000011100110111111001011111011111001110100101011110000000001;
    SB_RAM40_4K \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.ucode0_physical  (
            .RDATA({\inst_midgetv_core.sa20 ,\inst_midgetv_core.s_shift_1 ,\inst_midgetv_core.s_cyclecnt_1 ,\inst_midgetv_core.sa15 ,\inst_midgetv_core.sa14 ,\inst_midgetv_core.s_alu_2 ,\inst_midgetv_core.s_alu_1 ,\inst_midgetv_core.s_alu_0 ,\inst_midgetv_core.rinx_7 ,\inst_midgetv_core.rinx_6 ,\inst_midgetv_core.rinx_5 ,\inst_midgetv_core.rinx_4 ,\inst_midgetv_core.rinx_3 ,\inst_midgetv_core.rinx_2 ,\inst_midgetv_core.rinx_1 ,\inst_midgetv_core.rinx_0 }),
            .RADDR({dangling_wire_336,dangling_wire_337,dangling_wire_338,N__7951,N__7795,N__7996,N__6268,N__7909,N__6226,N__8038,N__6325}),
            .WADDR({dangling_wire_339,dangling_wire_340,dangling_wire_341,dangling_wire_342,dangling_wire_343,dangling_wire_344,dangling_wire_345,dangling_wire_346,dangling_wire_347,dangling_wire_348,dangling_wire_349}),
            .MASK({dangling_wire_350,dangling_wire_351,dangling_wire_352,dangling_wire_353,dangling_wire_354,dangling_wire_355,dangling_wire_356,dangling_wire_357,dangling_wire_358,dangling_wire_359,dangling_wire_360,dangling_wire_361,dangling_wire_362,dangling_wire_363,dangling_wire_364,dangling_wire_365}),
            .WDATA({dangling_wire_366,dangling_wire_367,dangling_wire_368,dangling_wire_369,dangling_wire_370,dangling_wire_371,dangling_wire_372,dangling_wire_373,dangling_wire_374,dangling_wire_375,dangling_wire_376,dangling_wire_377,dangling_wire_378,dangling_wire_379,dangling_wire_380,dangling_wire_381}),
            .RCLKE(),
            .RCLK(N__13826),
            .RE(N__9807),
            .WCLKE(N__11919),
            .WCLK(GNDG0),
            .WE());
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.ucode1_physical .INIT_0=256'b0000000000100001000000100000011100000000001000010000001000000111001100000110000100000000010001110000001000000010000000000100011100000010000000100000001000000011000000100000000100000000001000010000001000000001001000101000011000010010000001010000011000000110;
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.ucode1_physical .WRITE_MODE=0;
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.ucode1_physical .READ_MODE=0;
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.ucode1_physical .INIT_F=256'b0000001000000001000000100000000100000010000000010000000001100011000000100000000001010010000001010100000000000000000000000110011100000000011110010101001000000000000000000111110100000000010111110000001000000000000000100000000100000000011111011100001000000101;
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.ucode1_physical .INIT_E=256'b0111010001010110000000100000000001000000000000000000001000000111000000100000001101000000000000000000001000000110010000000000000000000000011111010111010001010110010100100000010100000010000001110100000000000000010000000000000000000010000000000100000000000000;
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.ucode1_physical .INIT_D=256'b1110000001000101111100000100000100000000011111010000000001100011010100000111000100000010000001010100000000000000000000000110011100000000011111010000001000000000010000000000000001010001111100010000000001111101110000100000010100000000010000110101001000000001;
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.ucode1_physical .INIT_C=256'b0110001000000011000000100000000001000000000000000000001000000111000000011111101001000000000000000000001000000011010000000000000000000000011010000000010001101110000000100000000000000000010001110100000000000000010000000000000000000000011001010100000000000000;
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.ucode1_physical .INIT_B=256'b1001001000000101100100100000010110010100010101100000000001100011101000000110010100000010000000110100000000000000000000000110011100000010000001100101001000000101000000100000000001000000000000000100000000000000011101000101011000000001111100010101001000000101;
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.ucode1_physical .INIT_A=256'b0101001000000000000000100000011101000000000000000000001000000111000000000110110101000000000000000101000111110100010000000000000000000010000000000011001000000101010100100000001101000010000001110100000000000000010000000000000001010010000001010010010001100110;
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.ucode1_physical .INIT_9=256'b0000000000001110000011100000111001000000000000000100000000000000010000000000000000000001111101000000001000000000000000000110011100000000011110010100000001100101010100100000010100000001111101000000000001101101000000000110110001010001111100010000000111111010;
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.ucode1_physical .INIT_8=256'b0101001000000101000000100000000001000000000000000000001000000111010100000010000101000000000000000100000000000000010000000000000000000000011011100101000000100110000100100000010100000010000001110100000000000000010000000000000000000000011011010000011000000110;
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.ucode1_physical .INIT_7=256'b0000000001111101000000000110100000000001111101000000000001100011001100100000000100000000000101100100000000000000010000000000000001010000011011010000001000000001000000100000000111100010000001010000000001111110000000100000001100000000011111011100001000000101;
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.ucode1_physical .INIT_6=256'b0101001000000000010000000000000001000000000000000000001000000111000011100001011001000000000000000100000000000000010000000000000000000000011110010000000000011111011000100000000100000010000001110100000000000000010000000000000001100000010000110100000000000000;
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.ucode1_physical .INIT_5=256'b0000000001111101000100100000010110100000011001010000000001100011001100100000000101000000011001010100000000000000010000000000000000000010000001000000001000000100000000000111110111000010000001010000000001111101000100100000010100000000011111011101000000100101;
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.ucode1_physical .INIT_4=256'b0101001000000101000000100000000001000000000000000000001000000111000000010001110100111110000001110101001000000000001111100000011100000000011111010000000001101101010100100000010100000010000001110100000000000000010000000000000001010010000000000011011000000110;
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.ucode1_physical .INIT_3=256'b0100001000000111010000100000011111000000001001010000000001100011001100100000000110110000001001010100000000000000000000000110011101100000011010001010000000100101010000000010010110010100010101100000000001111001000000000110000100000010000001111000000000100001;
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.ucode1_physical .INIT_2=256'b0000000000100001010000000000000000000000001000010000001000000111010100100000000000100000010001110000001000000111001000000100011100000010000000000000000001000111000000100000000101000010000001110000001000000001010000000000000000000000001000010010010001100110;
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.ucode1_physical .INIT_1=256'b0000000001100101010100100000010100000000001000010010001000000101001100100000000100000000001000010000000001000101000000000110011100110100010101100111010001010110011000100000011001010010000000010000001000000111010000000000000000000010000001110000001000000111;
    SB_RAM40_4K \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.ucode1_physical  (
            .RDATA({\inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.indir_31 ,\inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.indir_30 ,\inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.indir_29 ,\inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.indir_28 ,\inst_midgetv_core.sa43 ,\inst_midgetv_core.sa42 ,\inst_midgetv_core.sa41 ,dangling_wire_382,dangling_wire_383,\inst_midgetv_core.sa27 ,\inst_midgetv_core.sa26 ,\inst_midgetv_core.sa25 ,\inst_midgetv_core.sa24 ,\inst_midgetv_core.sa23 ,\inst_midgetv_core.sa22 ,\inst_midgetv_core.sa21 }),
            .RADDR({dangling_wire_384,dangling_wire_385,dangling_wire_386,N__7944,N__7789,N__7990,N__6262,N__7903,N__6220,N__8032,N__6319}),
            .WADDR({dangling_wire_387,dangling_wire_388,dangling_wire_389,dangling_wire_390,dangling_wire_391,dangling_wire_392,dangling_wire_393,dangling_wire_394,dangling_wire_395,dangling_wire_396,dangling_wire_397}),
            .MASK({dangling_wire_398,dangling_wire_399,dangling_wire_400,dangling_wire_401,dangling_wire_402,dangling_wire_403,dangling_wire_404,dangling_wire_405,dangling_wire_406,dangling_wire_407,dangling_wire_408,dangling_wire_409,dangling_wire_410,dangling_wire_411,dangling_wire_412,dangling_wire_413}),
            .WDATA({dangling_wire_414,dangling_wire_415,dangling_wire_416,dangling_wire_417,dangling_wire_418,dangling_wire_419,dangling_wire_420,dangling_wire_421,dangling_wire_422,dangling_wire_423,dangling_wire_424,dangling_wire_425,dangling_wire_426,dangling_wire_427,dangling_wire_428,dangling_wire_429}),
            .RCLKE(),
            .RCLK(N__13825),
            .RE(N__9806),
            .WCLKE(N__11926),
            .WCLK(GNDG0),
            .WE());
    PRE_IO_GBUF CLK_pad_preiogbuf (
            .PADSIGNALTOGLOBALBUFFER(N__15398),
            .GLOBALBUFFEROUTPUT(CLK_c));
    defparam CLK_pad_iopad.IO_STANDARD="SB_LVCMOS";
    defparam CLK_pad_iopad.PULLUP=1'b0;
    IO_PAD CLK_pad_iopad (
            .OE(N__15400),
            .DIN(N__15399),
            .DOUT(N__15398),
            .PACKAGEPIN(CLK));
    defparam CLK_pad_preio.PIN_TYPE=6'b000001;
    defparam CLK_pad_preio.NEG_TRIGGER=1'b0;
    PRE_IO CLK_pad_preio (
            .PADOEN(N__15400),
            .PADOUT(N__15399),
            .PADIN(N__15398),
            .CLOCKENABLE(),
            .DIN0(),
            .DIN1(),
            .DOUT0(),
            .DOUT1(),
            .INPUTCLK(),
            .LATCHINPUTVALUE(),
            .OUTPUTCLK(),
            .OUTPUTENABLE());
    defparam LED1_pad_iopad.IO_STANDARD="SB_LVCMOS";
    defparam LED1_pad_iopad.PULLUP=1'b0;
    IO_PAD LED1_pad_iopad (
            .OE(N__15389),
            .DIN(N__15388),
            .DOUT(N__15387),
            .PACKAGEPIN(LED1));
    defparam LED1_pad_preio.PIN_TYPE=6'b010101;
    defparam LED1_pad_preio.NEG_TRIGGER=1'b0;
    PRE_IO LED1_pad_preio (
            .PADOEN(N__15389),
            .PADOUT(N__15388),
            .PADIN(N__15387),
            .CLOCKENABLE(N__11484),
            .DIN0(),
            .DIN1(),
            .DOUT0(N__6634),
            .DOUT1(),
            .INPUTCLK(),
            .LATCHINPUTVALUE(),
            .OUTPUTCLK(N__13778),
            .OUTPUTENABLE());
    defparam LED2_pad_iopad.IO_STANDARD="SB_LVCMOS";
    defparam LED2_pad_iopad.PULLUP=1'b0;
    IO_PAD LED2_pad_iopad (
            .OE(N__15380),
            .DIN(N__15379),
            .DOUT(N__15378),
            .PACKAGEPIN(LED2));
    defparam LED2_pad_preio.PIN_TYPE=6'b010101;
    defparam LED2_pad_preio.NEG_TRIGGER=1'b0;
    PRE_IO LED2_pad_preio (
            .PADOEN(N__15380),
            .PADOUT(N__15379),
            .PADIN(N__15378),
            .CLOCKENABLE(N__11484),
            .DIN0(),
            .DIN1(),
            .DOUT0(N__6550),
            .DOUT1(),
            .INPUTCLK(),
            .LATCHINPUTVALUE(),
            .OUTPUTCLK(N__13778),
            .OUTPUTENABLE());
    defparam LED3_pad_iopad.IO_STANDARD="SB_LVCMOS";
    defparam LED3_pad_iopad.PULLUP=1'b0;
    IO_PAD LED3_pad_iopad (
            .OE(N__15371),
            .DIN(N__15370),
            .DOUT(N__15369),
            .PACKAGEPIN(LED3));
    defparam LED3_pad_preio.PIN_TYPE=6'b011001;
    defparam LED3_pad_preio.NEG_TRIGGER=1'b0;
    PRE_IO LED3_pad_preio (
            .PADOEN(N__15371),
            .PADOUT(N__15370),
            .PADIN(N__15369),
            .CLOCKENABLE(),
            .DIN0(),
            .DIN1(),
            .DOUT0(N__10540),
            .DOUT1(),
            .INPUTCLK(),
            .LATCHINPUTVALUE(),
            .OUTPUTCLK(),
            .OUTPUTENABLE());
    defparam LED4_pad_iopad.IO_STANDARD="SB_LVCMOS";
    defparam LED4_pad_iopad.PULLUP=1'b0;
    IO_PAD LED4_pad_iopad (
            .OE(N__15362),
            .DIN(N__15361),
            .DOUT(N__15360),
            .PACKAGEPIN(LED4));
    defparam LED4_pad_preio.PIN_TYPE=6'b010101;
    defparam LED4_pad_preio.NEG_TRIGGER=1'b0;
    PRE_IO LED4_pad_preio (
            .PADOEN(N__15362),
            .PADOUT(N__15361),
            .PADIN(N__15360),
            .CLOCKENABLE(N__11488),
            .DIN0(),
            .DIN1(),
            .DOUT0(N__6861),
            .DOUT1(),
            .INPUTCLK(),
            .LATCHINPUTVALUE(),
            .OUTPUTCLK(N__13779),
            .OUTPUTENABLE());
    defparam RX_pad_iopad.IO_STANDARD="SB_LVCMOS";
    defparam RX_pad_iopad.PULLUP=1'b0;
    IO_PAD RX_pad_iopad (
            .OE(N__15353),
            .DIN(N__15352),
            .DOUT(N__15351),
            .PACKAGEPIN(RX));
    defparam RX_pad_preio.PIN_TYPE=6'b000000;
    defparam RX_pad_preio.NEG_TRIGGER=1'b0;
    PRE_IO RX_pad_preio (
            .PADOEN(N__15353),
            .PADOUT(N__15352),
            .PADIN(N__15351),
            .CLOCKENABLE(VCCG0),
            .DIN0(meta_usartRX),
            .DIN1(),
            .DOUT0(),
            .DOUT1(),
            .INPUTCLK(N__13827),
            .LATCHINPUTVALUE(),
            .OUTPUTCLK(),
            .OUTPUTENABLE());
    defparam TX_pad_iopad.IO_STANDARD="SB_LVCMOS";
    defparam TX_pad_iopad.PULLUP=1'b0;
    IO_PAD TX_pad_iopad (
            .OE(N__15344),
            .DIN(N__15343),
            .DOUT(N__15342),
            .PACKAGEPIN(TX));
    defparam TX_pad_preio.PIN_TYPE=6'b010101;
    defparam TX_pad_preio.NEG_TRIGGER=1'b0;
    PRE_IO TX_pad_preio (
            .PADOEN(N__15344),
            .PADOUT(N__15343),
            .PADIN(N__15342),
            .CLOCKENABLE(N__11581),
            .DIN0(),
            .DIN1(),
            .DOUT0(N__6633),
            .DOUT1(),
            .INPUTCLK(),
            .LATCHINPUTVALUE(),
            .OUTPUTCLK(N__13828),
            .OUTPUTENABLE());
    InMux I__3895 (
            .O(N__15325),
            .I(N__15320));
    InMux I__3894 (
            .O(N__15324),
            .I(N__15315));
    InMux I__3893 (
            .O(N__15323),
            .I(N__15315));
    LocalMux I__3892 (
            .O(N__15320),
            .I(N__15310));
    LocalMux I__3891 (
            .O(N__15315),
            .I(N__15310));
    Odrv12 I__3890 (
            .O(N__15310),
            .I(\inst_midgetv_core.inst_rai.genblk1_sel_3 ));
    InMux I__3889 (
            .O(N__15307),
            .I(N__15303));
    InMux I__3888 (
            .O(N__15306),
            .I(N__15300));
    LocalMux I__3887 (
            .O(N__15303),
            .I(N__15297));
    LocalMux I__3886 (
            .O(N__15300),
            .I(N__15294));
    Span4Mux_v I__3885 (
            .O(N__15297),
            .I(N__15290));
    Span4Mux_h I__3884 (
            .O(N__15294),
            .I(N__15287));
    InMux I__3883 (
            .O(N__15293),
            .I(N__15284));
    Sp12to4 I__3882 (
            .O(N__15290),
            .I(N__15281));
    Span4Mux_v I__3881 (
            .O(N__15287),
            .I(N__15278));
    LocalMux I__3880 (
            .O(N__15284),
            .I(N__15275));
    Span12Mux_h I__3879 (
            .O(N__15281),
            .I(N__15272));
    Span4Mux_h I__3878 (
            .O(N__15278),
            .I(N__15269));
    Odrv12 I__3877 (
            .O(N__15275),
            .I(\inst_midgetv_core.B_5 ));
    Odrv12 I__3876 (
            .O(N__15272),
            .I(\inst_midgetv_core.B_5 ));
    Odrv4 I__3875 (
            .O(N__15269),
            .I(\inst_midgetv_core.B_5 ));
    InMux I__3874 (
            .O(N__15262),
            .I(N__15259));
    LocalMux I__3873 (
            .O(N__15259),
            .I(\inst_midgetv_core.inst_rai.genblk1_b3a ));
    CascadeMux I__3872 (
            .O(N__15256),
            .I(N__15253));
    CascadeBuf I__3871 (
            .O(N__15253),
            .I(N__15250));
    CascadeMux I__3870 (
            .O(N__15250),
            .I(N__15247));
    CascadeBuf I__3869 (
            .O(N__15247),
            .I(N__15244));
    CascadeMux I__3868 (
            .O(N__15244),
            .I(N__15241));
    CascadeBuf I__3867 (
            .O(N__15241),
            .I(N__15238));
    CascadeMux I__3866 (
            .O(N__15238),
            .I(N__15235));
    CascadeBuf I__3865 (
            .O(N__15235),
            .I(N__15232));
    CascadeMux I__3864 (
            .O(N__15232),
            .I(N__15229));
    CascadeBuf I__3863 (
            .O(N__15229),
            .I(N__15226));
    CascadeMux I__3862 (
            .O(N__15226),
            .I(N__15223));
    CascadeBuf I__3861 (
            .O(N__15223),
            .I(N__15220));
    CascadeMux I__3860 (
            .O(N__15220),
            .I(N__15217));
    CascadeBuf I__3859 (
            .O(N__15217),
            .I(N__15214));
    CascadeMux I__3858 (
            .O(N__15214),
            .I(N__15211));
    InMux I__3857 (
            .O(N__15211),
            .I(N__15208));
    LocalMux I__3856 (
            .O(N__15208),
            .I(\inst_midgetv_core.Rai_3 ));
    CascadeMux I__3855 (
            .O(N__15205),
            .I(N__15202));
    InMux I__3854 (
            .O(N__15202),
            .I(N__15199));
    LocalMux I__3853 (
            .O(N__15199),
            .I(N__15194));
    InMux I__3852 (
            .O(N__15198),
            .I(N__15191));
    InMux I__3851 (
            .O(N__15197),
            .I(N__15188));
    Span4Mux_s2_v I__3850 (
            .O(N__15194),
            .I(N__15185));
    LocalMux I__3849 (
            .O(N__15191),
            .I(N__15180));
    LocalMux I__3848 (
            .O(N__15188),
            .I(N__15180));
    Span4Mux_v I__3847 (
            .O(N__15185),
            .I(N__15177));
    Span12Mux_v I__3846 (
            .O(N__15180),
            .I(N__15174));
    Span4Mux_v I__3845 (
            .O(N__15177),
            .I(N__15171));
    Odrv12 I__3844 (
            .O(N__15174),
            .I(\inst_midgetv_core.INSTR_22 ));
    Odrv4 I__3843 (
            .O(N__15171),
            .I(\inst_midgetv_core.INSTR_22 ));
    InMux I__3842 (
            .O(N__15166),
            .I(N__15163));
    LocalMux I__3841 (
            .O(N__15163),
            .I(N__15159));
    InMux I__3840 (
            .O(N__15162),
            .I(N__15156));
    Span4Mux_h I__3839 (
            .O(N__15159),
            .I(N__15153));
    LocalMux I__3838 (
            .O(N__15156),
            .I(N__15150));
    Span4Mux_v I__3837 (
            .O(N__15153),
            .I(N__15147));
    Span4Mux_h I__3836 (
            .O(N__15150),
            .I(N__15141));
    Span4Mux_v I__3835 (
            .O(N__15147),
            .I(N__15141));
    InMux I__3834 (
            .O(N__15146),
            .I(N__15138));
    Odrv4 I__3833 (
            .O(N__15141),
            .I(\inst_midgetv_core.INSTR_17 ));
    LocalMux I__3832 (
            .O(N__15138),
            .I(\inst_midgetv_core.INSTR_17 ));
    InMux I__3831 (
            .O(N__15133),
            .I(N__15128));
    InMux I__3830 (
            .O(N__15132),
            .I(N__15124));
    CascadeMux I__3829 (
            .O(N__15131),
            .I(N__15121));
    LocalMux I__3828 (
            .O(N__15128),
            .I(N__15118));
    InMux I__3827 (
            .O(N__15127),
            .I(N__15115));
    LocalMux I__3826 (
            .O(N__15124),
            .I(N__15112));
    InMux I__3825 (
            .O(N__15121),
            .I(N__15109));
    Span4Mux_v I__3824 (
            .O(N__15118),
            .I(N__15106));
    LocalMux I__3823 (
            .O(N__15115),
            .I(N__15103));
    Span12Mux_h I__3822 (
            .O(N__15112),
            .I(N__15100));
    LocalMux I__3821 (
            .O(N__15109),
            .I(N__15097));
    Sp12to4 I__3820 (
            .O(N__15106),
            .I(N__15090));
    Sp12to4 I__3819 (
            .O(N__15103),
            .I(N__15090));
    Span12Mux_v I__3818 (
            .O(N__15100),
            .I(N__15090));
    Span4Mux_v I__3817 (
            .O(N__15097),
            .I(N__15087));
    Odrv12 I__3816 (
            .O(N__15090),
            .I(\inst_midgetv_core.B_4 ));
    Odrv4 I__3815 (
            .O(N__15087),
            .I(\inst_midgetv_core.B_4 ));
    CascadeMux I__3814 (
            .O(N__15082),
            .I(N__15079));
    InMux I__3813 (
            .O(N__15079),
            .I(N__15074));
    InMux I__3812 (
            .O(N__15078),
            .I(N__15069));
    InMux I__3811 (
            .O(N__15077),
            .I(N__15069));
    LocalMux I__3810 (
            .O(N__15074),
            .I(N__15066));
    LocalMux I__3809 (
            .O(N__15069),
            .I(N__15063));
    Span4Mux_v I__3808 (
            .O(N__15066),
            .I(N__15058));
    Span4Mux_v I__3807 (
            .O(N__15063),
            .I(N__15058));
    Span4Mux_v I__3806 (
            .O(N__15058),
            .I(N__15055));
    Span4Mux_v I__3805 (
            .O(N__15055),
            .I(N__15052));
    Odrv4 I__3804 (
            .O(N__15052),
            .I(\inst_midgetv_core.sa22 ));
    InMux I__3803 (
            .O(N__15049),
            .I(N__15046));
    LocalMux I__3802 (
            .O(N__15046),
            .I(\inst_midgetv_core.inst_rai.genblk1_b2a ));
    CascadeMux I__3801 (
            .O(N__15043),
            .I(N__15040));
    CascadeBuf I__3800 (
            .O(N__15040),
            .I(N__15037));
    CascadeMux I__3799 (
            .O(N__15037),
            .I(N__15034));
    CascadeBuf I__3798 (
            .O(N__15034),
            .I(N__15031));
    CascadeMux I__3797 (
            .O(N__15031),
            .I(N__15028));
    CascadeBuf I__3796 (
            .O(N__15028),
            .I(N__15025));
    CascadeMux I__3795 (
            .O(N__15025),
            .I(N__15022));
    CascadeBuf I__3794 (
            .O(N__15022),
            .I(N__15019));
    CascadeMux I__3793 (
            .O(N__15019),
            .I(N__15016));
    CascadeBuf I__3792 (
            .O(N__15016),
            .I(N__15013));
    CascadeMux I__3791 (
            .O(N__15013),
            .I(N__15010));
    CascadeBuf I__3790 (
            .O(N__15010),
            .I(N__15007));
    CascadeMux I__3789 (
            .O(N__15007),
            .I(N__15004));
    CascadeBuf I__3788 (
            .O(N__15004),
            .I(N__15001));
    CascadeMux I__3787 (
            .O(N__15001),
            .I(N__14998));
    InMux I__3786 (
            .O(N__14998),
            .I(N__14995));
    LocalMux I__3785 (
            .O(N__14995),
            .I(\inst_midgetv_core.Rai_2 ));
    InMux I__3784 (
            .O(N__14992),
            .I(N__14989));
    LocalMux I__3783 (
            .O(N__14989),
            .I(N__14985));
    InMux I__3782 (
            .O(N__14988),
            .I(N__14982));
    Span4Mux_s1_v I__3781 (
            .O(N__14985),
            .I(N__14979));
    LocalMux I__3780 (
            .O(N__14982),
            .I(N__14975));
    Span4Mux_h I__3779 (
            .O(N__14979),
            .I(N__14972));
    InMux I__3778 (
            .O(N__14978),
            .I(N__14969));
    Span4Mux_v I__3777 (
            .O(N__14975),
            .I(N__14966));
    Span4Mux_v I__3776 (
            .O(N__14972),
            .I(N__14963));
    LocalMux I__3775 (
            .O(N__14969),
            .I(N__14960));
    Span4Mux_h I__3774 (
            .O(N__14966),
            .I(N__14957));
    Span4Mux_v I__3773 (
            .O(N__14963),
            .I(N__14952));
    Span4Mux_v I__3772 (
            .O(N__14960),
            .I(N__14952));
    Odrv4 I__3771 (
            .O(N__14957),
            .I(\inst_midgetv_core.B_10 ));
    Odrv4 I__3770 (
            .O(N__14952),
            .I(\inst_midgetv_core.B_10 ));
    CascadeMux I__3769 (
            .O(N__14947),
            .I(N__14944));
    CascadeBuf I__3768 (
            .O(N__14944),
            .I(N__14941));
    CascadeMux I__3767 (
            .O(N__14941),
            .I(N__14938));
    CascadeBuf I__3766 (
            .O(N__14938),
            .I(N__14935));
    CascadeMux I__3765 (
            .O(N__14935),
            .I(N__14932));
    CascadeBuf I__3764 (
            .O(N__14932),
            .I(N__14929));
    CascadeMux I__3763 (
            .O(N__14929),
            .I(N__14926));
    CascadeBuf I__3762 (
            .O(N__14926),
            .I(N__14923));
    CascadeMux I__3761 (
            .O(N__14923),
            .I(N__14920));
    CascadeBuf I__3760 (
            .O(N__14920),
            .I(N__14917));
    CascadeMux I__3759 (
            .O(N__14917),
            .I(N__14914));
    CascadeBuf I__3758 (
            .O(N__14914),
            .I(N__14911));
    CascadeMux I__3757 (
            .O(N__14911),
            .I(N__14908));
    CascadeBuf I__3756 (
            .O(N__14908),
            .I(N__14905));
    CascadeMux I__3755 (
            .O(N__14905),
            .I(N__14902));
    InMux I__3754 (
            .O(N__14902),
            .I(N__14899));
    LocalMux I__3753 (
            .O(N__14899),
            .I(N__14896));
    Odrv4 I__3752 (
            .O(N__14896),
            .I(\inst_midgetv_core.Rai_8 ));
    InMux I__3751 (
            .O(N__14893),
            .I(N__14889));
    InMux I__3750 (
            .O(N__14892),
            .I(N__14886));
    LocalMux I__3749 (
            .O(N__14889),
            .I(N__14882));
    LocalMux I__3748 (
            .O(N__14886),
            .I(N__14879));
    InMux I__3747 (
            .O(N__14885),
            .I(N__14876));
    Span4Mux_v I__3746 (
            .O(N__14882),
            .I(N__14873));
    Span12Mux_s10_h I__3745 (
            .O(N__14879),
            .I(N__14870));
    LocalMux I__3744 (
            .O(N__14876),
            .I(N__14867));
    Span4Mux_h I__3743 (
            .O(N__14873),
            .I(N__14864));
    Span12Mux_v I__3742 (
            .O(N__14870),
            .I(N__14861));
    Span4Mux_h I__3741 (
            .O(N__14867),
            .I(N__14858));
    Odrv4 I__3740 (
            .O(N__14864),
            .I(\inst_midgetv_core.B_11 ));
    Odrv12 I__3739 (
            .O(N__14861),
            .I(\inst_midgetv_core.B_11 ));
    Odrv4 I__3738 (
            .O(N__14858),
            .I(\inst_midgetv_core.B_11 ));
    CascadeMux I__3737 (
            .O(N__14851),
            .I(N__14848));
    CascadeBuf I__3736 (
            .O(N__14848),
            .I(N__14845));
    CascadeMux I__3735 (
            .O(N__14845),
            .I(N__14842));
    CascadeBuf I__3734 (
            .O(N__14842),
            .I(N__14839));
    CascadeMux I__3733 (
            .O(N__14839),
            .I(N__14836));
    CascadeBuf I__3732 (
            .O(N__14836),
            .I(N__14833));
    CascadeMux I__3731 (
            .O(N__14833),
            .I(N__14830));
    CascadeBuf I__3730 (
            .O(N__14830),
            .I(N__14827));
    CascadeMux I__3729 (
            .O(N__14827),
            .I(N__14824));
    CascadeBuf I__3728 (
            .O(N__14824),
            .I(N__14821));
    CascadeMux I__3727 (
            .O(N__14821),
            .I(N__14818));
    CascadeBuf I__3726 (
            .O(N__14818),
            .I(N__14815));
    CascadeMux I__3725 (
            .O(N__14815),
            .I(N__14812));
    CascadeBuf I__3724 (
            .O(N__14812),
            .I(N__14809));
    CascadeMux I__3723 (
            .O(N__14809),
            .I(N__14806));
    InMux I__3722 (
            .O(N__14806),
            .I(N__14803));
    LocalMux I__3721 (
            .O(N__14803),
            .I(N__14800));
    Odrv4 I__3720 (
            .O(N__14800),
            .I(\inst_midgetv_core.Rai_9 ));
    InMux I__3719 (
            .O(N__14797),
            .I(N__14793));
    InMux I__3718 (
            .O(N__14796),
            .I(N__14790));
    LocalMux I__3717 (
            .O(N__14793),
            .I(N__14787));
    LocalMux I__3716 (
            .O(N__14790),
            .I(N__14784));
    Span4Mux_h I__3715 (
            .O(N__14787),
            .I(N__14781));
    Span4Mux_v I__3714 (
            .O(N__14784),
            .I(N__14777));
    Span4Mux_h I__3713 (
            .O(N__14781),
            .I(N__14774));
    InMux I__3712 (
            .O(N__14780),
            .I(N__14771));
    Span4Mux_h I__3711 (
            .O(N__14777),
            .I(N__14768));
    Sp12to4 I__3710 (
            .O(N__14774),
            .I(N__14765));
    LocalMux I__3709 (
            .O(N__14771),
            .I(N__14762));
    Odrv4 I__3708 (
            .O(N__14768),
            .I(\inst_midgetv_core.B_8 ));
    Odrv12 I__3707 (
            .O(N__14765),
            .I(\inst_midgetv_core.B_8 ));
    Odrv4 I__3706 (
            .O(N__14762),
            .I(\inst_midgetv_core.B_8 ));
    CascadeMux I__3705 (
            .O(N__14755),
            .I(N__14752));
    CascadeBuf I__3704 (
            .O(N__14752),
            .I(N__14749));
    CascadeMux I__3703 (
            .O(N__14749),
            .I(N__14746));
    CascadeBuf I__3702 (
            .O(N__14746),
            .I(N__14743));
    CascadeMux I__3701 (
            .O(N__14743),
            .I(N__14740));
    CascadeBuf I__3700 (
            .O(N__14740),
            .I(N__14737));
    CascadeMux I__3699 (
            .O(N__14737),
            .I(N__14734));
    CascadeBuf I__3698 (
            .O(N__14734),
            .I(N__14731));
    CascadeMux I__3697 (
            .O(N__14731),
            .I(N__14728));
    CascadeBuf I__3696 (
            .O(N__14728),
            .I(N__14725));
    CascadeMux I__3695 (
            .O(N__14725),
            .I(N__14722));
    CascadeBuf I__3694 (
            .O(N__14722),
            .I(N__14719));
    CascadeMux I__3693 (
            .O(N__14719),
            .I(N__14716));
    CascadeBuf I__3692 (
            .O(N__14716),
            .I(N__14713));
    CascadeMux I__3691 (
            .O(N__14713),
            .I(N__14710));
    InMux I__3690 (
            .O(N__14710),
            .I(N__14707));
    LocalMux I__3689 (
            .O(N__14707),
            .I(\inst_midgetv_core.Rai_6 ));
    InMux I__3688 (
            .O(N__14704),
            .I(N__14698));
    CascadeMux I__3687 (
            .O(N__14703),
            .I(N__14693));
    CascadeMux I__3686 (
            .O(N__14702),
            .I(N__14689));
    InMux I__3685 (
            .O(N__14701),
            .I(N__14686));
    LocalMux I__3684 (
            .O(N__14698),
            .I(N__14679));
    InMux I__3683 (
            .O(N__14697),
            .I(N__14668));
    InMux I__3682 (
            .O(N__14696),
            .I(N__14668));
    InMux I__3681 (
            .O(N__14693),
            .I(N__14668));
    InMux I__3680 (
            .O(N__14692),
            .I(N__14668));
    InMux I__3679 (
            .O(N__14689),
            .I(N__14668));
    LocalMux I__3678 (
            .O(N__14686),
            .I(N__14665));
    InMux I__3677 (
            .O(N__14685),
            .I(N__14660));
    InMux I__3676 (
            .O(N__14684),
            .I(N__14660));
    InMux I__3675 (
            .O(N__14683),
            .I(N__14655));
    InMux I__3674 (
            .O(N__14682),
            .I(N__14655));
    Span4Mux_h I__3673 (
            .O(N__14679),
            .I(N__14648));
    LocalMux I__3672 (
            .O(N__14668),
            .I(N__14639));
    Span4Mux_h I__3671 (
            .O(N__14665),
            .I(N__14639));
    LocalMux I__3670 (
            .O(N__14660),
            .I(N__14639));
    LocalMux I__3669 (
            .O(N__14655),
            .I(N__14639));
    InMux I__3668 (
            .O(N__14654),
            .I(N__14630));
    InMux I__3667 (
            .O(N__14653),
            .I(N__14630));
    InMux I__3666 (
            .O(N__14652),
            .I(N__14630));
    InMux I__3665 (
            .O(N__14651),
            .I(N__14630));
    Odrv4 I__3664 (
            .O(N__14648),
            .I(\inst_midgetv_core.inst_rai.genblk1_ss1 ));
    Odrv4 I__3663 (
            .O(N__14639),
            .I(\inst_midgetv_core.inst_rai.genblk1_ss1 ));
    LocalMux I__3662 (
            .O(N__14630),
            .I(\inst_midgetv_core.inst_rai.genblk1_ss1 ));
    InMux I__3661 (
            .O(N__14623),
            .I(N__14620));
    LocalMux I__3660 (
            .O(N__14620),
            .I(N__14616));
    InMux I__3659 (
            .O(N__14619),
            .I(N__14613));
    Span4Mux_h I__3658 (
            .O(N__14616),
            .I(N__14610));
    LocalMux I__3657 (
            .O(N__14613),
            .I(N__14607));
    Sp12to4 I__3656 (
            .O(N__14610),
            .I(N__14601));
    Span12Mux_s8_h I__3655 (
            .O(N__14607),
            .I(N__14601));
    InMux I__3654 (
            .O(N__14606),
            .I(N__14598));
    Span12Mux_v I__3653 (
            .O(N__14601),
            .I(N__14595));
    LocalMux I__3652 (
            .O(N__14598),
            .I(N__14592));
    Odrv12 I__3651 (
            .O(N__14595),
            .I(\inst_midgetv_core.B_9 ));
    Odrv4 I__3650 (
            .O(N__14592),
            .I(\inst_midgetv_core.B_9 ));
    InMux I__3649 (
            .O(N__14587),
            .I(N__14583));
    InMux I__3648 (
            .O(N__14586),
            .I(N__14580));
    LocalMux I__3647 (
            .O(N__14583),
            .I(N__14573));
    LocalMux I__3646 (
            .O(N__14580),
            .I(N__14566));
    InMux I__3645 (
            .O(N__14579),
            .I(N__14561));
    InMux I__3644 (
            .O(N__14578),
            .I(N__14561));
    InMux I__3643 (
            .O(N__14577),
            .I(N__14558));
    InMux I__3642 (
            .O(N__14576),
            .I(N__14555));
    Span4Mux_h I__3641 (
            .O(N__14573),
            .I(N__14552));
    InMux I__3640 (
            .O(N__14572),
            .I(N__14543));
    InMux I__3639 (
            .O(N__14571),
            .I(N__14543));
    InMux I__3638 (
            .O(N__14570),
            .I(N__14543));
    InMux I__3637 (
            .O(N__14569),
            .I(N__14543));
    Span4Mux_h I__3636 (
            .O(N__14566),
            .I(N__14536));
    LocalMux I__3635 (
            .O(N__14561),
            .I(N__14536));
    LocalMux I__3634 (
            .O(N__14558),
            .I(N__14536));
    LocalMux I__3633 (
            .O(N__14555),
            .I(\inst_midgetv_core.inst_rai.genblk1_ss0 ));
    Odrv4 I__3632 (
            .O(N__14552),
            .I(\inst_midgetv_core.inst_rai.genblk1_ss0 ));
    LocalMux I__3631 (
            .O(N__14543),
            .I(\inst_midgetv_core.inst_rai.genblk1_ss0 ));
    Odrv4 I__3630 (
            .O(N__14536),
            .I(\inst_midgetv_core.inst_rai.genblk1_ss0 ));
    CascadeMux I__3629 (
            .O(N__14527),
            .I(N__14524));
    CascadeBuf I__3628 (
            .O(N__14524),
            .I(N__14521));
    CascadeMux I__3627 (
            .O(N__14521),
            .I(N__14518));
    CascadeBuf I__3626 (
            .O(N__14518),
            .I(N__14515));
    CascadeMux I__3625 (
            .O(N__14515),
            .I(N__14512));
    CascadeBuf I__3624 (
            .O(N__14512),
            .I(N__14509));
    CascadeMux I__3623 (
            .O(N__14509),
            .I(N__14506));
    CascadeBuf I__3622 (
            .O(N__14506),
            .I(N__14503));
    CascadeMux I__3621 (
            .O(N__14503),
            .I(N__14500));
    CascadeBuf I__3620 (
            .O(N__14500),
            .I(N__14497));
    CascadeMux I__3619 (
            .O(N__14497),
            .I(N__14494));
    CascadeBuf I__3618 (
            .O(N__14494),
            .I(N__14491));
    CascadeMux I__3617 (
            .O(N__14491),
            .I(N__14488));
    CascadeBuf I__3616 (
            .O(N__14488),
            .I(N__14485));
    CascadeMux I__3615 (
            .O(N__14485),
            .I(N__14482));
    InMux I__3614 (
            .O(N__14482),
            .I(N__14479));
    LocalMux I__3613 (
            .O(N__14479),
            .I(\inst_midgetv_core.Rai_7 ));
    InMux I__3612 (
            .O(N__14476),
            .I(N__14473));
    LocalMux I__3611 (
            .O(N__14473),
            .I(N__14469));
    CascadeMux I__3610 (
            .O(N__14472),
            .I(N__14466));
    Span4Mux_h I__3609 (
            .O(N__14469),
            .I(N__14462));
    InMux I__3608 (
            .O(N__14466),
            .I(N__14459));
    InMux I__3607 (
            .O(N__14465),
            .I(N__14456));
    Span4Mux_v I__3606 (
            .O(N__14462),
            .I(N__14453));
    LocalMux I__3605 (
            .O(N__14459),
            .I(N__14450));
    LocalMux I__3604 (
            .O(N__14456),
            .I(N__14447));
    Span4Mux_v I__3603 (
            .O(N__14453),
            .I(N__14442));
    Span4Mux_v I__3602 (
            .O(N__14450),
            .I(N__14442));
    Span4Mux_h I__3601 (
            .O(N__14447),
            .I(N__14439));
    Span4Mux_h I__3600 (
            .O(N__14442),
            .I(N__14436));
    Odrv4 I__3599 (
            .O(N__14439),
            .I(\inst_midgetv_core.INSTR_24 ));
    Odrv4 I__3598 (
            .O(N__14436),
            .I(\inst_midgetv_core.INSTR_24 ));
    InMux I__3597 (
            .O(N__14431),
            .I(N__14427));
    InMux I__3596 (
            .O(N__14430),
            .I(N__14424));
    LocalMux I__3595 (
            .O(N__14427),
            .I(N__14421));
    LocalMux I__3594 (
            .O(N__14424),
            .I(N__14417));
    Span4Mux_v I__3593 (
            .O(N__14421),
            .I(N__14414));
    CascadeMux I__3592 (
            .O(N__14420),
            .I(N__14411));
    Span4Mux_h I__3591 (
            .O(N__14417),
            .I(N__14408));
    Span4Mux_v I__3590 (
            .O(N__14414),
            .I(N__14405));
    InMux I__3589 (
            .O(N__14411),
            .I(N__14402));
    Odrv4 I__3588 (
            .O(N__14408),
            .I(\inst_midgetv_core.INSTR_19 ));
    Odrv4 I__3587 (
            .O(N__14405),
            .I(\inst_midgetv_core.INSTR_19 ));
    LocalMux I__3586 (
            .O(N__14402),
            .I(\inst_midgetv_core.INSTR_19 ));
    CascadeMux I__3585 (
            .O(N__14395),
            .I(N__14392));
    InMux I__3584 (
            .O(N__14392),
            .I(N__14387));
    CascadeMux I__3583 (
            .O(N__14391),
            .I(N__14383));
    CascadeMux I__3582 (
            .O(N__14390),
            .I(N__14380));
    LocalMux I__3581 (
            .O(N__14387),
            .I(N__14377));
    InMux I__3580 (
            .O(N__14386),
            .I(N__14374));
    InMux I__3579 (
            .O(N__14383),
            .I(N__14371));
    InMux I__3578 (
            .O(N__14380),
            .I(N__14368));
    Span4Mux_h I__3577 (
            .O(N__14377),
            .I(N__14365));
    LocalMux I__3576 (
            .O(N__14374),
            .I(N__14362));
    LocalMux I__3575 (
            .O(N__14371),
            .I(N__14359));
    LocalMux I__3574 (
            .O(N__14368),
            .I(N__14356));
    Span4Mux_v I__3573 (
            .O(N__14365),
            .I(N__14353));
    Sp12to4 I__3572 (
            .O(N__14362),
            .I(N__14350));
    Span4Mux_h I__3571 (
            .O(N__14359),
            .I(N__14345));
    Span4Mux_h I__3570 (
            .O(N__14356),
            .I(N__14345));
    Span4Mux_v I__3569 (
            .O(N__14353),
            .I(N__14342));
    Odrv12 I__3568 (
            .O(N__14350),
            .I(\inst_midgetv_core.INSTR_20 ));
    Odrv4 I__3567 (
            .O(N__14345),
            .I(\inst_midgetv_core.INSTR_20 ));
    Odrv4 I__3566 (
            .O(N__14342),
            .I(\inst_midgetv_core.INSTR_20 ));
    InMux I__3565 (
            .O(N__14335),
            .I(N__14331));
    InMux I__3564 (
            .O(N__14334),
            .I(N__14328));
    LocalMux I__3563 (
            .O(N__14331),
            .I(N__14325));
    LocalMux I__3562 (
            .O(N__14328),
            .I(N__14321));
    Span4Mux_v I__3561 (
            .O(N__14325),
            .I(N__14318));
    InMux I__3560 (
            .O(N__14324),
            .I(N__14315));
    Span4Mux_v I__3559 (
            .O(N__14321),
            .I(N__14310));
    Span4Mux_v I__3558 (
            .O(N__14318),
            .I(N__14310));
    LocalMux I__3557 (
            .O(N__14315),
            .I(N__14307));
    Odrv4 I__3556 (
            .O(N__14310),
            .I(\inst_midgetv_core.INSTR_15 ));
    Odrv12 I__3555 (
            .O(N__14307),
            .I(\inst_midgetv_core.INSTR_15 ));
    InMux I__3554 (
            .O(N__14302),
            .I(N__14298));
    InMux I__3553 (
            .O(N__14301),
            .I(N__14295));
    LocalMux I__3552 (
            .O(N__14298),
            .I(N__14292));
    LocalMux I__3551 (
            .O(N__14295),
            .I(N__14288));
    Span4Mux_h I__3550 (
            .O(N__14292),
            .I(N__14285));
    CascadeMux I__3549 (
            .O(N__14291),
            .I(N__14282));
    Span4Mux_v I__3548 (
            .O(N__14288),
            .I(N__14279));
    Span4Mux_h I__3547 (
            .O(N__14285),
            .I(N__14276));
    InMux I__3546 (
            .O(N__14282),
            .I(N__14273));
    Span4Mux_h I__3545 (
            .O(N__14279),
            .I(N__14270));
    Sp12to4 I__3544 (
            .O(N__14276),
            .I(N__14267));
    LocalMux I__3543 (
            .O(N__14273),
            .I(N__14264));
    Odrv4 I__3542 (
            .O(N__14270),
            .I(\inst_midgetv_core.B_6 ));
    Odrv12 I__3541 (
            .O(N__14267),
            .I(\inst_midgetv_core.B_6 ));
    Odrv4 I__3540 (
            .O(N__14264),
            .I(\inst_midgetv_core.B_6 ));
    InMux I__3539 (
            .O(N__14257),
            .I(N__14254));
    LocalMux I__3538 (
            .O(N__14254),
            .I(\inst_midgetv_core.inst_rai.genblk1_b4a ));
    CascadeMux I__3537 (
            .O(N__14251),
            .I(N__14248));
    CascadeBuf I__3536 (
            .O(N__14248),
            .I(N__14245));
    CascadeMux I__3535 (
            .O(N__14245),
            .I(N__14242));
    CascadeBuf I__3534 (
            .O(N__14242),
            .I(N__14239));
    CascadeMux I__3533 (
            .O(N__14239),
            .I(N__14236));
    CascadeBuf I__3532 (
            .O(N__14236),
            .I(N__14233));
    CascadeMux I__3531 (
            .O(N__14233),
            .I(N__14230));
    CascadeBuf I__3530 (
            .O(N__14230),
            .I(N__14227));
    CascadeMux I__3529 (
            .O(N__14227),
            .I(N__14224));
    CascadeBuf I__3528 (
            .O(N__14224),
            .I(N__14221));
    CascadeMux I__3527 (
            .O(N__14221),
            .I(N__14218));
    CascadeBuf I__3526 (
            .O(N__14218),
            .I(N__14215));
    CascadeMux I__3525 (
            .O(N__14215),
            .I(N__14212));
    CascadeBuf I__3524 (
            .O(N__14212),
            .I(N__14209));
    CascadeMux I__3523 (
            .O(N__14209),
            .I(N__14206));
    InMux I__3522 (
            .O(N__14206),
            .I(N__14203));
    LocalMux I__3521 (
            .O(N__14203),
            .I(\inst_midgetv_core.Rai_4 ));
    CascadeMux I__3520 (
            .O(N__14200),
            .I(N__14196));
    InMux I__3519 (
            .O(N__14199),
            .I(N__14191));
    InMux I__3518 (
            .O(N__14196),
            .I(N__14188));
    InMux I__3517 (
            .O(N__14195),
            .I(N__14185));
    InMux I__3516 (
            .O(N__14194),
            .I(N__14182));
    LocalMux I__3515 (
            .O(N__14191),
            .I(N__14179));
    LocalMux I__3514 (
            .O(N__14188),
            .I(N__14176));
    LocalMux I__3513 (
            .O(N__14185),
            .I(N__14173));
    LocalMux I__3512 (
            .O(N__14182),
            .I(N__14170));
    Span4Mux_v I__3511 (
            .O(N__14179),
            .I(N__14167));
    Span4Mux_v I__3510 (
            .O(N__14176),
            .I(N__14164));
    Span4Mux_v I__3509 (
            .O(N__14173),
            .I(N__14161));
    Span4Mux_v I__3508 (
            .O(N__14170),
            .I(N__14158));
    Span4Mux_h I__3507 (
            .O(N__14167),
            .I(N__14155));
    Span4Mux_h I__3506 (
            .O(N__14164),
            .I(N__14152));
    Sp12to4 I__3505 (
            .O(N__14161),
            .I(N__14149));
    Span4Mux_h I__3504 (
            .O(N__14158),
            .I(N__14142));
    Span4Mux_v I__3503 (
            .O(N__14155),
            .I(N__14142));
    Span4Mux_v I__3502 (
            .O(N__14152),
            .I(N__14142));
    Odrv12 I__3501 (
            .O(N__14149),
            .I(\inst_midgetv_core.B_2 ));
    Odrv4 I__3500 (
            .O(N__14142),
            .I(\inst_midgetv_core.B_2 ));
    InMux I__3499 (
            .O(N__14137),
            .I(N__14133));
    InMux I__3498 (
            .O(N__14136),
            .I(N__14130));
    LocalMux I__3497 (
            .O(N__14133),
            .I(N__14125));
    LocalMux I__3496 (
            .O(N__14130),
            .I(N__14125));
    Span12Mux_s5_v I__3495 (
            .O(N__14125),
            .I(N__14122));
    Odrv12 I__3494 (
            .O(N__14122),
            .I(\inst_midgetv_core.inst_rai.genblk1_sel_0 ));
    InMux I__3493 (
            .O(N__14119),
            .I(N__14116));
    LocalMux I__3492 (
            .O(N__14116),
            .I(\inst_midgetv_core.inst_rai.genblk1_b0a ));
    CascadeMux I__3491 (
            .O(N__14113),
            .I(N__14110));
    CascadeBuf I__3490 (
            .O(N__14110),
            .I(N__14107));
    CascadeMux I__3489 (
            .O(N__14107),
            .I(N__14104));
    CascadeBuf I__3488 (
            .O(N__14104),
            .I(N__14101));
    CascadeMux I__3487 (
            .O(N__14101),
            .I(N__14098));
    CascadeBuf I__3486 (
            .O(N__14098),
            .I(N__14095));
    CascadeMux I__3485 (
            .O(N__14095),
            .I(N__14092));
    CascadeBuf I__3484 (
            .O(N__14092),
            .I(N__14089));
    CascadeMux I__3483 (
            .O(N__14089),
            .I(N__14086));
    CascadeBuf I__3482 (
            .O(N__14086),
            .I(N__14083));
    CascadeMux I__3481 (
            .O(N__14083),
            .I(N__14080));
    CascadeBuf I__3480 (
            .O(N__14080),
            .I(N__14077));
    CascadeMux I__3479 (
            .O(N__14077),
            .I(N__14074));
    CascadeBuf I__3478 (
            .O(N__14074),
            .I(N__14071));
    CascadeMux I__3477 (
            .O(N__14071),
            .I(N__14068));
    InMux I__3476 (
            .O(N__14068),
            .I(N__14065));
    LocalMux I__3475 (
            .O(N__14065),
            .I(\inst_midgetv_core.Rai_0 ));
    InMux I__3474 (
            .O(N__14062),
            .I(N__14058));
    InMux I__3473 (
            .O(N__14061),
            .I(N__14055));
    LocalMux I__3472 (
            .O(N__14058),
            .I(N__14052));
    LocalMux I__3471 (
            .O(N__14055),
            .I(N__14048));
    Span4Mux_v I__3470 (
            .O(N__14052),
            .I(N__14044));
    InMux I__3469 (
            .O(N__14051),
            .I(N__14041));
    Span4Mux_v I__3468 (
            .O(N__14048),
            .I(N__14038));
    InMux I__3467 (
            .O(N__14047),
            .I(N__14035));
    Span4Mux_h I__3466 (
            .O(N__14044),
            .I(N__14032));
    LocalMux I__3465 (
            .O(N__14041),
            .I(N__14029));
    Sp12to4 I__3464 (
            .O(N__14038),
            .I(N__14024));
    LocalMux I__3463 (
            .O(N__14035),
            .I(N__14024));
    Span4Mux_v I__3462 (
            .O(N__14032),
            .I(N__14019));
    Span4Mux_v I__3461 (
            .O(N__14029),
            .I(N__14019));
    Odrv12 I__3460 (
            .O(N__14024),
            .I(\inst_midgetv_core.B_3 ));
    Odrv4 I__3459 (
            .O(N__14019),
            .I(\inst_midgetv_core.B_3 ));
    CascadeMux I__3458 (
            .O(N__14014),
            .I(N__14011));
    InMux I__3457 (
            .O(N__14011),
            .I(N__14008));
    LocalMux I__3456 (
            .O(N__14008),
            .I(N__14004));
    InMux I__3455 (
            .O(N__14007),
            .I(N__14001));
    Span4Mux_h I__3454 (
            .O(N__14004),
            .I(N__13996));
    LocalMux I__3453 (
            .O(N__14001),
            .I(N__13996));
    Span4Mux_v I__3452 (
            .O(N__13996),
            .I(N__13993));
    Span4Mux_v I__3451 (
            .O(N__13993),
            .I(N__13990));
    Span4Mux_v I__3450 (
            .O(N__13990),
            .I(N__13987));
    Odrv4 I__3449 (
            .O(N__13987),
            .I(\inst_midgetv_core.sa21 ));
    InMux I__3448 (
            .O(N__13984),
            .I(N__13981));
    LocalMux I__3447 (
            .O(N__13981),
            .I(\inst_midgetv_core.inst_rai.genblk1_b1a ));
    CascadeMux I__3446 (
            .O(N__13978),
            .I(N__13975));
    CascadeBuf I__3445 (
            .O(N__13975),
            .I(N__13972));
    CascadeMux I__3444 (
            .O(N__13972),
            .I(N__13969));
    CascadeBuf I__3443 (
            .O(N__13969),
            .I(N__13966));
    CascadeMux I__3442 (
            .O(N__13966),
            .I(N__13963));
    CascadeBuf I__3441 (
            .O(N__13963),
            .I(N__13960));
    CascadeMux I__3440 (
            .O(N__13960),
            .I(N__13957));
    CascadeBuf I__3439 (
            .O(N__13957),
            .I(N__13954));
    CascadeMux I__3438 (
            .O(N__13954),
            .I(N__13951));
    CascadeBuf I__3437 (
            .O(N__13951),
            .I(N__13948));
    CascadeMux I__3436 (
            .O(N__13948),
            .I(N__13945));
    CascadeBuf I__3435 (
            .O(N__13945),
            .I(N__13942));
    CascadeMux I__3434 (
            .O(N__13942),
            .I(N__13939));
    CascadeBuf I__3433 (
            .O(N__13939),
            .I(N__13936));
    CascadeMux I__3432 (
            .O(N__13936),
            .I(N__13933));
    InMux I__3431 (
            .O(N__13933),
            .I(N__13930));
    LocalMux I__3430 (
            .O(N__13930),
            .I(\inst_midgetv_core.Rai_1 ));
    InMux I__3429 (
            .O(N__13927),
            .I(N__13923));
    InMux I__3428 (
            .O(N__13926),
            .I(N__13920));
    LocalMux I__3427 (
            .O(N__13923),
            .I(N__13916));
    LocalMux I__3426 (
            .O(N__13920),
            .I(N__13913));
    InMux I__3425 (
            .O(N__13919),
            .I(N__13910));
    Span12Mux_v I__3424 (
            .O(N__13916),
            .I(N__13907));
    Span12Mux_h I__3423 (
            .O(N__13913),
            .I(N__13904));
    LocalMux I__3422 (
            .O(N__13910),
            .I(N__13901));
    Odrv12 I__3421 (
            .O(N__13907),
            .I(\inst_midgetv_core.B_7 ));
    Odrv12 I__3420 (
            .O(N__13904),
            .I(\inst_midgetv_core.B_7 ));
    Odrv4 I__3419 (
            .O(N__13901),
            .I(\inst_midgetv_core.B_7 ));
    CascadeMux I__3418 (
            .O(N__13894),
            .I(N__13891));
    CascadeBuf I__3417 (
            .O(N__13891),
            .I(N__13888));
    CascadeMux I__3416 (
            .O(N__13888),
            .I(N__13885));
    CascadeBuf I__3415 (
            .O(N__13885),
            .I(N__13882));
    CascadeMux I__3414 (
            .O(N__13882),
            .I(N__13879));
    CascadeBuf I__3413 (
            .O(N__13879),
            .I(N__13876));
    CascadeMux I__3412 (
            .O(N__13876),
            .I(N__13873));
    CascadeBuf I__3411 (
            .O(N__13873),
            .I(N__13870));
    CascadeMux I__3410 (
            .O(N__13870),
            .I(N__13867));
    CascadeBuf I__3409 (
            .O(N__13867),
            .I(N__13864));
    CascadeMux I__3408 (
            .O(N__13864),
            .I(N__13861));
    CascadeBuf I__3407 (
            .O(N__13861),
            .I(N__13858));
    CascadeMux I__3406 (
            .O(N__13858),
            .I(N__13855));
    CascadeBuf I__3405 (
            .O(N__13855),
            .I(N__13852));
    CascadeMux I__3404 (
            .O(N__13852),
            .I(N__13849));
    InMux I__3403 (
            .O(N__13849),
            .I(N__13846));
    LocalMux I__3402 (
            .O(N__13846),
            .I(\inst_midgetv_core.Rai_5 ));
    CascadeMux I__3401 (
            .O(N__13843),
            .I(N__13839));
    InMux I__3400 (
            .O(N__13842),
            .I(N__13836));
    InMux I__3399 (
            .O(N__13839),
            .I(N__13833));
    LocalMux I__3398 (
            .O(N__13836),
            .I(\inst_midgetv_core.inst_shiftcounter.dbg_rshcnt_0 ));
    LocalMux I__3397 (
            .O(N__13833),
            .I(\inst_midgetv_core.inst_shiftcounter.dbg_rshcnt_0 ));
    ClkMux I__3396 (
            .O(N__13828),
            .I(N__13675));
    ClkMux I__3395 (
            .O(N__13827),
            .I(N__13675));
    ClkMux I__3394 (
            .O(N__13826),
            .I(N__13675));
    ClkMux I__3393 (
            .O(N__13825),
            .I(N__13675));
    ClkMux I__3392 (
            .O(N__13824),
            .I(N__13675));
    ClkMux I__3391 (
            .O(N__13823),
            .I(N__13675));
    ClkMux I__3390 (
            .O(N__13822),
            .I(N__13675));
    ClkMux I__3389 (
            .O(N__13821),
            .I(N__13675));
    ClkMux I__3388 (
            .O(N__13820),
            .I(N__13675));
    ClkMux I__3387 (
            .O(N__13819),
            .I(N__13675));
    ClkMux I__3386 (
            .O(N__13818),
            .I(N__13675));
    ClkMux I__3385 (
            .O(N__13817),
            .I(N__13675));
    ClkMux I__3384 (
            .O(N__13816),
            .I(N__13675));
    ClkMux I__3383 (
            .O(N__13815),
            .I(N__13675));
    ClkMux I__3382 (
            .O(N__13814),
            .I(N__13675));
    ClkMux I__3381 (
            .O(N__13813),
            .I(N__13675));
    ClkMux I__3380 (
            .O(N__13812),
            .I(N__13675));
    ClkMux I__3379 (
            .O(N__13811),
            .I(N__13675));
    ClkMux I__3378 (
            .O(N__13810),
            .I(N__13675));
    ClkMux I__3377 (
            .O(N__13809),
            .I(N__13675));
    ClkMux I__3376 (
            .O(N__13808),
            .I(N__13675));
    ClkMux I__3375 (
            .O(N__13807),
            .I(N__13675));
    ClkMux I__3374 (
            .O(N__13806),
            .I(N__13675));
    ClkMux I__3373 (
            .O(N__13805),
            .I(N__13675));
    ClkMux I__3372 (
            .O(N__13804),
            .I(N__13675));
    ClkMux I__3371 (
            .O(N__13803),
            .I(N__13675));
    ClkMux I__3370 (
            .O(N__13802),
            .I(N__13675));
    ClkMux I__3369 (
            .O(N__13801),
            .I(N__13675));
    ClkMux I__3368 (
            .O(N__13800),
            .I(N__13675));
    ClkMux I__3367 (
            .O(N__13799),
            .I(N__13675));
    ClkMux I__3366 (
            .O(N__13798),
            .I(N__13675));
    ClkMux I__3365 (
            .O(N__13797),
            .I(N__13675));
    ClkMux I__3364 (
            .O(N__13796),
            .I(N__13675));
    ClkMux I__3363 (
            .O(N__13795),
            .I(N__13675));
    ClkMux I__3362 (
            .O(N__13794),
            .I(N__13675));
    ClkMux I__3361 (
            .O(N__13793),
            .I(N__13675));
    ClkMux I__3360 (
            .O(N__13792),
            .I(N__13675));
    ClkMux I__3359 (
            .O(N__13791),
            .I(N__13675));
    ClkMux I__3358 (
            .O(N__13790),
            .I(N__13675));
    ClkMux I__3357 (
            .O(N__13789),
            .I(N__13675));
    ClkMux I__3356 (
            .O(N__13788),
            .I(N__13675));
    ClkMux I__3355 (
            .O(N__13787),
            .I(N__13675));
    ClkMux I__3354 (
            .O(N__13786),
            .I(N__13675));
    ClkMux I__3353 (
            .O(N__13785),
            .I(N__13675));
    ClkMux I__3352 (
            .O(N__13784),
            .I(N__13675));
    ClkMux I__3351 (
            .O(N__13783),
            .I(N__13675));
    ClkMux I__3350 (
            .O(N__13782),
            .I(N__13675));
    ClkMux I__3349 (
            .O(N__13781),
            .I(N__13675));
    ClkMux I__3348 (
            .O(N__13780),
            .I(N__13675));
    ClkMux I__3347 (
            .O(N__13779),
            .I(N__13675));
    ClkMux I__3346 (
            .O(N__13778),
            .I(N__13675));
    GlobalMux I__3345 (
            .O(N__13675),
            .I(N__13672));
    gio2CtrlBuf I__3344 (
            .O(N__13672),
            .I(CLK_c));
    InMux I__3343 (
            .O(N__13669),
            .I(N__13661));
    InMux I__3342 (
            .O(N__13668),
            .I(N__13661));
    InMux I__3341 (
            .O(N__13667),
            .I(N__13655));
    InMux I__3340 (
            .O(N__13666),
            .I(N__13655));
    LocalMux I__3339 (
            .O(N__13661),
            .I(N__13652));
    InMux I__3338 (
            .O(N__13660),
            .I(N__13649));
    LocalMux I__3337 (
            .O(N__13655),
            .I(N__13646));
    Span4Mux_h I__3336 (
            .O(N__13652),
            .I(N__13641));
    LocalMux I__3335 (
            .O(N__13649),
            .I(N__13641));
    Odrv12 I__3334 (
            .O(N__13646),
            .I(\inst_midgetv_core.s_shift_0 ));
    Odrv4 I__3333 (
            .O(N__13641),
            .I(\inst_midgetv_core.s_shift_0 ));
    InMux I__3332 (
            .O(N__13636),
            .I(N__13633));
    LocalMux I__3331 (
            .O(N__13633),
            .I(\inst_midgetv_core.inst_shiftcounter.genblk1_d_1 ));
    CascadeMux I__3330 (
            .O(N__13630),
            .I(N__13627));
    InMux I__3329 (
            .O(N__13627),
            .I(N__13624));
    LocalMux I__3328 (
            .O(N__13624),
            .I(N__13621));
    Span4Mux_v I__3327 (
            .O(N__13621),
            .I(N__13618));
    Odrv4 I__3326 (
            .O(N__13618),
            .I(\inst_midgetv_core.sa23 ));
    InMux I__3325 (
            .O(N__13615),
            .I(N__13612));
    LocalMux I__3324 (
            .O(N__13612),
            .I(N__13609));
    Span4Mux_h I__3323 (
            .O(N__13609),
            .I(N__13605));
    InMux I__3322 (
            .O(N__13608),
            .I(N__13602));
    Odrv4 I__3321 (
            .O(N__13605),
            .I(ACK_I));
    LocalMux I__3320 (
            .O(N__13602),
            .I(ACK_I));
    InMux I__3319 (
            .O(N__13597),
            .I(N__13591));
    InMux I__3318 (
            .O(N__13596),
            .I(N__13591));
    LocalMux I__3317 (
            .O(N__13591),
            .I(N__13588));
    Odrv12 I__3316 (
            .O(N__13588),
            .I(\inst_midgetv_core.sa34 ));
    InMux I__3315 (
            .O(N__13585),
            .I(N__13576));
    InMux I__3314 (
            .O(N__13584),
            .I(N__13576));
    InMux I__3313 (
            .O(N__13583),
            .I(N__13576));
    LocalMux I__3312 (
            .O(N__13576),
            .I(N__13573));
    Odrv12 I__3311 (
            .O(N__13573),
            .I(\inst_midgetv_core.sa40 ));
    CascadeMux I__3310 (
            .O(N__13570),
            .I(N__13566));
    InMux I__3309 (
            .O(N__13569),
            .I(N__13560));
    InMux I__3308 (
            .O(N__13566),
            .I(N__13560));
    InMux I__3307 (
            .O(N__13565),
            .I(N__13557));
    LocalMux I__3306 (
            .O(N__13560),
            .I(N__13554));
    LocalMux I__3305 (
            .O(N__13557),
            .I(\inst_midgetv_core.sram_stb ));
    Odrv4 I__3304 (
            .O(N__13554),
            .I(\inst_midgetv_core.sram_stb ));
    InMux I__3303 (
            .O(N__13549),
            .I(N__13546));
    LocalMux I__3302 (
            .O(N__13546),
            .I(N__13542));
    InMux I__3301 (
            .O(N__13545),
            .I(N__13539));
    Span4Mux_v I__3300 (
            .O(N__13542),
            .I(N__13528));
    LocalMux I__3299 (
            .O(N__13539),
            .I(N__13528));
    InMux I__3298 (
            .O(N__13538),
            .I(N__13525));
    InMux I__3297 (
            .O(N__13537),
            .I(N__13522));
    InMux I__3296 (
            .O(N__13536),
            .I(N__13515));
    InMux I__3295 (
            .O(N__13535),
            .I(N__13515));
    InMux I__3294 (
            .O(N__13534),
            .I(N__13512));
    InMux I__3293 (
            .O(N__13533),
            .I(N__13509));
    Span4Mux_h I__3292 (
            .O(N__13528),
            .I(N__13506));
    LocalMux I__3291 (
            .O(N__13525),
            .I(N__13501));
    LocalMux I__3290 (
            .O(N__13522),
            .I(N__13501));
    InMux I__3289 (
            .O(N__13521),
            .I(N__13496));
    InMux I__3288 (
            .O(N__13520),
            .I(N__13496));
    LocalMux I__3287 (
            .O(N__13515),
            .I(N__13493));
    LocalMux I__3286 (
            .O(N__13512),
            .I(N__13490));
    LocalMux I__3285 (
            .O(N__13509),
            .I(STB_O));
    Odrv4 I__3284 (
            .O(N__13506),
            .I(STB_O));
    Odrv12 I__3283 (
            .O(N__13501),
            .I(STB_O));
    LocalMux I__3282 (
            .O(N__13496),
            .I(STB_O));
    Odrv4 I__3281 (
            .O(N__13493),
            .I(STB_O));
    Odrv4 I__3280 (
            .O(N__13490),
            .I(STB_O));
    InMux I__3279 (
            .O(N__13477),
            .I(N__13474));
    LocalMux I__3278 (
            .O(N__13474),
            .I(N__13471));
    Span4Mux_v I__3277 (
            .O(N__13471),
            .I(N__13468));
    Span4Mux_v I__3276 (
            .O(N__13468),
            .I(N__13465));
    Odrv4 I__3275 (
            .O(N__13465),
            .I(\inst_midgetv_core.sa20 ));
    InMux I__3274 (
            .O(N__13462),
            .I(N__13459));
    LocalMux I__3273 (
            .O(N__13459),
            .I(\inst_midgetv_core.inst_rai.genblk1_sel0h ));
    InMux I__3272 (
            .O(N__13456),
            .I(N__13453));
    LocalMux I__3271 (
            .O(N__13453),
            .I(\inst_midgetv_core.inst_rai.genblk1_sel0hack ));
    InMux I__3270 (
            .O(N__13450),
            .I(N__13446));
    InMux I__3269 (
            .O(N__13449),
            .I(N__13443));
    LocalMux I__3268 (
            .O(N__13446),
            .I(N__13436));
    LocalMux I__3267 (
            .O(N__13443),
            .I(N__13436));
    InMux I__3266 (
            .O(N__13442),
            .I(N__13433));
    InMux I__3265 (
            .O(N__13441),
            .I(N__13427));
    Span4Mux_h I__3264 (
            .O(N__13436),
            .I(N__13422));
    LocalMux I__3263 (
            .O(N__13433),
            .I(N__13422));
    CascadeMux I__3262 (
            .O(N__13432),
            .I(N__13418));
    CascadeMux I__3261 (
            .O(N__13431),
            .I(N__13414));
    CascadeMux I__3260 (
            .O(N__13430),
            .I(N__13410));
    LocalMux I__3259 (
            .O(N__13427),
            .I(N__13407));
    Span4Mux_v I__3258 (
            .O(N__13422),
            .I(N__13404));
    InMux I__3257 (
            .O(N__13421),
            .I(N__13391));
    InMux I__3256 (
            .O(N__13418),
            .I(N__13391));
    InMux I__3255 (
            .O(N__13417),
            .I(N__13391));
    InMux I__3254 (
            .O(N__13414),
            .I(N__13391));
    InMux I__3253 (
            .O(N__13413),
            .I(N__13391));
    InMux I__3252 (
            .O(N__13410),
            .I(N__13391));
    Span4Mux_h I__3251 (
            .O(N__13407),
            .I(N__13387));
    Span4Mux_v I__3250 (
            .O(N__13404),
            .I(N__13382));
    LocalMux I__3249 (
            .O(N__13391),
            .I(N__13382));
    InMux I__3248 (
            .O(N__13390),
            .I(N__13379));
    Span4Mux_h I__3247 (
            .O(N__13387),
            .I(N__13376));
    Span4Mux_h I__3246 (
            .O(N__13382),
            .I(N__13373));
    LocalMux I__3245 (
            .O(N__13379),
            .I(\inst_midgetv_core.sa26 ));
    Odrv4 I__3244 (
            .O(N__13376),
            .I(\inst_midgetv_core.sa26 ));
    Odrv4 I__3243 (
            .O(N__13373),
            .I(\inst_midgetv_core.sa26 ));
    CascadeMux I__3242 (
            .O(N__13366),
            .I(N__13362));
    CascadeMux I__3241 (
            .O(N__13365),
            .I(N__13358));
    InMux I__3240 (
            .O(N__13362),
            .I(N__13354));
    InMux I__3239 (
            .O(N__13361),
            .I(N__13351));
    InMux I__3238 (
            .O(N__13358),
            .I(N__13348));
    InMux I__3237 (
            .O(N__13357),
            .I(N__13345));
    LocalMux I__3236 (
            .O(N__13354),
            .I(N__13339));
    LocalMux I__3235 (
            .O(N__13351),
            .I(N__13339));
    LocalMux I__3234 (
            .O(N__13348),
            .I(N__13336));
    LocalMux I__3233 (
            .O(N__13345),
            .I(N__13333));
    InMux I__3232 (
            .O(N__13344),
            .I(N__13324));
    Span4Mux_h I__3231 (
            .O(N__13339),
            .I(N__13321));
    Span4Mux_h I__3230 (
            .O(N__13336),
            .I(N__13316));
    Span4Mux_v I__3229 (
            .O(N__13333),
            .I(N__13316));
    InMux I__3228 (
            .O(N__13332),
            .I(N__13303));
    InMux I__3227 (
            .O(N__13331),
            .I(N__13303));
    InMux I__3226 (
            .O(N__13330),
            .I(N__13303));
    InMux I__3225 (
            .O(N__13329),
            .I(N__13303));
    InMux I__3224 (
            .O(N__13328),
            .I(N__13303));
    InMux I__3223 (
            .O(N__13327),
            .I(N__13303));
    LocalMux I__3222 (
            .O(N__13324),
            .I(N__13300));
    Span4Mux_v I__3221 (
            .O(N__13321),
            .I(N__13291));
    Span4Mux_h I__3220 (
            .O(N__13316),
            .I(N__13291));
    LocalMux I__3219 (
            .O(N__13303),
            .I(N__13291));
    Span12Mux_v I__3218 (
            .O(N__13300),
            .I(N__13288));
    InMux I__3217 (
            .O(N__13299),
            .I(N__13283));
    InMux I__3216 (
            .O(N__13298),
            .I(N__13283));
    Span4Mux_h I__3215 (
            .O(N__13291),
            .I(N__13280));
    Odrv12 I__3214 (
            .O(N__13288),
            .I(\inst_midgetv_core.sa27 ));
    LocalMux I__3213 (
            .O(N__13283),
            .I(\inst_midgetv_core.sa27 ));
    Odrv4 I__3212 (
            .O(N__13280),
            .I(\inst_midgetv_core.sa27 ));
    InMux I__3211 (
            .O(N__13273),
            .I(N__13270));
    LocalMux I__3210 (
            .O(N__13270),
            .I(N__13267));
    Span4Mux_v I__3209 (
            .O(N__13267),
            .I(N__13262));
    InMux I__3208 (
            .O(N__13266),
            .I(N__13259));
    InMux I__3207 (
            .O(N__13265),
            .I(N__13255));
    Span4Mux_h I__3206 (
            .O(N__13262),
            .I(N__13250));
    LocalMux I__3205 (
            .O(N__13259),
            .I(N__13250));
    InMux I__3204 (
            .O(N__13258),
            .I(N__13247));
    LocalMux I__3203 (
            .O(N__13255),
            .I(N__13244));
    Odrv4 I__3202 (
            .O(N__13250),
            .I(\inst_midgetv_core.ADR_O_8 ));
    LocalMux I__3201 (
            .O(N__13247),
            .I(\inst_midgetv_core.ADR_O_8 ));
    Odrv4 I__3200 (
            .O(N__13244),
            .I(\inst_midgetv_core.ADR_O_8 ));
    CascadeMux I__3199 (
            .O(N__13237),
            .I(N__13234));
    CascadeBuf I__3198 (
            .O(N__13234),
            .I(N__13231));
    CascadeMux I__3197 (
            .O(N__13231),
            .I(N__13228));
    CascadeBuf I__3196 (
            .O(N__13228),
            .I(N__13225));
    CascadeMux I__3195 (
            .O(N__13225),
            .I(N__13222));
    CascadeBuf I__3194 (
            .O(N__13222),
            .I(N__13219));
    CascadeMux I__3193 (
            .O(N__13219),
            .I(N__13216));
    CascadeBuf I__3192 (
            .O(N__13216),
            .I(N__13213));
    CascadeMux I__3191 (
            .O(N__13213),
            .I(N__13210));
    CascadeBuf I__3190 (
            .O(N__13210),
            .I(N__13207));
    CascadeMux I__3189 (
            .O(N__13207),
            .I(N__13204));
    CascadeBuf I__3188 (
            .O(N__13204),
            .I(N__13201));
    CascadeMux I__3187 (
            .O(N__13201),
            .I(N__13198));
    CascadeBuf I__3186 (
            .O(N__13198),
            .I(N__13195));
    CascadeMux I__3185 (
            .O(N__13195),
            .I(N__13192));
    InMux I__3184 (
            .O(N__13192),
            .I(N__13189));
    LocalMux I__3183 (
            .O(N__13189),
            .I(N__13186));
    Span12Mux_s11_v I__3182 (
            .O(N__13186),
            .I(N__13183));
    Odrv12 I__3181 (
            .O(N__13183),
            .I(\inst_midgetv_core.Wai_6 ));
    CascadeMux I__3180 (
            .O(N__13180),
            .I(N__13177));
    InMux I__3179 (
            .O(N__13177),
            .I(N__13173));
    InMux I__3178 (
            .O(N__13176),
            .I(N__13170));
    LocalMux I__3177 (
            .O(N__13173),
            .I(N__13166));
    LocalMux I__3176 (
            .O(N__13170),
            .I(N__13163));
    InMux I__3175 (
            .O(N__13169),
            .I(N__13160));
    Span4Mux_v I__3174 (
            .O(N__13166),
            .I(N__13157));
    Span4Mux_v I__3173 (
            .O(N__13163),
            .I(N__13154));
    LocalMux I__3172 (
            .O(N__13160),
            .I(N__13151));
    Span4Mux_v I__3171 (
            .O(N__13157),
            .I(N__13148));
    Odrv4 I__3170 (
            .O(N__13154),
            .I(\inst_midgetv_core.INSTR_21 ));
    Odrv12 I__3169 (
            .O(N__13151),
            .I(\inst_midgetv_core.INSTR_21 ));
    Odrv4 I__3168 (
            .O(N__13148),
            .I(\inst_midgetv_core.INSTR_21 ));
    InMux I__3167 (
            .O(N__13141),
            .I(N__13138));
    LocalMux I__3166 (
            .O(N__13138),
            .I(N__13134));
    InMux I__3165 (
            .O(N__13137),
            .I(N__13131));
    Span4Mux_h I__3164 (
            .O(N__13134),
            .I(N__13127));
    LocalMux I__3163 (
            .O(N__13131),
            .I(N__13124));
    InMux I__3162 (
            .O(N__13130),
            .I(N__13121));
    Span4Mux_h I__3161 (
            .O(N__13127),
            .I(N__13118));
    Span12Mux_s11_v I__3160 (
            .O(N__13124),
            .I(N__13115));
    LocalMux I__3159 (
            .O(N__13121),
            .I(N__13112));
    Odrv4 I__3158 (
            .O(N__13118),
            .I(\inst_midgetv_core.INSTR_16 ));
    Odrv12 I__3157 (
            .O(N__13115),
            .I(\inst_midgetv_core.INSTR_16 ));
    Odrv4 I__3156 (
            .O(N__13112),
            .I(\inst_midgetv_core.INSTR_16 ));
    CascadeMux I__3155 (
            .O(N__13105),
            .I(N__13101));
    InMux I__3154 (
            .O(N__13104),
            .I(N__13098));
    InMux I__3153 (
            .O(N__13101),
            .I(N__13095));
    LocalMux I__3152 (
            .O(N__13098),
            .I(N__13091));
    LocalMux I__3151 (
            .O(N__13095),
            .I(N__13088));
    InMux I__3150 (
            .O(N__13094),
            .I(N__13085));
    Span4Mux_v I__3149 (
            .O(N__13091),
            .I(N__13082));
    Span4Mux_v I__3148 (
            .O(N__13088),
            .I(N__13079));
    LocalMux I__3147 (
            .O(N__13085),
            .I(N__13076));
    Sp12to4 I__3146 (
            .O(N__13082),
            .I(N__13073));
    Span4Mux_v I__3145 (
            .O(N__13079),
            .I(N__13070));
    Span4Mux_h I__3144 (
            .O(N__13076),
            .I(N__13067));
    Odrv12 I__3143 (
            .O(N__13073),
            .I(\inst_midgetv_core.INSTR_18 ));
    Odrv4 I__3142 (
            .O(N__13070),
            .I(\inst_midgetv_core.INSTR_18 ));
    Odrv4 I__3141 (
            .O(N__13067),
            .I(\inst_midgetv_core.INSTR_18 ));
    InMux I__3140 (
            .O(N__13060),
            .I(N__13055));
    InMux I__3139 (
            .O(N__13059),
            .I(N__13052));
    InMux I__3138 (
            .O(N__13058),
            .I(N__13049));
    LocalMux I__3137 (
            .O(N__13055),
            .I(N__13046));
    LocalMux I__3136 (
            .O(N__13052),
            .I(N__13041));
    LocalMux I__3135 (
            .O(N__13049),
            .I(N__13041));
    Span12Mux_s10_v I__3134 (
            .O(N__13046),
            .I(N__13038));
    Odrv12 I__3133 (
            .O(N__13041),
            .I(\inst_midgetv_core.INSTR_23 ));
    Odrv12 I__3132 (
            .O(N__13038),
            .I(\inst_midgetv_core.INSTR_23 ));
    InMux I__3131 (
            .O(N__13033),
            .I(N__13030));
    LocalMux I__3130 (
            .O(N__13030),
            .I(\inst_midgetv_core.inst_shiftcounter.dbg_rshcnt_3 ));
    InMux I__3129 (
            .O(N__13027),
            .I(\inst_midgetv_core.inst_shiftcounter.genblk1_shcy_2 ));
    CascadeMux I__3128 (
            .O(N__13024),
            .I(N__13021));
    InMux I__3127 (
            .O(N__13021),
            .I(N__13018));
    LocalMux I__3126 (
            .O(N__13018),
            .I(\inst_midgetv_core.inst_shiftcounter.dbg_rshcnt_4 ));
    InMux I__3125 (
            .O(N__13015),
            .I(\inst_midgetv_core.inst_shiftcounter.genblk1_shcy_3 ));
    SRMux I__3124 (
            .O(N__13012),
            .I(N__13005));
    SRMux I__3123 (
            .O(N__13011),
            .I(N__13002));
    CascadeMux I__3122 (
            .O(N__13010),
            .I(N__12999));
    SRMux I__3121 (
            .O(N__13009),
            .I(N__12986));
    SRMux I__3120 (
            .O(N__13008),
            .I(N__12979));
    LocalMux I__3119 (
            .O(N__13005),
            .I(N__12975));
    LocalMux I__3118 (
            .O(N__13002),
            .I(N__12972));
    InMux I__3117 (
            .O(N__12999),
            .I(N__12969));
    InMux I__3116 (
            .O(N__12998),
            .I(N__12966));
    InMux I__3115 (
            .O(N__12997),
            .I(N__12960));
    InMux I__3114 (
            .O(N__12996),
            .I(N__12960));
    InMux I__3113 (
            .O(N__12995),
            .I(N__12947));
    InMux I__3112 (
            .O(N__12994),
            .I(N__12947));
    InMux I__3111 (
            .O(N__12993),
            .I(N__12947));
    InMux I__3110 (
            .O(N__12992),
            .I(N__12947));
    InMux I__3109 (
            .O(N__12991),
            .I(N__12947));
    InMux I__3108 (
            .O(N__12990),
            .I(N__12947));
    CascadeMux I__3107 (
            .O(N__12989),
            .I(N__12944));
    LocalMux I__3106 (
            .O(N__12986),
            .I(N__12941));
    SRMux I__3105 (
            .O(N__12985),
            .I(N__12938));
    SRMux I__3104 (
            .O(N__12984),
            .I(N__12935));
    SRMux I__3103 (
            .O(N__12983),
            .I(N__12932));
    SRMux I__3102 (
            .O(N__12982),
            .I(N__12929));
    LocalMux I__3101 (
            .O(N__12979),
            .I(N__12923));
    SRMux I__3100 (
            .O(N__12978),
            .I(N__12920));
    Span4Mux_v I__3099 (
            .O(N__12975),
            .I(N__12911));
    Span4Mux_h I__3098 (
            .O(N__12972),
            .I(N__12911));
    LocalMux I__3097 (
            .O(N__12969),
            .I(N__12911));
    LocalMux I__3096 (
            .O(N__12966),
            .I(N__12911));
    SRMux I__3095 (
            .O(N__12965),
            .I(N__12908));
    LocalMux I__3094 (
            .O(N__12960),
            .I(N__12900));
    LocalMux I__3093 (
            .O(N__12947),
            .I(N__12900));
    InMux I__3092 (
            .O(N__12944),
            .I(N__12897));
    Span4Mux_s1_v I__3091 (
            .O(N__12941),
            .I(N__12890));
    LocalMux I__3090 (
            .O(N__12938),
            .I(N__12890));
    LocalMux I__3089 (
            .O(N__12935),
            .I(N__12890));
    LocalMux I__3088 (
            .O(N__12932),
            .I(N__12885));
    LocalMux I__3087 (
            .O(N__12929),
            .I(N__12885));
    SRMux I__3086 (
            .O(N__12928),
            .I(N__12882));
    SRMux I__3085 (
            .O(N__12927),
            .I(N__12879));
    SRMux I__3084 (
            .O(N__12926),
            .I(N__12876));
    Span4Mux_v I__3083 (
            .O(N__12923),
            .I(N__12867));
    LocalMux I__3082 (
            .O(N__12920),
            .I(N__12867));
    Span4Mux_h I__3081 (
            .O(N__12911),
            .I(N__12867));
    LocalMux I__3080 (
            .O(N__12908),
            .I(N__12867));
    SRMux I__3079 (
            .O(N__12907),
            .I(N__12864));
    InMux I__3078 (
            .O(N__12906),
            .I(N__12860));
    SRMux I__3077 (
            .O(N__12905),
            .I(N__12857));
    Span4Mux_h I__3076 (
            .O(N__12900),
            .I(N__12852));
    LocalMux I__3075 (
            .O(N__12897),
            .I(N__12852));
    Span4Mux_v I__3074 (
            .O(N__12890),
            .I(N__12843));
    Span4Mux_v I__3073 (
            .O(N__12885),
            .I(N__12843));
    LocalMux I__3072 (
            .O(N__12882),
            .I(N__12843));
    LocalMux I__3071 (
            .O(N__12879),
            .I(N__12843));
    LocalMux I__3070 (
            .O(N__12876),
            .I(N__12836));
    Span4Mux_v I__3069 (
            .O(N__12867),
            .I(N__12836));
    LocalMux I__3068 (
            .O(N__12864),
            .I(N__12836));
    SRMux I__3067 (
            .O(N__12863),
            .I(N__12833));
    LocalMux I__3066 (
            .O(N__12860),
            .I(N__12830));
    LocalMux I__3065 (
            .O(N__12857),
            .I(N__12827));
    Sp12to4 I__3064 (
            .O(N__12852),
            .I(N__12824));
    Span4Mux_v I__3063 (
            .O(N__12843),
            .I(N__12819));
    Span4Mux_v I__3062 (
            .O(N__12836),
            .I(N__12819));
    LocalMux I__3061 (
            .O(N__12833),
            .I(N__12816));
    Span4Mux_h I__3060 (
            .O(N__12830),
            .I(N__12813));
    Span4Mux_v I__3059 (
            .O(N__12827),
            .I(N__12810));
    Span12Mux_v I__3058 (
            .O(N__12824),
            .I(N__12803));
    Sp12to4 I__3057 (
            .O(N__12819),
            .I(N__12803));
    Sp12to4 I__3056 (
            .O(N__12816),
            .I(N__12803));
    Odrv4 I__3055 (
            .O(N__12813),
            .I(CONSTANT_ONE_NET));
    Odrv4 I__3054 (
            .O(N__12810),
            .I(CONSTANT_ONE_NET));
    Odrv12 I__3053 (
            .O(N__12803),
            .I(CONSTANT_ONE_NET));
    InMux I__3052 (
            .O(N__12796),
            .I(\inst_midgetv_core.inst_shiftcounter.genblk1_shcy_4 ));
    CascadeMux I__3051 (
            .O(N__12793),
            .I(N__12790));
    InMux I__3050 (
            .O(N__12790),
            .I(N__12785));
    InMux I__3049 (
            .O(N__12789),
            .I(N__12782));
    InMux I__3048 (
            .O(N__12788),
            .I(N__12779));
    LocalMux I__3047 (
            .O(N__12785),
            .I(N__12776));
    LocalMux I__3046 (
            .O(N__12782),
            .I(N__12773));
    LocalMux I__3045 (
            .O(N__12779),
            .I(N__12770));
    Span4Mux_v I__3044 (
            .O(N__12776),
            .I(N__12767));
    Span4Mux_h I__3043 (
            .O(N__12773),
            .I(N__12764));
    Odrv12 I__3042 (
            .O(N__12770),
            .I(\inst_midgetv_core.lastshift ));
    Odrv4 I__3041 (
            .O(N__12767),
            .I(\inst_midgetv_core.lastshift ));
    Odrv4 I__3040 (
            .O(N__12764),
            .I(\inst_midgetv_core.lastshift ));
    InMux I__3039 (
            .O(N__12757),
            .I(N__12754));
    LocalMux I__3038 (
            .O(N__12754),
            .I(\inst_midgetv_core.inst_shiftcounter.genblk1_d_2 ));
    InMux I__3037 (
            .O(N__12751),
            .I(N__12747));
    InMux I__3036 (
            .O(N__12750),
            .I(N__12744));
    LocalMux I__3035 (
            .O(N__12747),
            .I(N__12739));
    LocalMux I__3034 (
            .O(N__12744),
            .I(N__12739));
    Span4Mux_v I__3033 (
            .O(N__12739),
            .I(N__12735));
    InMux I__3032 (
            .O(N__12738),
            .I(N__12732));
    Span4Mux_h I__3031 (
            .O(N__12735),
            .I(N__12722));
    LocalMux I__3030 (
            .O(N__12732),
            .I(N__12719));
    InMux I__3029 (
            .O(N__12731),
            .I(N__12714));
    InMux I__3028 (
            .O(N__12730),
            .I(N__12714));
    InMux I__3027 (
            .O(N__12729),
            .I(N__12709));
    InMux I__3026 (
            .O(N__12728),
            .I(N__12709));
    InMux I__3025 (
            .O(N__12727),
            .I(N__12706));
    InMux I__3024 (
            .O(N__12726),
            .I(N__12703));
    InMux I__3023 (
            .O(N__12725),
            .I(N__12700));
    Span4Mux_h I__3022 (
            .O(N__12722),
            .I(N__12697));
    Span4Mux_v I__3021 (
            .O(N__12719),
            .I(N__12690));
    LocalMux I__3020 (
            .O(N__12714),
            .I(N__12690));
    LocalMux I__3019 (
            .O(N__12709),
            .I(N__12690));
    LocalMux I__3018 (
            .O(N__12706),
            .I(N__12687));
    LocalMux I__3017 (
            .O(N__12703),
            .I(N__12682));
    LocalMux I__3016 (
            .O(N__12700),
            .I(N__12682));
    Sp12to4 I__3015 (
            .O(N__12697),
            .I(N__12679));
    Span4Mux_h I__3014 (
            .O(N__12690),
            .I(N__12674));
    Span4Mux_v I__3013 (
            .O(N__12687),
            .I(N__12674));
    Span12Mux_v I__3012 (
            .O(N__12682),
            .I(N__12669));
    Span12Mux_v I__3011 (
            .O(N__12679),
            .I(N__12669));
    Odrv4 I__3010 (
            .O(N__12674),
            .I(\inst_midgetv_core.B_1 ));
    Odrv12 I__3009 (
            .O(N__12669),
            .I(\inst_midgetv_core.B_1 ));
    InMux I__3008 (
            .O(N__12664),
            .I(N__12661));
    LocalMux I__3007 (
            .O(N__12661),
            .I(\inst_midgetv_core.inst_shiftcounter.genblk1_d_3 ));
    InMux I__3006 (
            .O(N__12658),
            .I(N__12655));
    LocalMux I__3005 (
            .O(N__12655),
            .I(N__12652));
    Odrv4 I__3004 (
            .O(N__12652),
            .I(\inst_midgetv_core.bmask_2 ));
    CEMux I__3003 (
            .O(N__12649),
            .I(N__12646));
    LocalMux I__3002 (
            .O(N__12646),
            .I(N__12642));
    CEMux I__3001 (
            .O(N__12645),
            .I(N__12639));
    Span4Mux_v I__3000 (
            .O(N__12642),
            .I(N__12634));
    LocalMux I__2999 (
            .O(N__12639),
            .I(N__12634));
    Span4Mux_v I__2998 (
            .O(N__12634),
            .I(N__12631));
    Odrv4 I__2997 (
            .O(N__12631),
            .I(\inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrb.we ));
    CascadeMux I__2996 (
            .O(N__12628),
            .I(N__12625));
    InMux I__2995 (
            .O(N__12625),
            .I(N__12622));
    LocalMux I__2994 (
            .O(N__12622),
            .I(\inst_midgetv_core.bmask_3 ));
    CEMux I__2993 (
            .O(N__12619),
            .I(N__12615));
    CEMux I__2992 (
            .O(N__12618),
            .I(N__12612));
    LocalMux I__2991 (
            .O(N__12615),
            .I(N__12607));
    LocalMux I__2990 (
            .O(N__12612),
            .I(N__12607));
    Span4Mux_s3_v I__2989 (
            .O(N__12607),
            .I(N__12604));
    Span4Mux_v I__2988 (
            .O(N__12604),
            .I(N__12601));
    Span4Mux_v I__2987 (
            .O(N__12601),
            .I(N__12598));
    Odrv4 I__2986 (
            .O(N__12598),
            .I(\inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrh.we ));
    InMux I__2985 (
            .O(N__12595),
            .I(N__12592));
    LocalMux I__2984 (
            .O(N__12592),
            .I(N__12589));
    Odrv4 I__2983 (
            .O(N__12589),
            .I(\inst_midgetv_core.bmask_1 ));
    InMux I__2982 (
            .O(N__12586),
            .I(N__12577));
    InMux I__2981 (
            .O(N__12585),
            .I(N__12577));
    InMux I__2980 (
            .O(N__12584),
            .I(N__12577));
    LocalMux I__2979 (
            .O(N__12577),
            .I(N__12573));
    InMux I__2978 (
            .O(N__12576),
            .I(N__12570));
    Odrv4 I__2977 (
            .O(N__12573),
            .I(\inst_midgetv_core.iwe ));
    LocalMux I__2976 (
            .O(N__12570),
            .I(\inst_midgetv_core.iwe ));
    CEMux I__2975 (
            .O(N__12565),
            .I(N__12562));
    LocalMux I__2974 (
            .O(N__12562),
            .I(N__12558));
    CEMux I__2973 (
            .O(N__12561),
            .I(N__12555));
    Span4Mux_v I__2972 (
            .O(N__12558),
            .I(N__12550));
    LocalMux I__2971 (
            .O(N__12555),
            .I(N__12550));
    Span4Mux_h I__2970 (
            .O(N__12550),
            .I(N__12547));
    Span4Mux_h I__2969 (
            .O(N__12547),
            .I(N__12544));
    Odrv4 I__2968 (
            .O(N__12544),
            .I(\inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrh.we ));
    CascadeMux I__2967 (
            .O(N__12541),
            .I(N__12536));
    CascadeMux I__2966 (
            .O(N__12540),
            .I(N__12531));
    CascadeMux I__2965 (
            .O(N__12539),
            .I(N__12527));
    InMux I__2964 (
            .O(N__12536),
            .I(N__12524));
    InMux I__2963 (
            .O(N__12535),
            .I(N__12513));
    InMux I__2962 (
            .O(N__12534),
            .I(N__12513));
    InMux I__2961 (
            .O(N__12531),
            .I(N__12513));
    InMux I__2960 (
            .O(N__12530),
            .I(N__12513));
    InMux I__2959 (
            .O(N__12527),
            .I(N__12513));
    LocalMux I__2958 (
            .O(N__12524),
            .I(N__12510));
    LocalMux I__2957 (
            .O(N__12513),
            .I(N__12507));
    Sp12to4 I__2956 (
            .O(N__12510),
            .I(N__12502));
    Sp12to4 I__2955 (
            .O(N__12507),
            .I(N__12502));
    Odrv12 I__2954 (
            .O(N__12502),
            .I(\inst_midgetv_core.s_shift_1 ));
    InMux I__2953 (
            .O(N__12499),
            .I(N__12496));
    LocalMux I__2952 (
            .O(N__12496),
            .I(N__12489));
    InMux I__2951 (
            .O(N__12495),
            .I(N__12486));
    InMux I__2950 (
            .O(N__12494),
            .I(N__12483));
    InMux I__2949 (
            .O(N__12493),
            .I(N__12480));
    InMux I__2948 (
            .O(N__12492),
            .I(N__12474));
    Span4Mux_v I__2947 (
            .O(N__12489),
            .I(N__12466));
    LocalMux I__2946 (
            .O(N__12486),
            .I(N__12466));
    LocalMux I__2945 (
            .O(N__12483),
            .I(N__12466));
    LocalMux I__2944 (
            .O(N__12480),
            .I(N__12462));
    InMux I__2943 (
            .O(N__12479),
            .I(N__12457));
    InMux I__2942 (
            .O(N__12478),
            .I(N__12457));
    InMux I__2941 (
            .O(N__12477),
            .I(N__12454));
    LocalMux I__2940 (
            .O(N__12474),
            .I(N__12451));
    InMux I__2939 (
            .O(N__12473),
            .I(N__12448));
    Span4Mux_v I__2938 (
            .O(N__12466),
            .I(N__12445));
    InMux I__2937 (
            .O(N__12465),
            .I(N__12442));
    Span12Mux_v I__2936 (
            .O(N__12462),
            .I(N__12435));
    LocalMux I__2935 (
            .O(N__12457),
            .I(N__12435));
    LocalMux I__2934 (
            .O(N__12454),
            .I(N__12435));
    Span4Mux_h I__2933 (
            .O(N__12451),
            .I(N__12432));
    LocalMux I__2932 (
            .O(N__12448),
            .I(N__12429));
    Span4Mux_h I__2931 (
            .O(N__12445),
            .I(N__12424));
    LocalMux I__2930 (
            .O(N__12442),
            .I(N__12424));
    Odrv12 I__2929 (
            .O(N__12435),
            .I(\inst_midgetv_core.B_0 ));
    Odrv4 I__2928 (
            .O(N__12432),
            .I(\inst_midgetv_core.B_0 ));
    Odrv12 I__2927 (
            .O(N__12429),
            .I(\inst_midgetv_core.B_0 ));
    Odrv4 I__2926 (
            .O(N__12424),
            .I(\inst_midgetv_core.B_0 ));
    InMux I__2925 (
            .O(N__12415),
            .I(N__12412));
    LocalMux I__2924 (
            .O(N__12412),
            .I(N__12409));
    Span4Mux_h I__2923 (
            .O(N__12409),
            .I(N__12406));
    Span4Mux_h I__2922 (
            .O(N__12406),
            .I(N__12403));
    Odrv4 I__2921 (
            .O(N__12403),
            .I(\inst_midgetv_core.s_alu_carryin_0 ));
    InMux I__2920 (
            .O(N__12400),
            .I(N__12396));
    CascadeMux I__2919 (
            .O(N__12399),
            .I(N__12393));
    LocalMux I__2918 (
            .O(N__12396),
            .I(N__12386));
    InMux I__2917 (
            .O(N__12393),
            .I(N__12379));
    InMux I__2916 (
            .O(N__12392),
            .I(N__12379));
    InMux I__2915 (
            .O(N__12391),
            .I(N__12379));
    CascadeMux I__2914 (
            .O(N__12390),
            .I(N__12376));
    CascadeMux I__2913 (
            .O(N__12389),
            .I(N__12372));
    Span4Mux_h I__2912 (
            .O(N__12386),
            .I(N__12364));
    LocalMux I__2911 (
            .O(N__12379),
            .I(N__12361));
    InMux I__2910 (
            .O(N__12376),
            .I(N__12352));
    InMux I__2909 (
            .O(N__12375),
            .I(N__12352));
    InMux I__2908 (
            .O(N__12372),
            .I(N__12352));
    InMux I__2907 (
            .O(N__12371),
            .I(N__12352));
    InMux I__2906 (
            .O(N__12370),
            .I(N__12343));
    InMux I__2905 (
            .O(N__12369),
            .I(N__12343));
    InMux I__2904 (
            .O(N__12368),
            .I(N__12343));
    InMux I__2903 (
            .O(N__12367),
            .I(N__12343));
    Odrv4 I__2902 (
            .O(N__12364),
            .I(\inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.indir_28 ));
    Odrv4 I__2901 (
            .O(N__12361),
            .I(\inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.indir_28 ));
    LocalMux I__2900 (
            .O(N__12352),
            .I(\inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.indir_28 ));
    LocalMux I__2899 (
            .O(N__12343),
            .I(\inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.indir_28 ));
    CascadeMux I__2898 (
            .O(N__12334),
            .I(N__12331));
    InMux I__2897 (
            .O(N__12331),
            .I(N__12328));
    LocalMux I__2896 (
            .O(N__12328),
            .I(N__12321));
    InMux I__2895 (
            .O(N__12327),
            .I(N__12314));
    InMux I__2894 (
            .O(N__12326),
            .I(N__12314));
    InMux I__2893 (
            .O(N__12325),
            .I(N__12314));
    CascadeMux I__2892 (
            .O(N__12324),
            .I(N__12308));
    Span4Mux_v I__2891 (
            .O(N__12321),
            .I(N__12299));
    LocalMux I__2890 (
            .O(N__12314),
            .I(N__12299));
    InMux I__2889 (
            .O(N__12313),
            .I(N__12290));
    InMux I__2888 (
            .O(N__12312),
            .I(N__12290));
    InMux I__2887 (
            .O(N__12311),
            .I(N__12290));
    InMux I__2886 (
            .O(N__12308),
            .I(N__12290));
    InMux I__2885 (
            .O(N__12307),
            .I(N__12281));
    InMux I__2884 (
            .O(N__12306),
            .I(N__12281));
    InMux I__2883 (
            .O(N__12305),
            .I(N__12281));
    InMux I__2882 (
            .O(N__12304),
            .I(N__12281));
    Odrv4 I__2881 (
            .O(N__12299),
            .I(\inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.indir_31 ));
    LocalMux I__2880 (
            .O(N__12290),
            .I(\inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.indir_31 ));
    LocalMux I__2879 (
            .O(N__12281),
            .I(\inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.indir_31 ));
    InMux I__2878 (
            .O(N__12274),
            .I(N__12269));
    CascadeMux I__2877 (
            .O(N__12273),
            .I(N__12266));
    CascadeMux I__2876 (
            .O(N__12272),
            .I(N__12263));
    LocalMux I__2875 (
            .O(N__12269),
            .I(N__12258));
    InMux I__2874 (
            .O(N__12266),
            .I(N__12251));
    InMux I__2873 (
            .O(N__12263),
            .I(N__12251));
    InMux I__2872 (
            .O(N__12262),
            .I(N__12251));
    CascadeMux I__2871 (
            .O(N__12261),
            .I(N__12244));
    Span4Mux_v I__2870 (
            .O(N__12258),
            .I(N__12236));
    LocalMux I__2869 (
            .O(N__12251),
            .I(N__12236));
    InMux I__2868 (
            .O(N__12250),
            .I(N__12227));
    InMux I__2867 (
            .O(N__12249),
            .I(N__12227));
    InMux I__2866 (
            .O(N__12248),
            .I(N__12227));
    InMux I__2865 (
            .O(N__12247),
            .I(N__12227));
    InMux I__2864 (
            .O(N__12244),
            .I(N__12224));
    InMux I__2863 (
            .O(N__12243),
            .I(N__12217));
    InMux I__2862 (
            .O(N__12242),
            .I(N__12217));
    InMux I__2861 (
            .O(N__12241),
            .I(N__12217));
    Odrv4 I__2860 (
            .O(N__12236),
            .I(\inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.indir_30 ));
    LocalMux I__2859 (
            .O(N__12227),
            .I(\inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.indir_30 ));
    LocalMux I__2858 (
            .O(N__12224),
            .I(\inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.indir_30 ));
    LocalMux I__2857 (
            .O(N__12217),
            .I(\inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.indir_30 ));
    InMux I__2856 (
            .O(N__12208),
            .I(N__12205));
    LocalMux I__2855 (
            .O(N__12205),
            .I(N__12194));
    InMux I__2854 (
            .O(N__12204),
            .I(N__12187));
    InMux I__2853 (
            .O(N__12203),
            .I(N__12187));
    InMux I__2852 (
            .O(N__12202),
            .I(N__12187));
    CascadeMux I__2851 (
            .O(N__12201),
            .I(N__12184));
    CascadeMux I__2850 (
            .O(N__12200),
            .I(N__12181));
    CascadeMux I__2849 (
            .O(N__12199),
            .I(N__12177));
    CascadeMux I__2848 (
            .O(N__12198),
            .I(N__12173));
    InMux I__2847 (
            .O(N__12197),
            .I(N__12169));
    Span4Mux_h I__2846 (
            .O(N__12194),
            .I(N__12166));
    LocalMux I__2845 (
            .O(N__12187),
            .I(N__12163));
    InMux I__2844 (
            .O(N__12184),
            .I(N__12156));
    InMux I__2843 (
            .O(N__12181),
            .I(N__12156));
    InMux I__2842 (
            .O(N__12180),
            .I(N__12156));
    InMux I__2841 (
            .O(N__12177),
            .I(N__12147));
    InMux I__2840 (
            .O(N__12176),
            .I(N__12147));
    InMux I__2839 (
            .O(N__12173),
            .I(N__12147));
    InMux I__2838 (
            .O(N__12172),
            .I(N__12147));
    LocalMux I__2837 (
            .O(N__12169),
            .I(\inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.indir_29 ));
    Odrv4 I__2836 (
            .O(N__12166),
            .I(\inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.indir_29 ));
    Odrv4 I__2835 (
            .O(N__12163),
            .I(\inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.indir_29 ));
    LocalMux I__2834 (
            .O(N__12156),
            .I(\inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.indir_29 ));
    LocalMux I__2833 (
            .O(N__12147),
            .I(\inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.indir_29 ));
    CascadeMux I__2832 (
            .O(N__12136),
            .I(N__12133));
    InMux I__2831 (
            .O(N__12133),
            .I(N__12130));
    LocalMux I__2830 (
            .O(N__12130),
            .I(N__12127));
    Span4Mux_v I__2829 (
            .O(N__12127),
            .I(N__12124));
    Span4Mux_h I__2828 (
            .O(N__12124),
            .I(N__12121));
    Odrv4 I__2827 (
            .O(N__12121),
            .I(\inst_midgetv_core.s_alu_carryin_1 ));
    InMux I__2826 (
            .O(N__12118),
            .I(N__12112));
    InMux I__2825 (
            .O(N__12117),
            .I(N__12106));
    InMux I__2824 (
            .O(N__12116),
            .I(N__12106));
    InMux I__2823 (
            .O(N__12115),
            .I(N__12103));
    LocalMux I__2822 (
            .O(N__12112),
            .I(N__12099));
    CascadeMux I__2821 (
            .O(N__12111),
            .I(N__12096));
    LocalMux I__2820 (
            .O(N__12106),
            .I(N__12091));
    LocalMux I__2819 (
            .O(N__12103),
            .I(N__12091));
    InMux I__2818 (
            .O(N__12102),
            .I(N__12088));
    Span4Mux_h I__2817 (
            .O(N__12099),
            .I(N__12085));
    InMux I__2816 (
            .O(N__12096),
            .I(N__12082));
    Span4Mux_v I__2815 (
            .O(N__12091),
            .I(N__12079));
    LocalMux I__2814 (
            .O(N__12088),
            .I(\inst_midgetv_core.sa24 ));
    Odrv4 I__2813 (
            .O(N__12085),
            .I(\inst_midgetv_core.sa24 ));
    LocalMux I__2812 (
            .O(N__12082),
            .I(\inst_midgetv_core.sa24 ));
    Odrv4 I__2811 (
            .O(N__12079),
            .I(\inst_midgetv_core.sa24 ));
    CascadeMux I__2810 (
            .O(N__12070),
            .I(N__12065));
    CascadeMux I__2809 (
            .O(N__12069),
            .I(N__12062));
    CascadeMux I__2808 (
            .O(N__12068),
            .I(N__12059));
    InMux I__2807 (
            .O(N__12065),
            .I(N__12053));
    InMux I__2806 (
            .O(N__12062),
            .I(N__12053));
    InMux I__2805 (
            .O(N__12059),
            .I(N__12050));
    CascadeMux I__2804 (
            .O(N__12058),
            .I(N__12047));
    LocalMux I__2803 (
            .O(N__12053),
            .I(N__12044));
    LocalMux I__2802 (
            .O(N__12050),
            .I(N__12041));
    InMux I__2801 (
            .O(N__12047),
            .I(N__12038));
    Span4Mux_v I__2800 (
            .O(N__12044),
            .I(N__12035));
    Odrv4 I__2799 (
            .O(N__12041),
            .I(\inst_midgetv_core.inst_progressctrl.blka_usedefault ));
    LocalMux I__2798 (
            .O(N__12038),
            .I(\inst_midgetv_core.inst_progressctrl.blka_usedefault ));
    Odrv4 I__2797 (
            .O(N__12035),
            .I(\inst_midgetv_core.inst_progressctrl.blka_usedefault ));
    CEMux I__2796 (
            .O(N__12028),
            .I(N__12023));
    CEMux I__2795 (
            .O(N__12027),
            .I(N__12020));
    CEMux I__2794 (
            .O(N__12026),
            .I(N__12017));
    LocalMux I__2793 (
            .O(N__12023),
            .I(N__12014));
    LocalMux I__2792 (
            .O(N__12020),
            .I(N__12011));
    LocalMux I__2791 (
            .O(N__12017),
            .I(N__12008));
    Span4Mux_v I__2790 (
            .O(N__12014),
            .I(N__12003));
    Span4Mux_h I__2789 (
            .O(N__12011),
            .I(N__12003));
    Odrv4 I__2788 (
            .O(N__12008),
            .I(\inst_midgetv_core.inst_progressctrl.blka_en ));
    Odrv4 I__2787 (
            .O(N__12003),
            .I(\inst_midgetv_core.inst_progressctrl.blka_en ));
    InMux I__2786 (
            .O(N__11998),
            .I(N__11995));
    LocalMux I__2785 (
            .O(N__11995),
            .I(\inst_midgetv_core.inst_shiftcounter.genblk1_d_0 ));
    InMux I__2784 (
            .O(N__11992),
            .I(N__11989));
    LocalMux I__2783 (
            .O(N__11989),
            .I(\inst_midgetv_core.inst_shiftcounter.dbg_rshcnt_1 ));
    InMux I__2782 (
            .O(N__11986),
            .I(\inst_midgetv_core.inst_shiftcounter.genblk1_shcy_0 ));
    CascadeMux I__2781 (
            .O(N__11983),
            .I(N__11980));
    InMux I__2780 (
            .O(N__11980),
            .I(N__11977));
    LocalMux I__2779 (
            .O(N__11977),
            .I(\inst_midgetv_core.inst_shiftcounter.dbg_rshcnt_2 ));
    InMux I__2778 (
            .O(N__11974),
            .I(\inst_midgetv_core.inst_shiftcounter.genblk1_shcy_1 ));
    SRMux I__2777 (
            .O(N__11971),
            .I(N__11968));
    LocalMux I__2776 (
            .O(N__11968),
            .I(N__11965));
    Span4Mux_h I__2775 (
            .O(N__11965),
            .I(N__11961));
    InMux I__2774 (
            .O(N__11964),
            .I(N__11958));
    Span4Mux_v I__2773 (
            .O(N__11961),
            .I(N__11953));
    LocalMux I__2772 (
            .O(N__11958),
            .I(N__11950));
    InMux I__2771 (
            .O(N__11957),
            .I(N__11945));
    InMux I__2770 (
            .O(N__11956),
            .I(N__11945));
    Span4Mux_h I__2769 (
            .O(N__11953),
            .I(N__11939));
    Span4Mux_h I__2768 (
            .O(N__11950),
            .I(N__11939));
    LocalMux I__2767 (
            .O(N__11945),
            .I(N__11936));
    InMux I__2766 (
            .O(N__11944),
            .I(N__11933));
    Odrv4 I__2765 (
            .O(N__11939),
            .I(\inst_midgetv_core.buserror ));
    Odrv4 I__2764 (
            .O(N__11936),
            .I(\inst_midgetv_core.buserror ));
    LocalMux I__2763 (
            .O(N__11933),
            .I(\inst_midgetv_core.buserror ));
    CEMux I__2762 (
            .O(N__11926),
            .I(N__11923));
    LocalMux I__2761 (
            .O(N__11923),
            .I(N__11920));
    Span4Mux_v I__2760 (
            .O(N__11920),
            .I(N__11916));
    CEMux I__2759 (
            .O(N__11919),
            .I(N__11913));
    Sp12to4 I__2758 (
            .O(N__11916),
            .I(N__11908));
    LocalMux I__2757 (
            .O(N__11913),
            .I(N__11908));
    Odrv12 I__2756 (
            .O(N__11908),
            .I(CONSTANT_ZERO_NET));
    InMux I__2755 (
            .O(N__11905),
            .I(N__11902));
    LocalMux I__2754 (
            .O(N__11902),
            .I(N__11898));
    InMux I__2753 (
            .O(N__11901),
            .I(N__11895));
    Span4Mux_h I__2752 (
            .O(N__11898),
            .I(N__11890));
    LocalMux I__2751 (
            .O(N__11895),
            .I(N__11890));
    Odrv4 I__2750 (
            .O(N__11890),
            .I(\inst_midgetv_core.sa15 ));
    InMux I__2749 (
            .O(N__11887),
            .I(N__11883));
    InMux I__2748 (
            .O(N__11886),
            .I(N__11880));
    LocalMux I__2747 (
            .O(N__11883),
            .I(\inst_midgetv_core.sa32 ));
    LocalMux I__2746 (
            .O(N__11880),
            .I(\inst_midgetv_core.sa32 ));
    CascadeMux I__2745 (
            .O(N__11875),
            .I(N__11872));
    InMux I__2744 (
            .O(N__11872),
            .I(N__11869));
    LocalMux I__2743 (
            .O(N__11869),
            .I(N__11865));
    InMux I__2742 (
            .O(N__11868),
            .I(N__11862));
    Odrv12 I__2741 (
            .O(N__11865),
            .I(\inst_midgetv_core.inst_ucodepc.maybranch_N_253 ));
    LocalMux I__2740 (
            .O(N__11862),
            .I(\inst_midgetv_core.inst_ucodepc.maybranch_N_253 ));
    InMux I__2739 (
            .O(N__11857),
            .I(N__11854));
    LocalMux I__2738 (
            .O(N__11854),
            .I(N__11850));
    InMux I__2737 (
            .O(N__11853),
            .I(N__11847));
    Span4Mux_h I__2736 (
            .O(N__11850),
            .I(N__11843));
    LocalMux I__2735 (
            .O(N__11847),
            .I(N__11840));
    InMux I__2734 (
            .O(N__11846),
            .I(N__11837));
    Odrv4 I__2733 (
            .O(N__11843),
            .I(\inst_midgetv_core.sa30 ));
    Odrv12 I__2732 (
            .O(N__11840),
            .I(\inst_midgetv_core.sa30 ));
    LocalMux I__2731 (
            .O(N__11837),
            .I(\inst_midgetv_core.sa30 ));
    CascadeMux I__2730 (
            .O(N__11830),
            .I(N__11827));
    InMux I__2729 (
            .O(N__11827),
            .I(N__11824));
    LocalMux I__2728 (
            .O(N__11824),
            .I(N__11820));
    InMux I__2727 (
            .O(N__11823),
            .I(N__11817));
    Odrv12 I__2726 (
            .O(N__11820),
            .I(\inst_midgetv_core.sa37 ));
    LocalMux I__2725 (
            .O(N__11817),
            .I(\inst_midgetv_core.sa37 ));
    InMux I__2724 (
            .O(N__11812),
            .I(N__11806));
    InMux I__2723 (
            .O(N__11811),
            .I(N__11806));
    LocalMux I__2722 (
            .O(N__11806),
            .I(\inst_midgetv_core.sa25 ));
    InMux I__2721 (
            .O(N__11803),
            .I(N__11796));
    InMux I__2720 (
            .O(N__11802),
            .I(N__11796));
    InMux I__2719 (
            .O(N__11801),
            .I(N__11791));
    LocalMux I__2718 (
            .O(N__11796),
            .I(N__11788));
    InMux I__2717 (
            .O(N__11795),
            .I(N__11785));
    InMux I__2716 (
            .O(N__11794),
            .I(N__11782));
    LocalMux I__2715 (
            .O(N__11791),
            .I(N__11778));
    Span4Mux_v I__2714 (
            .O(N__11788),
            .I(N__11771));
    LocalMux I__2713 (
            .O(N__11785),
            .I(N__11771));
    LocalMux I__2712 (
            .O(N__11782),
            .I(N__11771));
    CascadeMux I__2711 (
            .O(N__11781),
            .I(N__11766));
    Span4Mux_h I__2710 (
            .O(N__11778),
            .I(N__11763));
    Span4Mux_v I__2709 (
            .O(N__11771),
            .I(N__11760));
    InMux I__2708 (
            .O(N__11770),
            .I(N__11757));
    InMux I__2707 (
            .O(N__11769),
            .I(N__11752));
    InMux I__2706 (
            .O(N__11766),
            .I(N__11752));
    Odrv4 I__2705 (
            .O(N__11763),
            .I(ADR_O_3));
    Odrv4 I__2704 (
            .O(N__11760),
            .I(ADR_O_3));
    LocalMux I__2703 (
            .O(N__11757),
            .I(ADR_O_3));
    LocalMux I__2702 (
            .O(N__11752),
            .I(ADR_O_3));
    InMux I__2701 (
            .O(N__11743),
            .I(N__11740));
    LocalMux I__2700 (
            .O(N__11740),
            .I(\inst_midgetv_core.inst_wai.genblk1_preWai1 ));
    InMux I__2699 (
            .O(N__11737),
            .I(N__11733));
    CascadeMux I__2698 (
            .O(N__11736),
            .I(N__11730));
    LocalMux I__2697 (
            .O(N__11733),
            .I(N__11727));
    InMux I__2696 (
            .O(N__11730),
            .I(N__11724));
    Span4Mux_h I__2695 (
            .O(N__11727),
            .I(N__11717));
    LocalMux I__2694 (
            .O(N__11724),
            .I(N__11717));
    InMux I__2693 (
            .O(N__11723),
            .I(N__11712));
    InMux I__2692 (
            .O(N__11722),
            .I(N__11712));
    Odrv4 I__2691 (
            .O(N__11717),
            .I(\inst_midgetv_core.ADR_O_11 ));
    LocalMux I__2690 (
            .O(N__11712),
            .I(\inst_midgetv_core.ADR_O_11 ));
    CascadeMux I__2689 (
            .O(N__11707),
            .I(N__11704));
    CascadeBuf I__2688 (
            .O(N__11704),
            .I(N__11701));
    CascadeMux I__2687 (
            .O(N__11701),
            .I(N__11698));
    CascadeBuf I__2686 (
            .O(N__11698),
            .I(N__11695));
    CascadeMux I__2685 (
            .O(N__11695),
            .I(N__11692));
    CascadeBuf I__2684 (
            .O(N__11692),
            .I(N__11689));
    CascadeMux I__2683 (
            .O(N__11689),
            .I(N__11686));
    CascadeBuf I__2682 (
            .O(N__11686),
            .I(N__11683));
    CascadeMux I__2681 (
            .O(N__11683),
            .I(N__11680));
    CascadeBuf I__2680 (
            .O(N__11680),
            .I(N__11677));
    CascadeMux I__2679 (
            .O(N__11677),
            .I(N__11674));
    CascadeBuf I__2678 (
            .O(N__11674),
            .I(N__11671));
    CascadeMux I__2677 (
            .O(N__11671),
            .I(N__11668));
    CascadeBuf I__2676 (
            .O(N__11668),
            .I(N__11665));
    CascadeMux I__2675 (
            .O(N__11665),
            .I(N__11662));
    InMux I__2674 (
            .O(N__11662),
            .I(N__11659));
    LocalMux I__2673 (
            .O(N__11659),
            .I(N__11656));
    Span12Mux_s8_h I__2672 (
            .O(N__11656),
            .I(N__11653));
    Odrv12 I__2671 (
            .O(N__11653),
            .I(\inst_midgetv_core.Wai_9 ));
    InMux I__2670 (
            .O(N__11650),
            .I(N__11647));
    LocalMux I__2669 (
            .O(N__11647),
            .I(N__11644));
    Odrv4 I__2668 (
            .O(N__11644),
            .I(SEL_O_3));
    InMux I__2667 (
            .O(N__11641),
            .I(N__11638));
    LocalMux I__2666 (
            .O(N__11638),
            .I(N__11634));
    InMux I__2665 (
            .O(N__11637),
            .I(N__11631));
    Span4Mux_h I__2664 (
            .O(N__11634),
            .I(N__11628));
    LocalMux I__2663 (
            .O(N__11631),
            .I(N__11625));
    Span4Mux_v I__2662 (
            .O(N__11628),
            .I(N__11622));
    Span12Mux_h I__2661 (
            .O(N__11625),
            .I(N__11619));
    Span4Mux_v I__2660 (
            .O(N__11622),
            .I(N__11616));
    Odrv12 I__2659 (
            .O(N__11619),
            .I(DAT_O_31));
    Odrv4 I__2658 (
            .O(N__11616),
            .I(DAT_O_31));
    CascadeMux I__2657 (
            .O(N__11611),
            .I(N__11607));
    InMux I__2656 (
            .O(N__11610),
            .I(N__11603));
    InMux I__2655 (
            .O(N__11607),
            .I(N__11598));
    InMux I__2654 (
            .O(N__11606),
            .I(N__11598));
    LocalMux I__2653 (
            .O(N__11603),
            .I(bluesource_is_uart));
    LocalMux I__2652 (
            .O(N__11598),
            .I(bluesource_is_uart));
    CEMux I__2651 (
            .O(N__11593),
            .I(N__11590));
    LocalMux I__2650 (
            .O(N__11590),
            .I(N__11587));
    Sp12to4 I__2649 (
            .O(N__11587),
            .I(N__11584));
    Odrv12 I__2648 (
            .O(N__11584),
            .I(\i_LEDs.n2766 ));
    CEMux I__2647 (
            .O(N__11581),
            .I(N__11578));
    LocalMux I__2646 (
            .O(N__11578),
            .I(N__11575));
    IoSpan4Mux I__2645 (
            .O(N__11575),
            .I(N__11572));
    Span4Mux_s1_v I__2644 (
            .O(N__11572),
            .I(N__11569));
    Sp12to4 I__2643 (
            .O(N__11569),
            .I(N__11566));
    Span12Mux_s9_v I__2642 (
            .O(N__11566),
            .I(N__11563));
    Odrv12 I__2641 (
            .O(N__11563),
            .I(\i_BBUART.usartTX_N_2 ));
    InMux I__2640 (
            .O(N__11560),
            .I(N__11555));
    InMux I__2639 (
            .O(N__11559),
            .I(N__11550));
    InMux I__2638 (
            .O(N__11558),
            .I(N__11550));
    LocalMux I__2637 (
            .O(N__11555),
            .I(N__11547));
    LocalMux I__2636 (
            .O(N__11550),
            .I(N__11542));
    Span4Mux_h I__2635 (
            .O(N__11547),
            .I(N__11542));
    Span4Mux_v I__2634 (
            .O(N__11542),
            .I(N__11539));
    Odrv4 I__2633 (
            .O(N__11539),
            .I(WE_O));
    InMux I__2632 (
            .O(N__11536),
            .I(N__11529));
    InMux I__2631 (
            .O(N__11535),
            .I(N__11529));
    InMux I__2630 (
            .O(N__11534),
            .I(N__11525));
    LocalMux I__2629 (
            .O(N__11529),
            .I(N__11522));
    InMux I__2628 (
            .O(N__11528),
            .I(N__11519));
    LocalMux I__2627 (
            .O(N__11525),
            .I(N__11516));
    Span4Mux_v I__2626 (
            .O(N__11522),
            .I(N__11511));
    LocalMux I__2625 (
            .O(N__11519),
            .I(N__11511));
    Span4Mux_h I__2624 (
            .O(N__11516),
            .I(N__11503));
    Span4Mux_v I__2623 (
            .O(N__11511),
            .I(N__11503));
    InMux I__2622 (
            .O(N__11510),
            .I(N__11500));
    InMux I__2621 (
            .O(N__11509),
            .I(N__11495));
    InMux I__2620 (
            .O(N__11508),
            .I(N__11495));
    Odrv4 I__2619 (
            .O(N__11503),
            .I(ADR_O_2));
    LocalMux I__2618 (
            .O(N__11500),
            .I(ADR_O_2));
    LocalMux I__2617 (
            .O(N__11495),
            .I(ADR_O_2));
    CEMux I__2616 (
            .O(N__11488),
            .I(N__11485));
    LocalMux I__2615 (
            .O(N__11485),
            .I(N__11481));
    CEMux I__2614 (
            .O(N__11484),
            .I(N__11478));
    IoSpan4Mux I__2613 (
            .O(N__11481),
            .I(N__11475));
    LocalMux I__2612 (
            .O(N__11478),
            .I(N__11472));
    Span4Mux_s3_v I__2611 (
            .O(N__11475),
            .I(N__11465));
    Span4Mux_s3_v I__2610 (
            .O(N__11472),
            .I(N__11465));
    InMux I__2609 (
            .O(N__11471),
            .I(N__11460));
    InMux I__2608 (
            .O(N__11470),
            .I(N__11460));
    Span4Mux_v I__2607 (
            .O(N__11465),
            .I(N__11457));
    LocalMux I__2606 (
            .O(N__11460),
            .I(N__11454));
    Odrv4 I__2605 (
            .O(N__11457),
            .I(LED1_N_4));
    Odrv4 I__2604 (
            .O(N__11454),
            .I(LED1_N_4));
    InMux I__2603 (
            .O(N__11449),
            .I(N__11446));
    LocalMux I__2602 (
            .O(N__11446),
            .I(\inst_midgetv_core.inst_progressctrl.n4_adj_311 ));
    CascadeMux I__2601 (
            .O(N__11443),
            .I(N__11440));
    InMux I__2600 (
            .O(N__11440),
            .I(N__11437));
    LocalMux I__2599 (
            .O(N__11437),
            .I(n2345));
    InMux I__2598 (
            .O(N__11434),
            .I(N__11430));
    InMux I__2597 (
            .O(N__11433),
            .I(N__11427));
    LocalMux I__2596 (
            .O(N__11430),
            .I(N__11422));
    LocalMux I__2595 (
            .O(N__11427),
            .I(N__11419));
    InMux I__2594 (
            .O(N__11426),
            .I(N__11412));
    InMux I__2593 (
            .O(N__11425),
            .I(N__11412));
    Sp12to4 I__2592 (
            .O(N__11422),
            .I(N__11409));
    Span4Mux_h I__2591 (
            .O(N__11419),
            .I(N__11406));
    InMux I__2590 (
            .O(N__11418),
            .I(N__11403));
    InMux I__2589 (
            .O(N__11417),
            .I(N__11400));
    LocalMux I__2588 (
            .O(N__11412),
            .I(N__11395));
    Span12Mux_s9_v I__2587 (
            .O(N__11409),
            .I(N__11395));
    Span4Mux_h I__2586 (
            .O(N__11406),
            .I(N__11392));
    LocalMux I__2585 (
            .O(N__11403),
            .I(N__11389));
    LocalMux I__2584 (
            .O(N__11400),
            .I(\inst_midgetv_core.B_31 ));
    Odrv12 I__2583 (
            .O(N__11395),
            .I(\inst_midgetv_core.B_31 ));
    Odrv4 I__2582 (
            .O(N__11392),
            .I(\inst_midgetv_core.B_31 ));
    Odrv12 I__2581 (
            .O(N__11389),
            .I(\inst_midgetv_core.B_31 ));
    CascadeMux I__2580 (
            .O(N__11380),
            .I(N__11377));
    InMux I__2579 (
            .O(N__11377),
            .I(N__11374));
    LocalMux I__2578 (
            .O(N__11374),
            .I(N__11370));
    InMux I__2577 (
            .O(N__11373),
            .I(N__11367));
    Span4Mux_h I__2576 (
            .O(N__11370),
            .I(N__11362));
    LocalMux I__2575 (
            .O(N__11367),
            .I(N__11362));
    Span4Mux_v I__2574 (
            .O(N__11362),
            .I(N__11359));
    Span4Mux_v I__2573 (
            .O(N__11359),
            .I(N__11356));
    Odrv4 I__2572 (
            .O(N__11356),
            .I(\inst_midgetv_core.sa42 ));
    InMux I__2571 (
            .O(N__11353),
            .I(N__11349));
    InMux I__2570 (
            .O(N__11352),
            .I(N__11346));
    LocalMux I__2569 (
            .O(N__11349),
            .I(N__11342));
    LocalMux I__2568 (
            .O(N__11346),
            .I(N__11339));
    InMux I__2567 (
            .O(N__11345),
            .I(N__11336));
    Span4Mux_h I__2566 (
            .O(N__11342),
            .I(N__11329));
    Span4Mux_h I__2565 (
            .O(N__11339),
            .I(N__11329));
    LocalMux I__2564 (
            .O(N__11336),
            .I(N__11329));
    Span4Mux_v I__2563 (
            .O(N__11329),
            .I(N__11326));
    Odrv4 I__2562 (
            .O(N__11326),
            .I(\inst_midgetv_core.inst_progressctrl.badalignment ));
    CascadeMux I__2561 (
            .O(N__11323),
            .I(N__11316));
    InMux I__2560 (
            .O(N__11322),
            .I(N__11312));
    InMux I__2559 (
            .O(N__11321),
            .I(N__11309));
    InMux I__2558 (
            .O(N__11320),
            .I(N__11304));
    InMux I__2557 (
            .O(N__11319),
            .I(N__11304));
    InMux I__2556 (
            .O(N__11316),
            .I(N__11301));
    CascadeMux I__2555 (
            .O(N__11315),
            .I(N__11297));
    LocalMux I__2554 (
            .O(N__11312),
            .I(N__11294));
    LocalMux I__2553 (
            .O(N__11309),
            .I(N__11291));
    LocalMux I__2552 (
            .O(N__11304),
            .I(N__11288));
    LocalMux I__2551 (
            .O(N__11301),
            .I(N__11285));
    InMux I__2550 (
            .O(N__11300),
            .I(N__11280));
    InMux I__2549 (
            .O(N__11297),
            .I(N__11280));
    Odrv4 I__2548 (
            .O(N__11294),
            .I(\inst_midgetv_core.INSTR_6 ));
    Odrv4 I__2547 (
            .O(N__11291),
            .I(\inst_midgetv_core.INSTR_6 ));
    Odrv4 I__2546 (
            .O(N__11288),
            .I(\inst_midgetv_core.INSTR_6 ));
    Odrv4 I__2545 (
            .O(N__11285),
            .I(\inst_midgetv_core.INSTR_6 ));
    LocalMux I__2544 (
            .O(N__11280),
            .I(\inst_midgetv_core.INSTR_6 ));
    InMux I__2543 (
            .O(N__11269),
            .I(N__11263));
    InMux I__2542 (
            .O(N__11268),
            .I(N__11260));
    InMux I__2541 (
            .O(N__11267),
            .I(N__11257));
    CascadeMux I__2540 (
            .O(N__11266),
            .I(N__11253));
    LocalMux I__2539 (
            .O(N__11263),
            .I(N__11249));
    LocalMux I__2538 (
            .O(N__11260),
            .I(N__11246));
    LocalMux I__2537 (
            .O(N__11257),
            .I(N__11238));
    InMux I__2536 (
            .O(N__11256),
            .I(N__11231));
    InMux I__2535 (
            .O(N__11253),
            .I(N__11231));
    InMux I__2534 (
            .O(N__11252),
            .I(N__11231));
    Span4Mux_v I__2533 (
            .O(N__11249),
            .I(N__11226));
    Span4Mux_v I__2532 (
            .O(N__11246),
            .I(N__11226));
    InMux I__2531 (
            .O(N__11245),
            .I(N__11219));
    InMux I__2530 (
            .O(N__11244),
            .I(N__11219));
    InMux I__2529 (
            .O(N__11243),
            .I(N__11219));
    InMux I__2528 (
            .O(N__11242),
            .I(N__11214));
    InMux I__2527 (
            .O(N__11241),
            .I(N__11214));
    Odrv4 I__2526 (
            .O(N__11238),
            .I(\inst_midgetv_core.INSTR_2 ));
    LocalMux I__2525 (
            .O(N__11231),
            .I(\inst_midgetv_core.INSTR_2 ));
    Odrv4 I__2524 (
            .O(N__11226),
            .I(\inst_midgetv_core.INSTR_2 ));
    LocalMux I__2523 (
            .O(N__11219),
            .I(\inst_midgetv_core.INSTR_2 ));
    LocalMux I__2522 (
            .O(N__11214),
            .I(\inst_midgetv_core.INSTR_2 ));
    CascadeMux I__2521 (
            .O(N__11203),
            .I(N__11199));
    InMux I__2520 (
            .O(N__11202),
            .I(N__11194));
    InMux I__2519 (
            .O(N__11199),
            .I(N__11191));
    CascadeMux I__2518 (
            .O(N__11198),
            .I(N__11184));
    CascadeMux I__2517 (
            .O(N__11197),
            .I(N__11180));
    LocalMux I__2516 (
            .O(N__11194),
            .I(N__11176));
    LocalMux I__2515 (
            .O(N__11191),
            .I(N__11173));
    InMux I__2514 (
            .O(N__11190),
            .I(N__11170));
    InMux I__2513 (
            .O(N__11189),
            .I(N__11147));
    InMux I__2512 (
            .O(N__11188),
            .I(N__11147));
    InMux I__2511 (
            .O(N__11187),
            .I(N__11147));
    InMux I__2510 (
            .O(N__11184),
            .I(N__11147));
    InMux I__2509 (
            .O(N__11183),
            .I(N__11147));
    InMux I__2508 (
            .O(N__11180),
            .I(N__11147));
    InMux I__2507 (
            .O(N__11179),
            .I(N__11147));
    Span4Mux_v I__2506 (
            .O(N__11176),
            .I(N__11144));
    Span4Mux_h I__2505 (
            .O(N__11173),
            .I(N__11139));
    LocalMux I__2504 (
            .O(N__11170),
            .I(N__11139));
    InMux I__2503 (
            .O(N__11169),
            .I(N__11128));
    InMux I__2502 (
            .O(N__11168),
            .I(N__11128));
    InMux I__2501 (
            .O(N__11167),
            .I(N__11128));
    InMux I__2500 (
            .O(N__11166),
            .I(N__11128));
    InMux I__2499 (
            .O(N__11165),
            .I(N__11128));
    InMux I__2498 (
            .O(N__11164),
            .I(N__11121));
    InMux I__2497 (
            .O(N__11163),
            .I(N__11121));
    InMux I__2496 (
            .O(N__11162),
            .I(N__11121));
    LocalMux I__2495 (
            .O(N__11147),
            .I(\inst_midgetv_core.s_cyclecnt_0 ));
    Odrv4 I__2494 (
            .O(N__11144),
            .I(\inst_midgetv_core.s_cyclecnt_0 ));
    Odrv4 I__2493 (
            .O(N__11139),
            .I(\inst_midgetv_core.s_cyclecnt_0 ));
    LocalMux I__2492 (
            .O(N__11128),
            .I(\inst_midgetv_core.s_cyclecnt_0 ));
    LocalMux I__2491 (
            .O(N__11121),
            .I(\inst_midgetv_core.s_cyclecnt_0 ));
    InMux I__2490 (
            .O(N__11110),
            .I(N__11098));
    InMux I__2489 (
            .O(N__11109),
            .I(N__11098));
    InMux I__2488 (
            .O(N__11108),
            .I(N__11098));
    InMux I__2487 (
            .O(N__11107),
            .I(N__11095));
    InMux I__2486 (
            .O(N__11106),
            .I(N__11092));
    InMux I__2485 (
            .O(N__11105),
            .I(N__11089));
    LocalMux I__2484 (
            .O(N__11098),
            .I(N__11086));
    LocalMux I__2483 (
            .O(N__11095),
            .I(N__11078));
    LocalMux I__2482 (
            .O(N__11092),
            .I(N__11075));
    LocalMux I__2481 (
            .O(N__11089),
            .I(N__11072));
    Span4Mux_h I__2480 (
            .O(N__11086),
            .I(N__11069));
    InMux I__2479 (
            .O(N__11085),
            .I(N__11066));
    InMux I__2478 (
            .O(N__11084),
            .I(N__11059));
    InMux I__2477 (
            .O(N__11083),
            .I(N__11059));
    InMux I__2476 (
            .O(N__11082),
            .I(N__11059));
    InMux I__2475 (
            .O(N__11081),
            .I(N__11056));
    Odrv4 I__2474 (
            .O(N__11078),
            .I(\inst_midgetv_core.INSTR_4 ));
    Odrv4 I__2473 (
            .O(N__11075),
            .I(\inst_midgetv_core.INSTR_4 ));
    Odrv4 I__2472 (
            .O(N__11072),
            .I(\inst_midgetv_core.INSTR_4 ));
    Odrv4 I__2471 (
            .O(N__11069),
            .I(\inst_midgetv_core.INSTR_4 ));
    LocalMux I__2470 (
            .O(N__11066),
            .I(\inst_midgetv_core.INSTR_4 ));
    LocalMux I__2469 (
            .O(N__11059),
            .I(\inst_midgetv_core.INSTR_4 ));
    LocalMux I__2468 (
            .O(N__11056),
            .I(\inst_midgetv_core.INSTR_4 ));
    CascadeMux I__2467 (
            .O(N__11041),
            .I(N__11038));
    InMux I__2466 (
            .O(N__11038),
            .I(N__11034));
    InMux I__2465 (
            .O(N__11037),
            .I(N__11030));
    LocalMux I__2464 (
            .O(N__11034),
            .I(N__11027));
    InMux I__2463 (
            .O(N__11033),
            .I(N__11024));
    LocalMux I__2462 (
            .O(N__11030),
            .I(N__11021));
    Span4Mux_h I__2461 (
            .O(N__11027),
            .I(N__11016));
    LocalMux I__2460 (
            .O(N__11024),
            .I(N__11016));
    Odrv4 I__2459 (
            .O(N__11021),
            .I(\inst_midgetv_core.INSTR_8 ));
    Odrv4 I__2458 (
            .O(N__11016),
            .I(\inst_midgetv_core.INSTR_8 ));
    InMux I__2457 (
            .O(N__11011),
            .I(N__11008));
    LocalMux I__2456 (
            .O(N__11008),
            .I(N__11005));
    Span4Mux_h I__2455 (
            .O(N__11005),
            .I(N__11002));
    Odrv4 I__2454 (
            .O(N__11002),
            .I(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_imm1a ));
    InMux I__2453 (
            .O(N__10999),
            .I(N__10987));
    InMux I__2452 (
            .O(N__10998),
            .I(N__10987));
    InMux I__2451 (
            .O(N__10997),
            .I(N__10987));
    InMux I__2450 (
            .O(N__10996),
            .I(N__10987));
    LocalMux I__2449 (
            .O(N__10987),
            .I(N__10977));
    CascadeMux I__2448 (
            .O(N__10986),
            .I(N__10974));
    CascadeMux I__2447 (
            .O(N__10985),
            .I(N__10971));
    CascadeMux I__2446 (
            .O(N__10984),
            .I(N__10968));
    CascadeMux I__2445 (
            .O(N__10983),
            .I(N__10965));
    CascadeMux I__2444 (
            .O(N__10982),
            .I(N__10961));
    CascadeMux I__2443 (
            .O(N__10981),
            .I(N__10957));
    InMux I__2442 (
            .O(N__10980),
            .I(N__10950));
    Span4Mux_v I__2441 (
            .O(N__10977),
            .I(N__10947));
    InMux I__2440 (
            .O(N__10974),
            .I(N__10944));
    InMux I__2439 (
            .O(N__10971),
            .I(N__10939));
    InMux I__2438 (
            .O(N__10968),
            .I(N__10939));
    InMux I__2437 (
            .O(N__10965),
            .I(N__10932));
    InMux I__2436 (
            .O(N__10964),
            .I(N__10932));
    InMux I__2435 (
            .O(N__10961),
            .I(N__10932));
    InMux I__2434 (
            .O(N__10960),
            .I(N__10919));
    InMux I__2433 (
            .O(N__10957),
            .I(N__10919));
    InMux I__2432 (
            .O(N__10956),
            .I(N__10919));
    InMux I__2431 (
            .O(N__10955),
            .I(N__10919));
    InMux I__2430 (
            .O(N__10954),
            .I(N__10919));
    InMux I__2429 (
            .O(N__10953),
            .I(N__10919));
    LocalMux I__2428 (
            .O(N__10950),
            .I(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_sa09 ));
    Odrv4 I__2427 (
            .O(N__10947),
            .I(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_sa09 ));
    LocalMux I__2426 (
            .O(N__10944),
            .I(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_sa09 ));
    LocalMux I__2425 (
            .O(N__10939),
            .I(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_sa09 ));
    LocalMux I__2424 (
            .O(N__10932),
            .I(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_sa09 ));
    LocalMux I__2423 (
            .O(N__10919),
            .I(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_sa09 ));
    InMux I__2422 (
            .O(N__10906),
            .I(N__10890));
    InMux I__2421 (
            .O(N__10905),
            .I(N__10890));
    InMux I__2420 (
            .O(N__10904),
            .I(N__10890));
    InMux I__2419 (
            .O(N__10903),
            .I(N__10890));
    CascadeMux I__2418 (
            .O(N__10902),
            .I(N__10881));
    CascadeMux I__2417 (
            .O(N__10901),
            .I(N__10877));
    InMux I__2416 (
            .O(N__10900),
            .I(N__10874));
    InMux I__2415 (
            .O(N__10899),
            .I(N__10871));
    LocalMux I__2414 (
            .O(N__10890),
            .I(N__10868));
    InMux I__2413 (
            .O(N__10889),
            .I(N__10857));
    InMux I__2412 (
            .O(N__10888),
            .I(N__10857));
    InMux I__2411 (
            .O(N__10887),
            .I(N__10857));
    InMux I__2410 (
            .O(N__10886),
            .I(N__10857));
    InMux I__2409 (
            .O(N__10885),
            .I(N__10857));
    InMux I__2408 (
            .O(N__10884),
            .I(N__10848));
    InMux I__2407 (
            .O(N__10881),
            .I(N__10848));
    InMux I__2406 (
            .O(N__10880),
            .I(N__10848));
    InMux I__2405 (
            .O(N__10877),
            .I(N__10848));
    LocalMux I__2404 (
            .O(N__10874),
            .I(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_sa07 ));
    LocalMux I__2403 (
            .O(N__10871),
            .I(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_sa07 ));
    Odrv12 I__2402 (
            .O(N__10868),
            .I(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_sa07 ));
    LocalMux I__2401 (
            .O(N__10857),
            .I(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_sa07 ));
    LocalMux I__2400 (
            .O(N__10848),
            .I(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_sa07 ));
    CascadeMux I__2399 (
            .O(N__10837),
            .I(N__10833));
    CascadeMux I__2398 (
            .O(N__10836),
            .I(N__10824));
    InMux I__2397 (
            .O(N__10833),
            .I(N__10819));
    CascadeMux I__2396 (
            .O(N__10832),
            .I(N__10816));
    CascadeMux I__2395 (
            .O(N__10831),
            .I(N__10812));
    CascadeMux I__2394 (
            .O(N__10830),
            .I(N__10809));
    InMux I__2393 (
            .O(N__10829),
            .I(N__10796));
    InMux I__2392 (
            .O(N__10828),
            .I(N__10796));
    InMux I__2391 (
            .O(N__10827),
            .I(N__10796));
    InMux I__2390 (
            .O(N__10824),
            .I(N__10796));
    InMux I__2389 (
            .O(N__10823),
            .I(N__10796));
    InMux I__2388 (
            .O(N__10822),
            .I(N__10796));
    LocalMux I__2387 (
            .O(N__10819),
            .I(N__10793));
    InMux I__2386 (
            .O(N__10816),
            .I(N__10790));
    InMux I__2385 (
            .O(N__10815),
            .I(N__10783));
    InMux I__2384 (
            .O(N__10812),
            .I(N__10783));
    InMux I__2383 (
            .O(N__10809),
            .I(N__10783));
    LocalMux I__2382 (
            .O(N__10796),
            .I(N__10780));
    Span4Mux_h I__2381 (
            .O(N__10793),
            .I(N__10775));
    LocalMux I__2380 (
            .O(N__10790),
            .I(N__10775));
    LocalMux I__2379 (
            .O(N__10783),
            .I(N__10770));
    Span4Mux_h I__2378 (
            .O(N__10780),
            .I(N__10770));
    Span4Mux_h I__2377 (
            .O(N__10775),
            .I(N__10767));
    Odrv4 I__2376 (
            .O(N__10770),
            .I(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_sa08 ));
    Odrv4 I__2375 (
            .O(N__10767),
            .I(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_sa08 ));
    CascadeMux I__2374 (
            .O(N__10762),
            .I(N__10759));
    InMux I__2373 (
            .O(N__10759),
            .I(N__10755));
    InMux I__2372 (
            .O(N__10758),
            .I(N__10752));
    LocalMux I__2371 (
            .O(N__10755),
            .I(N__10749));
    LocalMux I__2370 (
            .O(N__10752),
            .I(N__10746));
    Span4Mux_v I__2369 (
            .O(N__10749),
            .I(N__10743));
    Span4Mux_v I__2368 (
            .O(N__10746),
            .I(N__10737));
    Span4Mux_h I__2367 (
            .O(N__10743),
            .I(N__10737));
    InMux I__2366 (
            .O(N__10742),
            .I(N__10734));
    Odrv4 I__2365 (
            .O(N__10737),
            .I(\inst_midgetv_core.INSTR_10 ));
    LocalMux I__2364 (
            .O(N__10734),
            .I(\inst_midgetv_core.INSTR_10 ));
    InMux I__2363 (
            .O(N__10729),
            .I(N__10726));
    LocalMux I__2362 (
            .O(N__10726),
            .I(N__10723));
    Span4Mux_v I__2361 (
            .O(N__10723),
            .I(N__10720));
    Odrv4 I__2360 (
            .O(N__10720),
            .I(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_imm3a ));
    InMux I__2359 (
            .O(N__10717),
            .I(N__10714));
    LocalMux I__2358 (
            .O(N__10714),
            .I(\inst_midgetv_core.bmask_0 ));
    CascadeMux I__2357 (
            .O(N__10711),
            .I(N__10708));
    InMux I__2356 (
            .O(N__10708),
            .I(N__10705));
    LocalMux I__2355 (
            .O(N__10705),
            .I(N__10701));
    InMux I__2354 (
            .O(N__10704),
            .I(N__10698));
    Span4Mux_h I__2353 (
            .O(N__10701),
            .I(N__10695));
    LocalMux I__2352 (
            .O(N__10698),
            .I(N__10692));
    Odrv4 I__2351 (
            .O(N__10695),
            .I(\inst_midgetv_core.rlastshift ));
    Odrv12 I__2350 (
            .O(N__10692),
            .I(\inst_midgetv_core.rlastshift ));
    CascadeMux I__2349 (
            .O(N__10687),
            .I(N__10683));
    InMux I__2348 (
            .O(N__10686),
            .I(N__10680));
    InMux I__2347 (
            .O(N__10683),
            .I(N__10677));
    LocalMux I__2346 (
            .O(N__10680),
            .I(N__10672));
    LocalMux I__2345 (
            .O(N__10677),
            .I(N__10672));
    Span4Mux_v I__2344 (
            .O(N__10672),
            .I(N__10669));
    Odrv4 I__2343 (
            .O(N__10669),
            .I(\inst_midgetv_core.sa41 ));
    InMux I__2342 (
            .O(N__10666),
            .I(N__10663));
    LocalMux I__2341 (
            .O(N__10663),
            .I(N__10657));
    InMux I__2340 (
            .O(N__10662),
            .I(N__10654));
    InMux I__2339 (
            .O(N__10661),
            .I(N__10651));
    CascadeMux I__2338 (
            .O(N__10660),
            .I(N__10647));
    Span4Mux_v I__2337 (
            .O(N__10657),
            .I(N__10642));
    LocalMux I__2336 (
            .O(N__10654),
            .I(N__10637));
    LocalMux I__2335 (
            .O(N__10651),
            .I(N__10637));
    InMux I__2334 (
            .O(N__10650),
            .I(N__10634));
    InMux I__2333 (
            .O(N__10647),
            .I(N__10631));
    InMux I__2332 (
            .O(N__10646),
            .I(N__10626));
    InMux I__2331 (
            .O(N__10645),
            .I(N__10626));
    Span4Mux_h I__2330 (
            .O(N__10642),
            .I(N__10618));
    Span4Mux_v I__2329 (
            .O(N__10637),
            .I(N__10618));
    LocalMux I__2328 (
            .O(N__10634),
            .I(N__10618));
    LocalMux I__2327 (
            .O(N__10631),
            .I(N__10613));
    LocalMux I__2326 (
            .O(N__10626),
            .I(N__10613));
    InMux I__2325 (
            .O(N__10625),
            .I(N__10610));
    Span4Mux_h I__2324 (
            .O(N__10618),
            .I(N__10607));
    Span4Mux_v I__2323 (
            .O(N__10613),
            .I(N__10604));
    LocalMux I__2322 (
            .O(N__10610),
            .I(corerunning));
    Odrv4 I__2321 (
            .O(N__10607),
            .I(corerunning));
    Odrv4 I__2320 (
            .O(N__10604),
            .I(corerunning));
    CascadeMux I__2319 (
            .O(N__10597),
            .I(\inst_midgetv_core.inst_progressctrl.blka_cmb_bsel_3_cascade_ ));
    InMux I__2318 (
            .O(N__10594),
            .I(N__10590));
    CascadeMux I__2317 (
            .O(N__10593),
            .I(N__10587));
    LocalMux I__2316 (
            .O(N__10590),
            .I(N__10584));
    InMux I__2315 (
            .O(N__10587),
            .I(N__10581));
    Span4Mux_v I__2314 (
            .O(N__10584),
            .I(N__10576));
    LocalMux I__2313 (
            .O(N__10581),
            .I(N__10576));
    Span4Mux_h I__2312 (
            .O(N__10576),
            .I(N__10573));
    Span4Mux_v I__2311 (
            .O(N__10573),
            .I(N__10570));
    Span4Mux_v I__2310 (
            .O(N__10570),
            .I(N__10567));
    Sp12to4 I__2309 (
            .O(N__10567),
            .I(N__10564));
    Odrv12 I__2308 (
            .O(N__10564),
            .I(meta_usartRX));
    InMux I__2307 (
            .O(N__10561),
            .I(N__10558));
    LocalMux I__2306 (
            .O(N__10558),
            .I(N__10554));
    InMux I__2305 (
            .O(N__10557),
            .I(N__10551));
    Span4Mux_h I__2304 (
            .O(N__10554),
            .I(N__10548));
    LocalMux I__2303 (
            .O(N__10551),
            .I(N__10545));
    Odrv4 I__2302 (
            .O(N__10548),
            .I(DAT_O_2));
    Odrv12 I__2301 (
            .O(N__10545),
            .I(DAT_O_2));
    IoInMux I__2300 (
            .O(N__10540),
            .I(N__10537));
    LocalMux I__2299 (
            .O(N__10537),
            .I(N__10534));
    Span4Mux_s0_v I__2298 (
            .O(N__10534),
            .I(N__10531));
    Span4Mux_v I__2297 (
            .O(N__10531),
            .I(N__10528));
    Span4Mux_v I__2296 (
            .O(N__10528),
            .I(N__10525));
    Span4Mux_v I__2295 (
            .O(N__10525),
            .I(N__10522));
    Odrv4 I__2294 (
            .O(N__10522),
            .I(LED3_c));
    CascadeMux I__2293 (
            .O(N__10519),
            .I(N__10516));
    CascadeBuf I__2292 (
            .O(N__10516),
            .I(N__10513));
    CascadeMux I__2291 (
            .O(N__10513),
            .I(N__10510));
    CascadeBuf I__2290 (
            .O(N__10510),
            .I(N__10507));
    CascadeMux I__2289 (
            .O(N__10507),
            .I(N__10504));
    CascadeBuf I__2288 (
            .O(N__10504),
            .I(N__10501));
    CascadeMux I__2287 (
            .O(N__10501),
            .I(N__10498));
    CascadeBuf I__2286 (
            .O(N__10498),
            .I(N__10495));
    CascadeMux I__2285 (
            .O(N__10495),
            .I(N__10492));
    CascadeBuf I__2284 (
            .O(N__10492),
            .I(N__10489));
    CascadeMux I__2283 (
            .O(N__10489),
            .I(N__10486));
    CascadeBuf I__2282 (
            .O(N__10486),
            .I(N__10483));
    CascadeMux I__2281 (
            .O(N__10483),
            .I(N__10480));
    CascadeBuf I__2280 (
            .O(N__10480),
            .I(N__10477));
    CascadeMux I__2279 (
            .O(N__10477),
            .I(N__10474));
    InMux I__2278 (
            .O(N__10474),
            .I(N__10471));
    LocalMux I__2277 (
            .O(N__10471),
            .I(N__10468));
    Span4Mux_s3_v I__2276 (
            .O(N__10468),
            .I(N__10465));
    Span4Mux_v I__2275 (
            .O(N__10465),
            .I(N__10462));
    Span4Mux_v I__2274 (
            .O(N__10462),
            .I(N__10459));
    Span4Mux_v I__2273 (
            .O(N__10459),
            .I(N__10456));
    Odrv4 I__2272 (
            .O(N__10456),
            .I(\inst_midgetv_core.Wai_1 ));
    InMux I__2271 (
            .O(N__10453),
            .I(N__10450));
    LocalMux I__2270 (
            .O(N__10450),
            .I(N__10444));
    InMux I__2269 (
            .O(N__10449),
            .I(N__10441));
    InMux I__2268 (
            .O(N__10448),
            .I(N__10438));
    InMux I__2267 (
            .O(N__10447),
            .I(N__10435));
    Odrv4 I__2266 (
            .O(N__10444),
            .I(\inst_midgetv_core.ADR_O_4 ));
    LocalMux I__2265 (
            .O(N__10441),
            .I(\inst_midgetv_core.ADR_O_4 ));
    LocalMux I__2264 (
            .O(N__10438),
            .I(\inst_midgetv_core.ADR_O_4 ));
    LocalMux I__2263 (
            .O(N__10435),
            .I(\inst_midgetv_core.ADR_O_4 ));
    CascadeMux I__2262 (
            .O(N__10426),
            .I(N__10423));
    CascadeBuf I__2261 (
            .O(N__10423),
            .I(N__10420));
    CascadeMux I__2260 (
            .O(N__10420),
            .I(N__10417));
    CascadeBuf I__2259 (
            .O(N__10417),
            .I(N__10414));
    CascadeMux I__2258 (
            .O(N__10414),
            .I(N__10411));
    CascadeBuf I__2257 (
            .O(N__10411),
            .I(N__10408));
    CascadeMux I__2256 (
            .O(N__10408),
            .I(N__10405));
    CascadeBuf I__2255 (
            .O(N__10405),
            .I(N__10402));
    CascadeMux I__2254 (
            .O(N__10402),
            .I(N__10399));
    CascadeBuf I__2253 (
            .O(N__10399),
            .I(N__10396));
    CascadeMux I__2252 (
            .O(N__10396),
            .I(N__10393));
    CascadeBuf I__2251 (
            .O(N__10393),
            .I(N__10390));
    CascadeMux I__2250 (
            .O(N__10390),
            .I(N__10387));
    CascadeBuf I__2249 (
            .O(N__10387),
            .I(N__10384));
    CascadeMux I__2248 (
            .O(N__10384),
            .I(N__10381));
    InMux I__2247 (
            .O(N__10381),
            .I(N__10378));
    LocalMux I__2246 (
            .O(N__10378),
            .I(N__10375));
    Span4Mux_h I__2245 (
            .O(N__10375),
            .I(N__10372));
    Span4Mux_v I__2244 (
            .O(N__10372),
            .I(N__10369));
    Span4Mux_v I__2243 (
            .O(N__10369),
            .I(N__10366));
    Span4Mux_v I__2242 (
            .O(N__10366),
            .I(N__10363));
    Odrv4 I__2241 (
            .O(N__10363),
            .I(\inst_midgetv_core.Wai_2 ));
    InMux I__2240 (
            .O(N__10360),
            .I(N__10357));
    LocalMux I__2239 (
            .O(N__10357),
            .I(N__10351));
    InMux I__2238 (
            .O(N__10356),
            .I(N__10348));
    InMux I__2237 (
            .O(N__10355),
            .I(N__10345));
    InMux I__2236 (
            .O(N__10354),
            .I(N__10342));
    Odrv4 I__2235 (
            .O(N__10351),
            .I(\inst_midgetv_core.ADR_O_5 ));
    LocalMux I__2234 (
            .O(N__10348),
            .I(\inst_midgetv_core.ADR_O_5 ));
    LocalMux I__2233 (
            .O(N__10345),
            .I(\inst_midgetv_core.ADR_O_5 ));
    LocalMux I__2232 (
            .O(N__10342),
            .I(\inst_midgetv_core.ADR_O_5 ));
    CascadeMux I__2231 (
            .O(N__10333),
            .I(N__10330));
    CascadeBuf I__2230 (
            .O(N__10330),
            .I(N__10327));
    CascadeMux I__2229 (
            .O(N__10327),
            .I(N__10324));
    CascadeBuf I__2228 (
            .O(N__10324),
            .I(N__10321));
    CascadeMux I__2227 (
            .O(N__10321),
            .I(N__10318));
    CascadeBuf I__2226 (
            .O(N__10318),
            .I(N__10315));
    CascadeMux I__2225 (
            .O(N__10315),
            .I(N__10312));
    CascadeBuf I__2224 (
            .O(N__10312),
            .I(N__10309));
    CascadeMux I__2223 (
            .O(N__10309),
            .I(N__10306));
    CascadeBuf I__2222 (
            .O(N__10306),
            .I(N__10303));
    CascadeMux I__2221 (
            .O(N__10303),
            .I(N__10300));
    CascadeBuf I__2220 (
            .O(N__10300),
            .I(N__10297));
    CascadeMux I__2219 (
            .O(N__10297),
            .I(N__10294));
    CascadeBuf I__2218 (
            .O(N__10294),
            .I(N__10291));
    CascadeMux I__2217 (
            .O(N__10291),
            .I(N__10288));
    InMux I__2216 (
            .O(N__10288),
            .I(N__10285));
    LocalMux I__2215 (
            .O(N__10285),
            .I(N__10282));
    Span4Mux_v I__2214 (
            .O(N__10282),
            .I(N__10279));
    Sp12to4 I__2213 (
            .O(N__10279),
            .I(N__10276));
    Span12Mux_s8_h I__2212 (
            .O(N__10276),
            .I(N__10273));
    Odrv12 I__2211 (
            .O(N__10273),
            .I(\inst_midgetv_core.Wai_3 ));
    InMux I__2210 (
            .O(N__10270),
            .I(N__10266));
    InMux I__2209 (
            .O(N__10269),
            .I(N__10263));
    LocalMux I__2208 (
            .O(N__10266),
            .I(N__10259));
    LocalMux I__2207 (
            .O(N__10263),
            .I(N__10256));
    CascadeMux I__2206 (
            .O(N__10262),
            .I(N__10253));
    Span4Mux_v I__2205 (
            .O(N__10259),
            .I(N__10248));
    Span4Mux_v I__2204 (
            .O(N__10256),
            .I(N__10248));
    InMux I__2203 (
            .O(N__10253),
            .I(N__10245));
    Odrv4 I__2202 (
            .O(N__10248),
            .I(\inst_midgetv_core.INSTR_11 ));
    LocalMux I__2201 (
            .O(N__10245),
            .I(\inst_midgetv_core.INSTR_11 ));
    InMux I__2200 (
            .O(N__10240),
            .I(N__10237));
    LocalMux I__2199 (
            .O(N__10237),
            .I(N__10234));
    Span4Mux_v I__2198 (
            .O(N__10234),
            .I(N__10231));
    Span4Mux_h I__2197 (
            .O(N__10231),
            .I(N__10225));
    InMux I__2196 (
            .O(N__10230),
            .I(N__10222));
    InMux I__2195 (
            .O(N__10229),
            .I(N__10217));
    InMux I__2194 (
            .O(N__10228),
            .I(N__10217));
    Odrv4 I__2193 (
            .O(N__10225),
            .I(\inst_midgetv_core.ADR_O_6 ));
    LocalMux I__2192 (
            .O(N__10222),
            .I(\inst_midgetv_core.ADR_O_6 ));
    LocalMux I__2191 (
            .O(N__10217),
            .I(\inst_midgetv_core.ADR_O_6 ));
    CascadeMux I__2190 (
            .O(N__10210),
            .I(N__10207));
    CascadeBuf I__2189 (
            .O(N__10207),
            .I(N__10204));
    CascadeMux I__2188 (
            .O(N__10204),
            .I(N__10201));
    CascadeBuf I__2187 (
            .O(N__10201),
            .I(N__10198));
    CascadeMux I__2186 (
            .O(N__10198),
            .I(N__10195));
    CascadeBuf I__2185 (
            .O(N__10195),
            .I(N__10192));
    CascadeMux I__2184 (
            .O(N__10192),
            .I(N__10189));
    CascadeBuf I__2183 (
            .O(N__10189),
            .I(N__10186));
    CascadeMux I__2182 (
            .O(N__10186),
            .I(N__10183));
    CascadeBuf I__2181 (
            .O(N__10183),
            .I(N__10180));
    CascadeMux I__2180 (
            .O(N__10180),
            .I(N__10177));
    CascadeBuf I__2179 (
            .O(N__10177),
            .I(N__10174));
    CascadeMux I__2178 (
            .O(N__10174),
            .I(N__10171));
    CascadeBuf I__2177 (
            .O(N__10171),
            .I(N__10168));
    CascadeMux I__2176 (
            .O(N__10168),
            .I(N__10165));
    InMux I__2175 (
            .O(N__10165),
            .I(N__10162));
    LocalMux I__2174 (
            .O(N__10162),
            .I(N__10159));
    Span4Mux_s3_v I__2173 (
            .O(N__10159),
            .I(N__10156));
    Sp12to4 I__2172 (
            .O(N__10156),
            .I(N__10153));
    Span12Mux_s8_h I__2171 (
            .O(N__10153),
            .I(N__10150));
    Span12Mux_v I__2170 (
            .O(N__10150),
            .I(N__10147));
    Odrv12 I__2169 (
            .O(N__10147),
            .I(\inst_midgetv_core.Wai_4 ));
    InMux I__2168 (
            .O(N__10144),
            .I(N__10139));
    InMux I__2167 (
            .O(N__10143),
            .I(N__10136));
    InMux I__2166 (
            .O(N__10142),
            .I(N__10133));
    LocalMux I__2165 (
            .O(N__10139),
            .I(N__10129));
    LocalMux I__2164 (
            .O(N__10136),
            .I(N__10126));
    LocalMux I__2163 (
            .O(N__10133),
            .I(N__10123));
    InMux I__2162 (
            .O(N__10132),
            .I(N__10120));
    Odrv12 I__2161 (
            .O(N__10129),
            .I(\inst_midgetv_core.ADR_O_7 ));
    Odrv4 I__2160 (
            .O(N__10126),
            .I(\inst_midgetv_core.ADR_O_7 ));
    Odrv4 I__2159 (
            .O(N__10123),
            .I(\inst_midgetv_core.ADR_O_7 ));
    LocalMux I__2158 (
            .O(N__10120),
            .I(\inst_midgetv_core.ADR_O_7 ));
    InMux I__2157 (
            .O(N__10111),
            .I(\inst_midgetv_core.inst_wai.genblk1_waicy4 ));
    CascadeMux I__2156 (
            .O(N__10108),
            .I(N__10105));
    CascadeBuf I__2155 (
            .O(N__10105),
            .I(N__10102));
    CascadeMux I__2154 (
            .O(N__10102),
            .I(N__10099));
    CascadeBuf I__2153 (
            .O(N__10099),
            .I(N__10096));
    CascadeMux I__2152 (
            .O(N__10096),
            .I(N__10093));
    CascadeBuf I__2151 (
            .O(N__10093),
            .I(N__10090));
    CascadeMux I__2150 (
            .O(N__10090),
            .I(N__10087));
    CascadeBuf I__2149 (
            .O(N__10087),
            .I(N__10084));
    CascadeMux I__2148 (
            .O(N__10084),
            .I(N__10081));
    CascadeBuf I__2147 (
            .O(N__10081),
            .I(N__10078));
    CascadeMux I__2146 (
            .O(N__10078),
            .I(N__10075));
    CascadeBuf I__2145 (
            .O(N__10075),
            .I(N__10072));
    CascadeMux I__2144 (
            .O(N__10072),
            .I(N__10069));
    CascadeBuf I__2143 (
            .O(N__10069),
            .I(N__10066));
    CascadeMux I__2142 (
            .O(N__10066),
            .I(N__10063));
    InMux I__2141 (
            .O(N__10063),
            .I(N__10060));
    LocalMux I__2140 (
            .O(N__10060),
            .I(N__10057));
    Span4Mux_s2_v I__2139 (
            .O(N__10057),
            .I(N__10054));
    Sp12to4 I__2138 (
            .O(N__10054),
            .I(N__10051));
    Span12Mux_v I__2137 (
            .O(N__10051),
            .I(N__10048));
    Odrv12 I__2136 (
            .O(N__10048),
            .I(\inst_midgetv_core.Wai_5 ));
    InMux I__2135 (
            .O(N__10045),
            .I(N__10042));
    LocalMux I__2134 (
            .O(N__10042),
            .I(\inst_midgetv_core.inst_wai.genblk1_preWai0 ));
    InMux I__2133 (
            .O(N__10039),
            .I(N__10034));
    InMux I__2132 (
            .O(N__10038),
            .I(N__10031));
    InMux I__2131 (
            .O(N__10037),
            .I(N__10028));
    LocalMux I__2130 (
            .O(N__10034),
            .I(N__10025));
    LocalMux I__2129 (
            .O(N__10031),
            .I(N__10020));
    LocalMux I__2128 (
            .O(N__10028),
            .I(N__10020));
    Span4Mux_v I__2127 (
            .O(N__10025),
            .I(N__10014));
    Span4Mux_v I__2126 (
            .O(N__10020),
            .I(N__10014));
    InMux I__2125 (
            .O(N__10019),
            .I(N__10011));
    Odrv4 I__2124 (
            .O(N__10014),
            .I(\inst_midgetv_core.INSTR_7 ));
    LocalMux I__2123 (
            .O(N__10011),
            .I(\inst_midgetv_core.INSTR_7 ));
    InMux I__2122 (
            .O(N__10006),
            .I(N__10003));
    LocalMux I__2121 (
            .O(N__10003),
            .I(N__10000));
    Span4Mux_v I__2120 (
            .O(N__10000),
            .I(N__9997));
    Span4Mux_h I__2119 (
            .O(N__9997),
            .I(N__9994));
    Odrv4 I__2118 (
            .O(N__9994),
            .I(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_imm0a ));
    CascadeMux I__2117 (
            .O(N__9991),
            .I(N__9988));
    InMux I__2116 (
            .O(N__9988),
            .I(N__9984));
    InMux I__2115 (
            .O(N__9987),
            .I(N__9981));
    LocalMux I__2114 (
            .O(N__9984),
            .I(N__9977));
    LocalMux I__2113 (
            .O(N__9981),
            .I(N__9974));
    InMux I__2112 (
            .O(N__9980),
            .I(N__9971));
    Span4Mux_h I__2111 (
            .O(N__9977),
            .I(N__9968));
    Span4Mux_h I__2110 (
            .O(N__9974),
            .I(N__9965));
    LocalMux I__2109 (
            .O(N__9971),
            .I(N__9962));
    Odrv4 I__2108 (
            .O(N__9968),
            .I(\inst_midgetv_core.INSTR_9 ));
    Odrv4 I__2107 (
            .O(N__9965),
            .I(\inst_midgetv_core.INSTR_9 ));
    Odrv4 I__2106 (
            .O(N__9962),
            .I(\inst_midgetv_core.INSTR_9 ));
    InMux I__2105 (
            .O(N__9955),
            .I(N__9952));
    LocalMux I__2104 (
            .O(N__9952),
            .I(N__9949));
    Span4Mux_v I__2103 (
            .O(N__9949),
            .I(N__9946));
    Odrv4 I__2102 (
            .O(N__9946),
            .I(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_imm2a ));
    CEMux I__2101 (
            .O(N__9943),
            .I(N__9939));
    CEMux I__2100 (
            .O(N__9942),
            .I(N__9936));
    LocalMux I__2099 (
            .O(N__9939),
            .I(N__9933));
    LocalMux I__2098 (
            .O(N__9936),
            .I(N__9930));
    Span4Mux_v I__2097 (
            .O(N__9933),
            .I(N__9927));
    Span4Mux_h I__2096 (
            .O(N__9930),
            .I(N__9924));
    Odrv4 I__2095 (
            .O(N__9927),
            .I(\inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrb.we ));
    Odrv4 I__2094 (
            .O(N__9924),
            .I(\inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrb.we ));
    CEMux I__2093 (
            .O(N__9919),
            .I(N__9915));
    CEMux I__2092 (
            .O(N__9918),
            .I(N__9912));
    LocalMux I__2091 (
            .O(N__9915),
            .I(N__9908));
    LocalMux I__2090 (
            .O(N__9912),
            .I(N__9905));
    CEMux I__2089 (
            .O(N__9911),
            .I(N__9902));
    Span4Mux_v I__2088 (
            .O(N__9908),
            .I(N__9895));
    Span4Mux_v I__2087 (
            .O(N__9905),
            .I(N__9892));
    LocalMux I__2086 (
            .O(N__9902),
            .I(N__9889));
    CEMux I__2085 (
            .O(N__9901),
            .I(N__9886));
    CEMux I__2084 (
            .O(N__9900),
            .I(N__9883));
    CEMux I__2083 (
            .O(N__9899),
            .I(N__9880));
    CEMux I__2082 (
            .O(N__9898),
            .I(N__9877));
    Span4Mux_h I__2081 (
            .O(N__9895),
            .I(N__9873));
    Span4Mux_h I__2080 (
            .O(N__9892),
            .I(N__9868));
    Span4Mux_h I__2079 (
            .O(N__9889),
            .I(N__9868));
    LocalMux I__2078 (
            .O(N__9886),
            .I(N__9865));
    LocalMux I__2077 (
            .O(N__9883),
            .I(N__9862));
    LocalMux I__2076 (
            .O(N__9880),
            .I(N__9859));
    LocalMux I__2075 (
            .O(N__9877),
            .I(N__9856));
    CEMux I__2074 (
            .O(N__9876),
            .I(N__9853));
    Sp12to4 I__2073 (
            .O(N__9873),
            .I(N__9850));
    Span4Mux_v I__2072 (
            .O(N__9868),
            .I(N__9847));
    Span4Mux_h I__2071 (
            .O(N__9865),
            .I(N__9844));
    Span4Mux_v I__2070 (
            .O(N__9862),
            .I(N__9841));
    Span4Mux_v I__2069 (
            .O(N__9859),
            .I(N__9838));
    Span4Mux_v I__2068 (
            .O(N__9856),
            .I(N__9833));
    LocalMux I__2067 (
            .O(N__9853),
            .I(N__9833));
    Span12Mux_v I__2066 (
            .O(N__9850),
            .I(N__9830));
    Span4Mux_h I__2065 (
            .O(N__9847),
            .I(N__9827));
    Span4Mux_h I__2064 (
            .O(N__9844),
            .I(N__9824));
    Span4Mux_v I__2063 (
            .O(N__9841),
            .I(N__9817));
    Span4Mux_h I__2062 (
            .O(N__9838),
            .I(N__9817));
    Span4Mux_v I__2061 (
            .O(N__9833),
            .I(N__9817));
    Odrv12 I__2060 (
            .O(N__9830),
            .I(\inst_midgetv_core.is_valid_instrhigh ));
    Odrv4 I__2059 (
            .O(N__9827),
            .I(\inst_midgetv_core.is_valid_instrhigh ));
    Odrv4 I__2058 (
            .O(N__9824),
            .I(\inst_midgetv_core.is_valid_instrhigh ));
    Odrv4 I__2057 (
            .O(N__9817),
            .I(\inst_midgetv_core.is_valid_instrhigh ));
    CEMux I__2056 (
            .O(N__9808),
            .I(N__9803));
    SRMux I__2055 (
            .O(N__9807),
            .I(N__9800));
    SRMux I__2054 (
            .O(N__9806),
            .I(N__9797));
    LocalMux I__2053 (
            .O(N__9803),
            .I(N__9794));
    LocalMux I__2052 (
            .O(N__9800),
            .I(N__9791));
    LocalMux I__2051 (
            .O(N__9797),
            .I(N__9788));
    Span4Mux_h I__2050 (
            .O(N__9794),
            .I(N__9785));
    Span4Mux_v I__2049 (
            .O(N__9791),
            .I(N__9782));
    Span4Mux_h I__2048 (
            .O(N__9788),
            .I(N__9779));
    Odrv4 I__2047 (
            .O(N__9785),
            .I(\inst_midgetv_core.progress_ucode ));
    Odrv4 I__2046 (
            .O(N__9782),
            .I(\inst_midgetv_core.progress_ucode ));
    Odrv4 I__2045 (
            .O(N__9779),
            .I(\inst_midgetv_core.progress_ucode ));
    CascadeMux I__2044 (
            .O(N__9772),
            .I(N__9769));
    InMux I__2043 (
            .O(N__9769),
            .I(N__9766));
    LocalMux I__2042 (
            .O(N__9766),
            .I(N__9763));
    Span4Mux_h I__2041 (
            .O(N__9763),
            .I(N__9760));
    Odrv4 I__2040 (
            .O(N__9760),
            .I(\inst_midgetv_core.rinx_0 ));
    InMux I__2039 (
            .O(N__9757),
            .I(N__9754));
    LocalMux I__2038 (
            .O(N__9754),
            .I(N__9751));
    Odrv12 I__2037 (
            .O(N__9751),
            .I(\inst_midgetv_core.inst_ucodepc.n5624 ));
    InMux I__2036 (
            .O(N__9748),
            .I(N__9745));
    LocalMux I__2035 (
            .O(N__9745),
            .I(\inst_midgetv_core.sa33 ));
    InMux I__2034 (
            .O(N__9742),
            .I(N__9739));
    LocalMux I__2033 (
            .O(N__9739),
            .I(\inst_midgetv_core.inst_progressctrl.n4 ));
    CEMux I__2032 (
            .O(N__9736),
            .I(N__9732));
    CEMux I__2031 (
            .O(N__9735),
            .I(N__9729));
    LocalMux I__2030 (
            .O(N__9732),
            .I(N__9721));
    LocalMux I__2029 (
            .O(N__9729),
            .I(N__9721));
    CEMux I__2028 (
            .O(N__9728),
            .I(N__9718));
    CEMux I__2027 (
            .O(N__9727),
            .I(N__9715));
    CEMux I__2026 (
            .O(N__9726),
            .I(N__9712));
    Span4Mux_v I__2025 (
            .O(N__9721),
            .I(N__9707));
    LocalMux I__2024 (
            .O(N__9718),
            .I(N__9707));
    LocalMux I__2023 (
            .O(N__9715),
            .I(N__9704));
    LocalMux I__2022 (
            .O(N__9712),
            .I(N__9701));
    Span4Mux_v I__2021 (
            .O(N__9707),
            .I(N__9698));
    Span4Mux_h I__2020 (
            .O(N__9704),
            .I(N__9695));
    Span4Mux_v I__2019 (
            .O(N__9701),
            .I(N__9690));
    Span4Mux_h I__2018 (
            .O(N__9698),
            .I(N__9690));
    Span4Mux_h I__2017 (
            .O(N__9695),
            .I(N__9687));
    Span4Mux_h I__2016 (
            .O(N__9690),
            .I(N__9684));
    Odrv4 I__2015 (
            .O(N__9687),
            .I(\inst_midgetv_core.enaQ ));
    Odrv4 I__2014 (
            .O(N__9684),
            .I(\inst_midgetv_core.enaQ ));
    InMux I__2013 (
            .O(N__9679),
            .I(N__9676));
    LocalMux I__2012 (
            .O(N__9676),
            .I(N__9673));
    Span4Mux_h I__2011 (
            .O(N__9673),
            .I(N__9670));
    Odrv4 I__2010 (
            .O(N__9670),
            .I(\inst_midgetv_core.sa00 ));
    CascadeMux I__2009 (
            .O(N__9667),
            .I(N__9664));
    CascadeBuf I__2008 (
            .O(N__9664),
            .I(N__9661));
    CascadeMux I__2007 (
            .O(N__9661),
            .I(N__9658));
    CascadeBuf I__2006 (
            .O(N__9658),
            .I(N__9655));
    CascadeMux I__2005 (
            .O(N__9655),
            .I(N__9652));
    CascadeBuf I__2004 (
            .O(N__9652),
            .I(N__9649));
    CascadeMux I__2003 (
            .O(N__9649),
            .I(N__9646));
    CascadeBuf I__2002 (
            .O(N__9646),
            .I(N__9643));
    CascadeMux I__2001 (
            .O(N__9643),
            .I(N__9640));
    CascadeBuf I__2000 (
            .O(N__9640),
            .I(N__9637));
    CascadeMux I__1999 (
            .O(N__9637),
            .I(N__9634));
    CascadeBuf I__1998 (
            .O(N__9634),
            .I(N__9631));
    CascadeMux I__1997 (
            .O(N__9631),
            .I(N__9628));
    CascadeBuf I__1996 (
            .O(N__9628),
            .I(N__9625));
    CascadeMux I__1995 (
            .O(N__9625),
            .I(N__9622));
    InMux I__1994 (
            .O(N__9622),
            .I(N__9619));
    LocalMux I__1993 (
            .O(N__9619),
            .I(N__9616));
    Span4Mux_s3_v I__1992 (
            .O(N__9616),
            .I(N__9613));
    Span4Mux_v I__1991 (
            .O(N__9613),
            .I(N__9610));
    Span4Mux_v I__1990 (
            .O(N__9610),
            .I(N__9607));
    Span4Mux_v I__1989 (
            .O(N__9607),
            .I(N__9604));
    Odrv4 I__1988 (
            .O(N__9604),
            .I(\inst_midgetv_core.Wai_0 ));
    CascadeMux I__1987 (
            .O(N__9601),
            .I(N__9596));
    InMux I__1986 (
            .O(N__9600),
            .I(N__9591));
    InMux I__1985 (
            .O(N__9599),
            .I(N__9591));
    InMux I__1984 (
            .O(N__9596),
            .I(N__9588));
    LocalMux I__1983 (
            .O(N__9591),
            .I(N__9585));
    LocalMux I__1982 (
            .O(N__9588),
            .I(N__9582));
    Span4Mux_v I__1981 (
            .O(N__9585),
            .I(N__9579));
    Odrv4 I__1980 (
            .O(N__9582),
            .I(\inst_midgetv_core.ADR_O_14 ));
    Odrv4 I__1979 (
            .O(N__9579),
            .I(\inst_midgetv_core.ADR_O_14 ));
    CascadeMux I__1978 (
            .O(N__9574),
            .I(\inst_midgetv_core.Di_14_cascade_ ));
    InMux I__1977 (
            .O(N__9571),
            .I(N__9568));
    LocalMux I__1976 (
            .O(N__9568),
            .I(N__9565));
    Odrv4 I__1975 (
            .O(N__9565),
            .I(\inst_midgetv_core.inst_alu.genblk1_inst.A_14 ));
    CascadeMux I__1974 (
            .O(N__9562),
            .I(N__9559));
    InMux I__1973 (
            .O(N__9559),
            .I(N__9556));
    LocalMux I__1972 (
            .O(N__9556),
            .I(N__9553));
    Span4Mux_v I__1971 (
            .O(N__9553),
            .I(N__9550));
    Odrv4 I__1970 (
            .O(N__9550),
            .I(\inst_midgetv_core.DAT_O_15 ));
    CascadeMux I__1969 (
            .O(N__9547),
            .I(N__9544));
    InMux I__1968 (
            .O(N__9544),
            .I(N__9539));
    InMux I__1967 (
            .O(N__9543),
            .I(N__9534));
    InMux I__1966 (
            .O(N__9542),
            .I(N__9534));
    LocalMux I__1965 (
            .O(N__9539),
            .I(N__9531));
    LocalMux I__1964 (
            .O(N__9534),
            .I(N__9528));
    Span4Mux_h I__1963 (
            .O(N__9531),
            .I(N__9523));
    Span4Mux_h I__1962 (
            .O(N__9528),
            .I(N__9523));
    Odrv4 I__1961 (
            .O(N__9523),
            .I(\inst_midgetv_core.ADR_O_15 ));
    CascadeMux I__1960 (
            .O(N__9520),
            .I(\inst_midgetv_core.Di_15_cascade_ ));
    InMux I__1959 (
            .O(N__9517),
            .I(N__9514));
    LocalMux I__1958 (
            .O(N__9514),
            .I(N__9511));
    Odrv4 I__1957 (
            .O(N__9511),
            .I(\inst_midgetv_core.inst_alu.genblk1_inst.A_15 ));
    CascadeMux I__1956 (
            .O(N__9508),
            .I(N__9503));
    InMux I__1955 (
            .O(N__9507),
            .I(N__9500));
    InMux I__1954 (
            .O(N__9506),
            .I(N__9497));
    InMux I__1953 (
            .O(N__9503),
            .I(N__9494));
    LocalMux I__1952 (
            .O(N__9500),
            .I(N__9489));
    LocalMux I__1951 (
            .O(N__9497),
            .I(N__9489));
    LocalMux I__1950 (
            .O(N__9494),
            .I(N__9484));
    Span4Mux_h I__1949 (
            .O(N__9489),
            .I(N__9484));
    Odrv4 I__1948 (
            .O(N__9484),
            .I(\inst_midgetv_core.ADR_O_17 ));
    CascadeMux I__1947 (
            .O(N__9481),
            .I(N__9478));
    InMux I__1946 (
            .O(N__9478),
            .I(N__9475));
    LocalMux I__1945 (
            .O(N__9475),
            .I(N__9472));
    Span4Mux_h I__1944 (
            .O(N__9472),
            .I(N__9469));
    Span4Mux_v I__1943 (
            .O(N__9469),
            .I(N__9466));
    Odrv4 I__1942 (
            .O(N__9466),
            .I(\inst_midgetv_core.DAT_O_16 ));
    InMux I__1941 (
            .O(N__9463),
            .I(N__9446));
    InMux I__1940 (
            .O(N__9462),
            .I(N__9446));
    InMux I__1939 (
            .O(N__9461),
            .I(N__9446));
    InMux I__1938 (
            .O(N__9460),
            .I(N__9446));
    InMux I__1937 (
            .O(N__9459),
            .I(N__9436));
    InMux I__1936 (
            .O(N__9458),
            .I(N__9436));
    InMux I__1935 (
            .O(N__9457),
            .I(N__9436));
    InMux I__1934 (
            .O(N__9456),
            .I(N__9436));
    CascadeMux I__1933 (
            .O(N__9455),
            .I(N__9432));
    LocalMux I__1932 (
            .O(N__9446),
            .I(N__9415));
    InMux I__1931 (
            .O(N__9445),
            .I(N__9412));
    LocalMux I__1930 (
            .O(N__9436),
            .I(N__9409));
    InMux I__1929 (
            .O(N__9435),
            .I(N__9400));
    InMux I__1928 (
            .O(N__9432),
            .I(N__9400));
    InMux I__1927 (
            .O(N__9431),
            .I(N__9400));
    InMux I__1926 (
            .O(N__9430),
            .I(N__9400));
    InMux I__1925 (
            .O(N__9429),
            .I(N__9391));
    InMux I__1924 (
            .O(N__9428),
            .I(N__9391));
    InMux I__1923 (
            .O(N__9427),
            .I(N__9391));
    InMux I__1922 (
            .O(N__9426),
            .I(N__9391));
    InMux I__1921 (
            .O(N__9425),
            .I(N__9382));
    InMux I__1920 (
            .O(N__9424),
            .I(N__9382));
    InMux I__1919 (
            .O(N__9423),
            .I(N__9382));
    InMux I__1918 (
            .O(N__9422),
            .I(N__9382));
    InMux I__1917 (
            .O(N__9421),
            .I(N__9366));
    InMux I__1916 (
            .O(N__9420),
            .I(N__9366));
    InMux I__1915 (
            .O(N__9419),
            .I(N__9366));
    InMux I__1914 (
            .O(N__9418),
            .I(N__9366));
    Span4Mux_v I__1913 (
            .O(N__9415),
            .I(N__9361));
    LocalMux I__1912 (
            .O(N__9412),
            .I(N__9361));
    Span4Mux_v I__1911 (
            .O(N__9409),
            .I(N__9352));
    LocalMux I__1910 (
            .O(N__9400),
            .I(N__9352));
    LocalMux I__1909 (
            .O(N__9391),
            .I(N__9352));
    LocalMux I__1908 (
            .O(N__9382),
            .I(N__9352));
    InMux I__1907 (
            .O(N__9381),
            .I(N__9345));
    InMux I__1906 (
            .O(N__9380),
            .I(N__9345));
    InMux I__1905 (
            .O(N__9379),
            .I(N__9345));
    InMux I__1904 (
            .O(N__9378),
            .I(N__9336));
    InMux I__1903 (
            .O(N__9377),
            .I(N__9336));
    InMux I__1902 (
            .O(N__9376),
            .I(N__9336));
    InMux I__1901 (
            .O(N__9375),
            .I(N__9336));
    LocalMux I__1900 (
            .O(N__9366),
            .I(\inst_midgetv_core.inst_mimux.genblk1_sa00mod ));
    Odrv4 I__1899 (
            .O(N__9361),
            .I(\inst_midgetv_core.inst_mimux.genblk1_sa00mod ));
    Odrv4 I__1898 (
            .O(N__9352),
            .I(\inst_midgetv_core.inst_mimux.genblk1_sa00mod ));
    LocalMux I__1897 (
            .O(N__9345),
            .I(\inst_midgetv_core.inst_mimux.genblk1_sa00mod ));
    LocalMux I__1896 (
            .O(N__9336),
            .I(\inst_midgetv_core.inst_mimux.genblk1_sa00mod ));
    InMux I__1895 (
            .O(N__9325),
            .I(N__9318));
    InMux I__1894 (
            .O(N__9324),
            .I(N__9318));
    InMux I__1893 (
            .O(N__9323),
            .I(N__9315));
    LocalMux I__1892 (
            .O(N__9318),
            .I(N__9312));
    LocalMux I__1891 (
            .O(N__9315),
            .I(N__9307));
    Span4Mux_h I__1890 (
            .O(N__9312),
            .I(N__9307));
    Odrv4 I__1889 (
            .O(N__9307),
            .I(\inst_midgetv_core.ADR_O_16 ));
    InMux I__1888 (
            .O(N__9304),
            .I(N__9284));
    InMux I__1887 (
            .O(N__9303),
            .I(N__9284));
    InMux I__1886 (
            .O(N__9302),
            .I(N__9284));
    InMux I__1885 (
            .O(N__9301),
            .I(N__9284));
    InMux I__1884 (
            .O(N__9300),
            .I(N__9275));
    InMux I__1883 (
            .O(N__9299),
            .I(N__9275));
    InMux I__1882 (
            .O(N__9298),
            .I(N__9275));
    InMux I__1881 (
            .O(N__9297),
            .I(N__9275));
    InMux I__1880 (
            .O(N__9296),
            .I(N__9268));
    InMux I__1879 (
            .O(N__9295),
            .I(N__9268));
    InMux I__1878 (
            .O(N__9294),
            .I(N__9268));
    InMux I__1877 (
            .O(N__9293),
            .I(N__9265));
    LocalMux I__1876 (
            .O(N__9284),
            .I(N__9244));
    LocalMux I__1875 (
            .O(N__9275),
            .I(N__9237));
    LocalMux I__1874 (
            .O(N__9268),
            .I(N__9237));
    LocalMux I__1873 (
            .O(N__9265),
            .I(N__9237));
    InMux I__1872 (
            .O(N__9264),
            .I(N__9230));
    InMux I__1871 (
            .O(N__9263),
            .I(N__9230));
    InMux I__1870 (
            .O(N__9262),
            .I(N__9230));
    InMux I__1869 (
            .O(N__9261),
            .I(N__9221));
    InMux I__1868 (
            .O(N__9260),
            .I(N__9221));
    InMux I__1867 (
            .O(N__9259),
            .I(N__9221));
    InMux I__1866 (
            .O(N__9258),
            .I(N__9221));
    InMux I__1865 (
            .O(N__9257),
            .I(N__9212));
    InMux I__1864 (
            .O(N__9256),
            .I(N__9212));
    InMux I__1863 (
            .O(N__9255),
            .I(N__9212));
    InMux I__1862 (
            .O(N__9254),
            .I(N__9212));
    InMux I__1861 (
            .O(N__9253),
            .I(N__9209));
    InMux I__1860 (
            .O(N__9252),
            .I(N__9202));
    InMux I__1859 (
            .O(N__9251),
            .I(N__9202));
    InMux I__1858 (
            .O(N__9250),
            .I(N__9202));
    InMux I__1857 (
            .O(N__9249),
            .I(N__9199));
    InMux I__1856 (
            .O(N__9248),
            .I(N__9192));
    InMux I__1855 (
            .O(N__9247),
            .I(N__9192));
    Span4Mux_v I__1854 (
            .O(N__9244),
            .I(N__9189));
    Span4Mux_v I__1853 (
            .O(N__9237),
            .I(N__9180));
    LocalMux I__1852 (
            .O(N__9230),
            .I(N__9180));
    LocalMux I__1851 (
            .O(N__9221),
            .I(N__9180));
    LocalMux I__1850 (
            .O(N__9212),
            .I(N__9180));
    LocalMux I__1849 (
            .O(N__9209),
            .I(N__9173));
    LocalMux I__1848 (
            .O(N__9202),
            .I(N__9173));
    LocalMux I__1847 (
            .O(N__9199),
            .I(N__9173));
    InMux I__1846 (
            .O(N__9198),
            .I(N__9168));
    InMux I__1845 (
            .O(N__9197),
            .I(N__9168));
    LocalMux I__1844 (
            .O(N__9192),
            .I(N__9165));
    Span4Mux_v I__1843 (
            .O(N__9189),
            .I(N__9162));
    Span4Mux_v I__1842 (
            .O(N__9180),
            .I(N__9159));
    Span4Mux_v I__1841 (
            .O(N__9173),
            .I(N__9154));
    LocalMux I__1840 (
            .O(N__9168),
            .I(N__9154));
    Span4Mux_h I__1839 (
            .O(N__9165),
            .I(N__9151));
    Span4Mux_h I__1838 (
            .O(N__9162),
            .I(N__9148));
    Span4Mux_h I__1837 (
            .O(N__9159),
            .I(N__9145));
    Span4Mux_v I__1836 (
            .O(N__9154),
            .I(N__9142));
    Span4Mux_v I__1835 (
            .O(N__9151),
            .I(N__9139));
    Odrv4 I__1834 (
            .O(N__9148),
            .I(\inst_midgetv_core.s_alu_1 ));
    Odrv4 I__1833 (
            .O(N__9145),
            .I(\inst_midgetv_core.s_alu_1 ));
    Odrv4 I__1832 (
            .O(N__9142),
            .I(\inst_midgetv_core.s_alu_1 ));
    Odrv4 I__1831 (
            .O(N__9139),
            .I(\inst_midgetv_core.s_alu_1 ));
    CascadeMux I__1830 (
            .O(N__9130),
            .I(\inst_midgetv_core.Di_16_cascade_ ));
    InMux I__1829 (
            .O(N__9127),
            .I(N__9100));
    InMux I__1828 (
            .O(N__9126),
            .I(N__9100));
    InMux I__1827 (
            .O(N__9125),
            .I(N__9100));
    InMux I__1826 (
            .O(N__9124),
            .I(N__9100));
    InMux I__1825 (
            .O(N__9123),
            .I(N__9093));
    InMux I__1824 (
            .O(N__9122),
            .I(N__9093));
    InMux I__1823 (
            .O(N__9121),
            .I(N__9093));
    InMux I__1822 (
            .O(N__9120),
            .I(N__9090));
    InMux I__1821 (
            .O(N__9119),
            .I(N__9076));
    InMux I__1820 (
            .O(N__9118),
            .I(N__9076));
    InMux I__1819 (
            .O(N__9117),
            .I(N__9067));
    InMux I__1818 (
            .O(N__9116),
            .I(N__9067));
    InMux I__1817 (
            .O(N__9115),
            .I(N__9067));
    InMux I__1816 (
            .O(N__9114),
            .I(N__9067));
    InMux I__1815 (
            .O(N__9113),
            .I(N__9058));
    InMux I__1814 (
            .O(N__9112),
            .I(N__9058));
    InMux I__1813 (
            .O(N__9111),
            .I(N__9058));
    InMux I__1812 (
            .O(N__9110),
            .I(N__9058));
    InMux I__1811 (
            .O(N__9109),
            .I(N__9055));
    LocalMux I__1810 (
            .O(N__9100),
            .I(N__9052));
    LocalMux I__1809 (
            .O(N__9093),
            .I(N__9049));
    LocalMux I__1808 (
            .O(N__9090),
            .I(N__9046));
    InMux I__1807 (
            .O(N__9089),
            .I(N__9037));
    InMux I__1806 (
            .O(N__9088),
            .I(N__9037));
    InMux I__1805 (
            .O(N__9087),
            .I(N__9037));
    InMux I__1804 (
            .O(N__9086),
            .I(N__9037));
    InMux I__1803 (
            .O(N__9085),
            .I(N__9032));
    InMux I__1802 (
            .O(N__9084),
            .I(N__9032));
    InMux I__1801 (
            .O(N__9083),
            .I(N__9025));
    InMux I__1800 (
            .O(N__9082),
            .I(N__9025));
    InMux I__1799 (
            .O(N__9081),
            .I(N__9025));
    LocalMux I__1798 (
            .O(N__9076),
            .I(N__9016));
    LocalMux I__1797 (
            .O(N__9067),
            .I(N__9016));
    LocalMux I__1796 (
            .O(N__9058),
            .I(N__9016));
    LocalMux I__1795 (
            .O(N__9055),
            .I(N__9016));
    Span4Mux_v I__1794 (
            .O(N__9052),
            .I(N__9009));
    Span4Mux_v I__1793 (
            .O(N__9049),
            .I(N__8998));
    Span4Mux_v I__1792 (
            .O(N__9046),
            .I(N__8998));
    LocalMux I__1791 (
            .O(N__9037),
            .I(N__8998));
    LocalMux I__1790 (
            .O(N__9032),
            .I(N__8998));
    LocalMux I__1789 (
            .O(N__9025),
            .I(N__8998));
    Span4Mux_v I__1788 (
            .O(N__9016),
            .I(N__8995));
    InMux I__1787 (
            .O(N__9015),
            .I(N__8986));
    InMux I__1786 (
            .O(N__9014),
            .I(N__8986));
    InMux I__1785 (
            .O(N__9013),
            .I(N__8986));
    InMux I__1784 (
            .O(N__9012),
            .I(N__8986));
    Span4Mux_v I__1783 (
            .O(N__9009),
            .I(N__8983));
    Span4Mux_v I__1782 (
            .O(N__8998),
            .I(N__8980));
    Span4Mux_h I__1781 (
            .O(N__8995),
            .I(N__8975));
    LocalMux I__1780 (
            .O(N__8986),
            .I(N__8975));
    Span4Mux_h I__1779 (
            .O(N__8983),
            .I(N__8972));
    Span4Mux_v I__1778 (
            .O(N__8980),
            .I(N__8967));
    Span4Mux_v I__1777 (
            .O(N__8975),
            .I(N__8967));
    Odrv4 I__1776 (
            .O(N__8972),
            .I(\inst_midgetv_core.s_alu_0 ));
    Odrv4 I__1775 (
            .O(N__8967),
            .I(\inst_midgetv_core.s_alu_0 ));
    CascadeMux I__1774 (
            .O(N__8962),
            .I(N__8959));
    InMux I__1773 (
            .O(N__8959),
            .I(N__8956));
    LocalMux I__1772 (
            .O(N__8956),
            .I(N__8953));
    Odrv4 I__1771 (
            .O(N__8953),
            .I(\inst_midgetv_core.inst_alu.genblk1_inst.A_16 ));
    InMux I__1770 (
            .O(N__8950),
            .I(N__8947));
    LocalMux I__1769 (
            .O(N__8947),
            .I(N__8944));
    Span4Mux_h I__1768 (
            .O(N__8944),
            .I(N__8940));
    InMux I__1767 (
            .O(N__8943),
            .I(N__8936));
    Span4Mux_v I__1766 (
            .O(N__8940),
            .I(N__8932));
    InMux I__1765 (
            .O(N__8939),
            .I(N__8929));
    LocalMux I__1764 (
            .O(N__8936),
            .I(N__8926));
    InMux I__1763 (
            .O(N__8935),
            .I(N__8923));
    Span4Mux_v I__1762 (
            .O(N__8932),
            .I(N__8918));
    LocalMux I__1761 (
            .O(N__8929),
            .I(N__8918));
    Span4Mux_h I__1760 (
            .O(N__8926),
            .I(N__8915));
    LocalMux I__1759 (
            .O(N__8923),
            .I(\inst_midgetv_core.B_30 ));
    Odrv4 I__1758 (
            .O(N__8918),
            .I(\inst_midgetv_core.B_30 ));
    Odrv4 I__1757 (
            .O(N__8915),
            .I(\inst_midgetv_core.B_30 ));
    InMux I__1756 (
            .O(N__8908),
            .I(N__8905));
    LocalMux I__1755 (
            .O(N__8905),
            .I(N__8902));
    Odrv12 I__1754 (
            .O(N__8902),
            .I(\inst_midgetv_core.sa29 ));
    InMux I__1753 (
            .O(N__8899),
            .I(N__8896));
    LocalMux I__1752 (
            .O(N__8896),
            .I(\inst_midgetv_core.inst_ucodepc.inst_illegalop.genblk1_illegal_rs1_rd_N_300 ));
    InMux I__1751 (
            .O(N__8893),
            .I(N__8890));
    LocalMux I__1750 (
            .O(N__8890),
            .I(uart_ACK_O));
    CascadeMux I__1749 (
            .O(N__8887),
            .I(N__8883));
    InMux I__1748 (
            .O(N__8886),
            .I(N__8880));
    InMux I__1747 (
            .O(N__8883),
            .I(N__8877));
    LocalMux I__1746 (
            .O(N__8880),
            .I(rDee_8));
    LocalMux I__1745 (
            .O(N__8877),
            .I(rDee_8));
    CascadeMux I__1744 (
            .O(N__8872),
            .I(N__8869));
    InMux I__1743 (
            .O(N__8869),
            .I(N__8863));
    InMux I__1742 (
            .O(N__8868),
            .I(N__8858));
    InMux I__1741 (
            .O(N__8867),
            .I(N__8858));
    InMux I__1740 (
            .O(N__8866),
            .I(N__8855));
    LocalMux I__1739 (
            .O(N__8863),
            .I(N__8850));
    LocalMux I__1738 (
            .O(N__8858),
            .I(N__8850));
    LocalMux I__1737 (
            .O(N__8855),
            .I(N__8846));
    Span4Mux_h I__1736 (
            .O(N__8850),
            .I(N__8843));
    InMux I__1735 (
            .O(N__8849),
            .I(N__8840));
    Odrv4 I__1734 (
            .O(N__8846),
            .I(\inst_midgetv_core.FUNC7_6 ));
    Odrv4 I__1733 (
            .O(N__8843),
            .I(\inst_midgetv_core.FUNC7_6 ));
    LocalMux I__1732 (
            .O(N__8840),
            .I(\inst_midgetv_core.FUNC7_6 ));
    InMux I__1731 (
            .O(N__8833),
            .I(N__8830));
    LocalMux I__1730 (
            .O(N__8830),
            .I(N__8826));
    InMux I__1729 (
            .O(N__8829),
            .I(N__8822));
    Span4Mux_h I__1728 (
            .O(N__8826),
            .I(N__8819));
    InMux I__1727 (
            .O(N__8825),
            .I(N__8816));
    LocalMux I__1726 (
            .O(N__8822),
            .I(N__8813));
    Span4Mux_h I__1725 (
            .O(N__8819),
            .I(N__8808));
    LocalMux I__1724 (
            .O(N__8816),
            .I(N__8808));
    Span4Mux_v I__1723 (
            .O(N__8813),
            .I(N__8805));
    Span4Mux_v I__1722 (
            .O(N__8808),
            .I(N__8802));
    Odrv4 I__1721 (
            .O(N__8805),
            .I(\inst_midgetv_core.FUNC7_1 ));
    Odrv4 I__1720 (
            .O(N__8802),
            .I(\inst_midgetv_core.FUNC7_1 ));
    InMux I__1719 (
            .O(N__8797),
            .I(N__8792));
    InMux I__1718 (
            .O(N__8796),
            .I(N__8789));
    CascadeMux I__1717 (
            .O(N__8795),
            .I(N__8786));
    LocalMux I__1716 (
            .O(N__8792),
            .I(N__8783));
    LocalMux I__1715 (
            .O(N__8789),
            .I(N__8780));
    InMux I__1714 (
            .O(N__8786),
            .I(N__8777));
    Span4Mux_h I__1713 (
            .O(N__8783),
            .I(N__8772));
    Span4Mux_v I__1712 (
            .O(N__8780),
            .I(N__8772));
    LocalMux I__1711 (
            .O(N__8777),
            .I(N__8769));
    Odrv4 I__1710 (
            .O(N__8772),
            .I(\inst_midgetv_core.FUNC7_3 ));
    Odrv4 I__1709 (
            .O(N__8769),
            .I(\inst_midgetv_core.FUNC7_3 ));
    InMux I__1708 (
            .O(N__8764),
            .I(N__8761));
    LocalMux I__1707 (
            .O(N__8761),
            .I(N__8757));
    InMux I__1706 (
            .O(N__8760),
            .I(N__8753));
    Span4Mux_v I__1705 (
            .O(N__8757),
            .I(N__8750));
    InMux I__1704 (
            .O(N__8756),
            .I(N__8746));
    LocalMux I__1703 (
            .O(N__8753),
            .I(N__8743));
    Span4Mux_v I__1702 (
            .O(N__8750),
            .I(N__8740));
    InMux I__1701 (
            .O(N__8749),
            .I(N__8737));
    LocalMux I__1700 (
            .O(N__8746),
            .I(N__8734));
    Span4Mux_h I__1699 (
            .O(N__8743),
            .I(N__8731));
    Sp12to4 I__1698 (
            .O(N__8740),
            .I(N__8728));
    LocalMux I__1697 (
            .O(N__8737),
            .I(N__8723));
    Span4Mux_h I__1696 (
            .O(N__8734),
            .I(N__8723));
    Odrv4 I__1695 (
            .O(N__8731),
            .I(\inst_midgetv_core.FUNC7_0 ));
    Odrv12 I__1694 (
            .O(N__8728),
            .I(\inst_midgetv_core.FUNC7_0 ));
    Odrv4 I__1693 (
            .O(N__8723),
            .I(\inst_midgetv_core.FUNC7_0 ));
    InMux I__1692 (
            .O(N__8716),
            .I(N__8713));
    LocalMux I__1691 (
            .O(N__8713),
            .I(N__8710));
    Odrv4 I__1690 (
            .O(N__8710),
            .I(\inst_midgetv_core.inst_ucodepc.inst_illegalop.n12 ));
    InMux I__1689 (
            .O(N__8707),
            .I(N__8704));
    LocalMux I__1688 (
            .O(N__8704),
            .I(\inst_midgetv_core.inst_ucodepc.inst_illegalop.n17 ));
    CascadeMux I__1687 (
            .O(N__8701),
            .I(N__8698));
    InMux I__1686 (
            .O(N__8698),
            .I(N__8695));
    LocalMux I__1685 (
            .O(N__8695),
            .I(\inst_midgetv_core.inst_ucodepc.inst_illegalop.n16 ));
    CascadeMux I__1684 (
            .O(N__8692),
            .I(N__8689));
    InMux I__1683 (
            .O(N__8689),
            .I(N__8686));
    LocalMux I__1682 (
            .O(N__8686),
            .I(N__8683));
    Span4Mux_h I__1681 (
            .O(N__8683),
            .I(N__8680));
    Odrv4 I__1680 (
            .O(N__8680),
            .I(\inst_midgetv_core.DAT_O_13 ));
    InMux I__1679 (
            .O(N__8677),
            .I(N__8672));
    InMux I__1678 (
            .O(N__8676),
            .I(N__8667));
    InMux I__1677 (
            .O(N__8675),
            .I(N__8667));
    LocalMux I__1676 (
            .O(N__8672),
            .I(N__8660));
    LocalMux I__1675 (
            .O(N__8667),
            .I(N__8657));
    InMux I__1674 (
            .O(N__8666),
            .I(N__8654));
    InMux I__1673 (
            .O(N__8665),
            .I(N__8651));
    InMux I__1672 (
            .O(N__8664),
            .I(N__8646));
    InMux I__1671 (
            .O(N__8663),
            .I(N__8646));
    Span4Mux_h I__1670 (
            .O(N__8660),
            .I(N__8643));
    Span4Mux_h I__1669 (
            .O(N__8657),
            .I(N__8640));
    LocalMux I__1668 (
            .O(N__8654),
            .I(N__8637));
    LocalMux I__1667 (
            .O(N__8651),
            .I(N__8632));
    LocalMux I__1666 (
            .O(N__8646),
            .I(N__8632));
    Odrv4 I__1665 (
            .O(N__8643),
            .I(\inst_midgetv_core.INSTR_13 ));
    Odrv4 I__1664 (
            .O(N__8640),
            .I(\inst_midgetv_core.INSTR_13 ));
    Odrv12 I__1663 (
            .O(N__8637),
            .I(\inst_midgetv_core.INSTR_13 ));
    Odrv4 I__1662 (
            .O(N__8632),
            .I(\inst_midgetv_core.INSTR_13 ));
    CascadeMux I__1661 (
            .O(N__8623),
            .I(\inst_midgetv_core.Di_13_cascade_ ));
    CascadeMux I__1660 (
            .O(N__8620),
            .I(N__8616));
    InMux I__1659 (
            .O(N__8619),
            .I(N__8613));
    InMux I__1658 (
            .O(N__8616),
            .I(N__8610));
    LocalMux I__1657 (
            .O(N__8613),
            .I(N__8607));
    LocalMux I__1656 (
            .O(N__8610),
            .I(N__8601));
    Span4Mux_h I__1655 (
            .O(N__8607),
            .I(N__8601));
    InMux I__1654 (
            .O(N__8606),
            .I(N__8598));
    Odrv4 I__1653 (
            .O(N__8601),
            .I(\inst_midgetv_core.ADR_O_13 ));
    LocalMux I__1652 (
            .O(N__8598),
            .I(\inst_midgetv_core.ADR_O_13 ));
    InMux I__1651 (
            .O(N__8593),
            .I(N__8590));
    LocalMux I__1650 (
            .O(N__8590),
            .I(N__8587));
    Odrv12 I__1649 (
            .O(N__8587),
            .I(\inst_midgetv_core.inst_alu.genblk1_inst.A_13 ));
    CascadeMux I__1648 (
            .O(N__8584),
            .I(N__8581));
    InMux I__1647 (
            .O(N__8581),
            .I(N__8578));
    LocalMux I__1646 (
            .O(N__8578),
            .I(N__8575));
    Span4Mux_h I__1645 (
            .O(N__8575),
            .I(N__8572));
    Odrv4 I__1644 (
            .O(N__8572),
            .I(\inst_midgetv_core.DAT_O_14 ));
    InMux I__1643 (
            .O(N__8569),
            .I(N__8565));
    InMux I__1642 (
            .O(N__8568),
            .I(N__8562));
    LocalMux I__1641 (
            .O(N__8565),
            .I(N__8556));
    LocalMux I__1640 (
            .O(N__8562),
            .I(N__8553));
    InMux I__1639 (
            .O(N__8561),
            .I(N__8550));
    InMux I__1638 (
            .O(N__8560),
            .I(N__8547));
    InMux I__1637 (
            .O(N__8559),
            .I(N__8544));
    Span4Mux_h I__1636 (
            .O(N__8556),
            .I(N__8541));
    Span4Mux_v I__1635 (
            .O(N__8553),
            .I(N__8538));
    LocalMux I__1634 (
            .O(N__8550),
            .I(N__8535));
    LocalMux I__1633 (
            .O(N__8547),
            .I(N__8530));
    LocalMux I__1632 (
            .O(N__8544),
            .I(N__8530));
    Odrv4 I__1631 (
            .O(N__8541),
            .I(\inst_midgetv_core.INSTR_14 ));
    Odrv4 I__1630 (
            .O(N__8538),
            .I(\inst_midgetv_core.INSTR_14 ));
    Odrv12 I__1629 (
            .O(N__8535),
            .I(\inst_midgetv_core.INSTR_14 ));
    Odrv4 I__1628 (
            .O(N__8530),
            .I(\inst_midgetv_core.INSTR_14 ));
    InMux I__1627 (
            .O(N__8521),
            .I(N__8518));
    LocalMux I__1626 (
            .O(N__8518),
            .I(\inst_midgetv_core.inst_ucodepc.inst_illegalop.n5605 ));
    CascadeMux I__1625 (
            .O(N__8515),
            .I(N__8507));
    CascadeMux I__1624 (
            .O(N__8514),
            .I(N__8504));
    CascadeMux I__1623 (
            .O(N__8513),
            .I(N__8501));
    CascadeMux I__1622 (
            .O(N__8512),
            .I(N__8498));
    InMux I__1621 (
            .O(N__8511),
            .I(N__8493));
    InMux I__1620 (
            .O(N__8510),
            .I(N__8493));
    InMux I__1619 (
            .O(N__8507),
            .I(N__8490));
    InMux I__1618 (
            .O(N__8504),
            .I(N__8485));
    InMux I__1617 (
            .O(N__8501),
            .I(N__8485));
    InMux I__1616 (
            .O(N__8498),
            .I(N__8482));
    LocalMux I__1615 (
            .O(N__8493),
            .I(\inst_midgetv_core.INSTR_3 ));
    LocalMux I__1614 (
            .O(N__8490),
            .I(\inst_midgetv_core.INSTR_3 ));
    LocalMux I__1613 (
            .O(N__8485),
            .I(\inst_midgetv_core.INSTR_3 ));
    LocalMux I__1612 (
            .O(N__8482),
            .I(\inst_midgetv_core.INSTR_3 ));
    InMux I__1611 (
            .O(N__8473),
            .I(N__8470));
    LocalMux I__1610 (
            .O(N__8470),
            .I(\inst_midgetv_core.inst_ucodepc.inst_illegalop.n8 ));
    InMux I__1609 (
            .O(N__8467),
            .I(N__8462));
    InMux I__1608 (
            .O(N__8466),
            .I(N__8459));
    InMux I__1607 (
            .O(N__8465),
            .I(N__8456));
    LocalMux I__1606 (
            .O(N__8462),
            .I(N__8453));
    LocalMux I__1605 (
            .O(N__8459),
            .I(N__8450));
    LocalMux I__1604 (
            .O(N__8456),
            .I(N__8443));
    Span4Mux_v I__1603 (
            .O(N__8453),
            .I(N__8443));
    Span4Mux_h I__1602 (
            .O(N__8450),
            .I(N__8443));
    Odrv4 I__1601 (
            .O(N__8443),
            .I(\inst_midgetv_core.FUNC7_2 ));
    InMux I__1600 (
            .O(N__8440),
            .I(N__8435));
    InMux I__1599 (
            .O(N__8439),
            .I(N__8432));
    InMux I__1598 (
            .O(N__8438),
            .I(N__8429));
    LocalMux I__1597 (
            .O(N__8435),
            .I(N__8426));
    LocalMux I__1596 (
            .O(N__8432),
            .I(N__8423));
    LocalMux I__1595 (
            .O(N__8429),
            .I(\inst_midgetv_core.FUNC7_4 ));
    Odrv4 I__1594 (
            .O(N__8426),
            .I(\inst_midgetv_core.FUNC7_4 ));
    Odrv4 I__1593 (
            .O(N__8423),
            .I(\inst_midgetv_core.FUNC7_4 ));
    InMux I__1592 (
            .O(N__8416),
            .I(N__8411));
    CascadeMux I__1591 (
            .O(N__8415),
            .I(N__8408));
    CascadeMux I__1590 (
            .O(N__8414),
            .I(N__8405));
    LocalMux I__1589 (
            .O(N__8411),
            .I(N__8401));
    InMux I__1588 (
            .O(N__8408),
            .I(N__8397));
    InMux I__1587 (
            .O(N__8405),
            .I(N__8394));
    InMux I__1586 (
            .O(N__8404),
            .I(N__8391));
    Span4Mux_v I__1585 (
            .O(N__8401),
            .I(N__8388));
    InMux I__1584 (
            .O(N__8400),
            .I(N__8385));
    LocalMux I__1583 (
            .O(N__8397),
            .I(N__8382));
    LocalMux I__1582 (
            .O(N__8394),
            .I(N__8379));
    LocalMux I__1581 (
            .O(N__8391),
            .I(N__8376));
    Span4Mux_h I__1580 (
            .O(N__8388),
            .I(N__8371));
    LocalMux I__1579 (
            .O(N__8385),
            .I(N__8371));
    Span4Mux_h I__1578 (
            .O(N__8382),
            .I(N__8368));
    Span12Mux_s10_h I__1577 (
            .O(N__8379),
            .I(N__8365));
    Span4Mux_h I__1576 (
            .O(N__8376),
            .I(N__8362));
    Odrv4 I__1575 (
            .O(N__8371),
            .I(\inst_midgetv_core.FUNC7_5 ));
    Odrv4 I__1574 (
            .O(N__8368),
            .I(\inst_midgetv_core.FUNC7_5 ));
    Odrv12 I__1573 (
            .O(N__8365),
            .I(\inst_midgetv_core.FUNC7_5 ));
    Odrv4 I__1572 (
            .O(N__8362),
            .I(\inst_midgetv_core.FUNC7_5 ));
    InMux I__1571 (
            .O(N__8353),
            .I(N__8350));
    LocalMux I__1570 (
            .O(N__8350),
            .I(\inst_midgetv_core.inst_ucodepc.inst_illegalop.n497 ));
    InMux I__1569 (
            .O(N__8347),
            .I(N__8344));
    LocalMux I__1568 (
            .O(N__8344),
            .I(\inst_midgetv_core.inst_ucodepc.inst_illegalop.n11 ));
    InMux I__1567 (
            .O(N__8341),
            .I(N__8333));
    InMux I__1566 (
            .O(N__8340),
            .I(N__8326));
    InMux I__1565 (
            .O(N__8339),
            .I(N__8326));
    InMux I__1564 (
            .O(N__8338),
            .I(N__8326));
    InMux I__1563 (
            .O(N__8337),
            .I(N__8323));
    CascadeMux I__1562 (
            .O(N__8336),
            .I(N__8316));
    LocalMux I__1561 (
            .O(N__8333),
            .I(N__8313));
    LocalMux I__1560 (
            .O(N__8326),
            .I(N__8310));
    LocalMux I__1559 (
            .O(N__8323),
            .I(N__8307));
    InMux I__1558 (
            .O(N__8322),
            .I(N__8302));
    InMux I__1557 (
            .O(N__8321),
            .I(N__8302));
    InMux I__1556 (
            .O(N__8320),
            .I(N__8297));
    InMux I__1555 (
            .O(N__8319),
            .I(N__8297));
    InMux I__1554 (
            .O(N__8316),
            .I(N__8294));
    Odrv4 I__1553 (
            .O(N__8313),
            .I(\inst_midgetv_core.INSTR_5 ));
    Odrv4 I__1552 (
            .O(N__8310),
            .I(\inst_midgetv_core.INSTR_5 ));
    Odrv4 I__1551 (
            .O(N__8307),
            .I(\inst_midgetv_core.INSTR_5 ));
    LocalMux I__1550 (
            .O(N__8302),
            .I(\inst_midgetv_core.INSTR_5 ));
    LocalMux I__1549 (
            .O(N__8297),
            .I(\inst_midgetv_core.INSTR_5 ));
    LocalMux I__1548 (
            .O(N__8294),
            .I(\inst_midgetv_core.INSTR_5 ));
    CascadeMux I__1547 (
            .O(N__8281),
            .I(N__8278));
    InMux I__1546 (
            .O(N__8278),
            .I(N__8274));
    InMux I__1545 (
            .O(N__8277),
            .I(N__8271));
    LocalMux I__1544 (
            .O(N__8274),
            .I(\inst_midgetv_core.inst_ucodepc.inst_illegalop.n2575 ));
    LocalMux I__1543 (
            .O(N__8271),
            .I(\inst_midgetv_core.inst_ucodepc.inst_illegalop.n2575 ));
    CascadeMux I__1542 (
            .O(N__8266),
            .I(N__8263));
    InMux I__1541 (
            .O(N__8263),
            .I(N__8260));
    LocalMux I__1540 (
            .O(N__8260),
            .I(\inst_midgetv_core.inst_ucodepc.inst_illegalop.genblk1_checkfunct7_N_281 ));
    InMux I__1539 (
            .O(N__8257),
            .I(N__8254));
    LocalMux I__1538 (
            .O(N__8254),
            .I(N__8250));
    InMux I__1537 (
            .O(N__8253),
            .I(N__8247));
    Span4Mux_h I__1536 (
            .O(N__8250),
            .I(N__8244));
    LocalMux I__1535 (
            .O(N__8247),
            .I(N__8241));
    Odrv4 I__1534 (
            .O(N__8244),
            .I(\inst_midgetv_core.raluF ));
    Odrv12 I__1533 (
            .O(N__8241),
            .I(\inst_midgetv_core.raluF ));
    InMux I__1532 (
            .O(N__8236),
            .I(N__8233));
    LocalMux I__1531 (
            .O(N__8233),
            .I(N__8230));
    Span4Mux_h I__1530 (
            .O(N__8230),
            .I(N__8227));
    Odrv4 I__1529 (
            .O(N__8227),
            .I(\inst_midgetv_core.is_brcond ));
    InMux I__1528 (
            .O(N__8224),
            .I(N__8221));
    LocalMux I__1527 (
            .O(N__8221),
            .I(N__8218));
    Span4Mux_h I__1526 (
            .O(N__8218),
            .I(N__8215));
    Odrv4 I__1525 (
            .O(N__8215),
            .I(\inst_midgetv_core.rzcy32 ));
    InMux I__1524 (
            .O(N__8212),
            .I(N__8208));
    InMux I__1523 (
            .O(N__8211),
            .I(N__8205));
    LocalMux I__1522 (
            .O(N__8208),
            .I(N__8200));
    LocalMux I__1521 (
            .O(N__8205),
            .I(N__8197));
    CascadeMux I__1520 (
            .O(N__8204),
            .I(N__8191));
    InMux I__1519 (
            .O(N__8203),
            .I(N__8187));
    Span4Mux_v I__1518 (
            .O(N__8200),
            .I(N__8184));
    Span4Mux_v I__1517 (
            .O(N__8197),
            .I(N__8181));
    InMux I__1516 (
            .O(N__8196),
            .I(N__8176));
    InMux I__1515 (
            .O(N__8195),
            .I(N__8176));
    InMux I__1514 (
            .O(N__8194),
            .I(N__8169));
    InMux I__1513 (
            .O(N__8191),
            .I(N__8169));
    InMux I__1512 (
            .O(N__8190),
            .I(N__8169));
    LocalMux I__1511 (
            .O(N__8187),
            .I(\inst_midgetv_core.INSTR_12 ));
    Odrv4 I__1510 (
            .O(N__8184),
            .I(\inst_midgetv_core.INSTR_12 ));
    Odrv4 I__1509 (
            .O(N__8181),
            .I(\inst_midgetv_core.INSTR_12 ));
    LocalMux I__1508 (
            .O(N__8176),
            .I(\inst_midgetv_core.INSTR_12 ));
    LocalMux I__1507 (
            .O(N__8169),
            .I(\inst_midgetv_core.INSTR_12 ));
    CascadeMux I__1506 (
            .O(N__8158),
            .I(N__8155));
    InMux I__1505 (
            .O(N__8155),
            .I(N__8152));
    LocalMux I__1504 (
            .O(N__8152),
            .I(\inst_midgetv_core.inst_condcode.n5618 ));
    InMux I__1503 (
            .O(N__8149),
            .I(N__8146));
    LocalMux I__1502 (
            .O(N__8146),
            .I(\inst_midgetv_core.inst_ucodepc.n5603 ));
    InMux I__1501 (
            .O(N__8143),
            .I(N__8140));
    LocalMux I__1500 (
            .O(N__8140),
            .I(\inst_midgetv_core.inst_ucodepc.n17 ));
    InMux I__1499 (
            .O(N__8137),
            .I(N__8134));
    LocalMux I__1498 (
            .O(N__8134),
            .I(\inst_midgetv_core.inst_ucodepc.dinx_1_N_145_0 ));
    InMux I__1497 (
            .O(N__8131),
            .I(N__8128));
    LocalMux I__1496 (
            .O(N__8128),
            .I(N__8125));
    Odrv4 I__1495 (
            .O(N__8125),
            .I(\inst_midgetv_core.inst_ucodepc.n5613 ));
    InMux I__1494 (
            .O(N__8122),
            .I(N__8119));
    LocalMux I__1493 (
            .O(N__8119),
            .I(\inst_midgetv_core.inst_ucodepc.inst_illegalop.genblk2_illegal_a ));
    InMux I__1492 (
            .O(N__8116),
            .I(N__8113));
    LocalMux I__1491 (
            .O(N__8113),
            .I(\inst_midgetv_core.inst_ucodepc.inst_illegalop.n6 ));
    CascadeMux I__1490 (
            .O(N__8110),
            .I(N__8107));
    InMux I__1489 (
            .O(N__8107),
            .I(N__8104));
    LocalMux I__1488 (
            .O(N__8104),
            .I(\inst_midgetv_core.inst_ucodepc.inst_illegalop.n2 ));
    InMux I__1487 (
            .O(N__8101),
            .I(N__8098));
    LocalMux I__1486 (
            .O(N__8098),
            .I(\inst_midgetv_core.inst_ucodepc.inst_illegalop.genblk1_checkfunct7_N_286 ));
    InMux I__1485 (
            .O(N__8095),
            .I(N__8092));
    LocalMux I__1484 (
            .O(N__8092),
            .I(N__8087));
    InMux I__1483 (
            .O(N__8091),
            .I(N__8082));
    InMux I__1482 (
            .O(N__8090),
            .I(N__8082));
    Sp12to4 I__1481 (
            .O(N__8087),
            .I(N__8079));
    LocalMux I__1480 (
            .O(N__8082),
            .I(N__8076));
    Odrv12 I__1479 (
            .O(N__8079),
            .I(\inst_midgetv_core.ADR_O_28 ));
    Odrv4 I__1478 (
            .O(N__8076),
            .I(\inst_midgetv_core.ADR_O_28 ));
    CascadeMux I__1477 (
            .O(N__8071),
            .I(\inst_midgetv_core.Di_28_cascade_ ));
    CascadeMux I__1476 (
            .O(N__8068),
            .I(N__8065));
    InMux I__1475 (
            .O(N__8065),
            .I(N__8062));
    LocalMux I__1474 (
            .O(N__8062),
            .I(N__8059));
    Sp12to4 I__1473 (
            .O(N__8059),
            .I(N__8056));
    Odrv12 I__1472 (
            .O(N__8056),
            .I(\inst_midgetv_core.inst_alu.genblk1_inst.A_28 ));
    CascadeMux I__1471 (
            .O(N__8053),
            .I(N__8050));
    InMux I__1470 (
            .O(N__8050),
            .I(N__8047));
    LocalMux I__1469 (
            .O(N__8047),
            .I(N__8044));
    Span4Mux_h I__1468 (
            .O(N__8044),
            .I(N__8041));
    Odrv4 I__1467 (
            .O(N__8041),
            .I(\inst_midgetv_core.rinx_1 ));
    CascadeMux I__1466 (
            .O(N__8038),
            .I(N__8035));
    CascadeBuf I__1465 (
            .O(N__8035),
            .I(N__8032));
    CascadeMux I__1464 (
            .O(N__8032),
            .I(N__8028));
    CascadeMux I__1463 (
            .O(N__8031),
            .I(N__8025));
    InMux I__1462 (
            .O(N__8028),
            .I(N__8022));
    InMux I__1461 (
            .O(N__8025),
            .I(N__8019));
    LocalMux I__1460 (
            .O(N__8022),
            .I(N__8016));
    LocalMux I__1459 (
            .O(N__8019),
            .I(\inst_midgetv_core.minx_1 ));
    Odrv4 I__1458 (
            .O(N__8016),
            .I(\inst_midgetv_core.minx_1 ));
    CascadeMux I__1457 (
            .O(N__8011),
            .I(N__8008));
    InMux I__1456 (
            .O(N__8008),
            .I(N__8005));
    LocalMux I__1455 (
            .O(N__8005),
            .I(N__8002));
    Span4Mux_h I__1454 (
            .O(N__8002),
            .I(N__7999));
    Odrv4 I__1453 (
            .O(N__7999),
            .I(\inst_midgetv_core.rinx_5 ));
    CascadeMux I__1452 (
            .O(N__7996),
            .I(N__7993));
    CascadeBuf I__1451 (
            .O(N__7993),
            .I(N__7990));
    CascadeMux I__1450 (
            .O(N__7990),
            .I(N__7986));
    InMux I__1449 (
            .O(N__7989),
            .I(N__7983));
    InMux I__1448 (
            .O(N__7986),
            .I(N__7980));
    LocalMux I__1447 (
            .O(N__7983),
            .I(N__7977));
    LocalMux I__1446 (
            .O(N__7980),
            .I(N__7974));
    Span4Mux_v I__1445 (
            .O(N__7977),
            .I(N__7969));
    Span4Mux_h I__1444 (
            .O(N__7974),
            .I(N__7969));
    Odrv4 I__1443 (
            .O(N__7969),
            .I(\inst_midgetv_core.minx_5 ));
    CascadeMux I__1442 (
            .O(N__7966),
            .I(N__7963));
    InMux I__1441 (
            .O(N__7963),
            .I(N__7960));
    LocalMux I__1440 (
            .O(N__7960),
            .I(N__7957));
    Span4Mux_h I__1439 (
            .O(N__7957),
            .I(N__7954));
    Odrv4 I__1438 (
            .O(N__7954),
            .I(\inst_midgetv_core.rinx_7 ));
    CascadeMux I__1437 (
            .O(N__7951),
            .I(N__7948));
    CascadeBuf I__1436 (
            .O(N__7948),
            .I(N__7944));
    InMux I__1435 (
            .O(N__7947),
            .I(N__7941));
    CascadeMux I__1434 (
            .O(N__7944),
            .I(N__7938));
    LocalMux I__1433 (
            .O(N__7941),
            .I(N__7935));
    InMux I__1432 (
            .O(N__7938),
            .I(N__7932));
    Span4Mux_h I__1431 (
            .O(N__7935),
            .I(N__7929));
    LocalMux I__1430 (
            .O(N__7932),
            .I(N__7926));
    Odrv4 I__1429 (
            .O(N__7929),
            .I(\inst_midgetv_core.minx_7 ));
    Odrv4 I__1428 (
            .O(N__7926),
            .I(\inst_midgetv_core.minx_7 ));
    InMux I__1427 (
            .O(N__7921),
            .I(N__7918));
    LocalMux I__1426 (
            .O(N__7918),
            .I(N__7915));
    Span4Mux_v I__1425 (
            .O(N__7915),
            .I(N__7912));
    Odrv4 I__1424 (
            .O(N__7912),
            .I(\inst_midgetv_core.rinx_3 ));
    CascadeMux I__1423 (
            .O(N__7909),
            .I(N__7906));
    CascadeBuf I__1422 (
            .O(N__7906),
            .I(N__7903));
    CascadeMux I__1421 (
            .O(N__7903),
            .I(N__7899));
    InMux I__1420 (
            .O(N__7902),
            .I(N__7896));
    InMux I__1419 (
            .O(N__7899),
            .I(N__7893));
    LocalMux I__1418 (
            .O(N__7896),
            .I(N__7890));
    LocalMux I__1417 (
            .O(N__7893),
            .I(N__7887));
    Odrv4 I__1416 (
            .O(N__7890),
            .I(\inst_midgetv_core.minx_3 ));
    Odrv4 I__1415 (
            .O(N__7887),
            .I(\inst_midgetv_core.minx_3 ));
    InMux I__1414 (
            .O(N__7882),
            .I(N__7878));
    CascadeMux I__1413 (
            .O(N__7881),
            .I(N__7870));
    LocalMux I__1412 (
            .O(N__7878),
            .I(N__7866));
    InMux I__1411 (
            .O(N__7877),
            .I(N__7861));
    InMux I__1410 (
            .O(N__7876),
            .I(N__7861));
    InMux I__1409 (
            .O(N__7875),
            .I(N__7850));
    InMux I__1408 (
            .O(N__7874),
            .I(N__7850));
    InMux I__1407 (
            .O(N__7873),
            .I(N__7850));
    InMux I__1406 (
            .O(N__7870),
            .I(N__7850));
    InMux I__1405 (
            .O(N__7869),
            .I(N__7850));
    Odrv4 I__1404 (
            .O(N__7866),
            .I(\inst_midgetv_core.inst_ucodepc.usedinx_or_RST_I_notcorerunning ));
    LocalMux I__1403 (
            .O(N__7861),
            .I(\inst_midgetv_core.inst_ucodepc.usedinx_or_RST_I_notcorerunning ));
    LocalMux I__1402 (
            .O(N__7850),
            .I(\inst_midgetv_core.inst_ucodepc.usedinx_or_RST_I_notcorerunning ));
    CascadeMux I__1401 (
            .O(N__7843),
            .I(N__7840));
    InMux I__1400 (
            .O(N__7840),
            .I(N__7837));
    LocalMux I__1399 (
            .O(N__7837),
            .I(N__7834));
    Span4Mux_h I__1398 (
            .O(N__7834),
            .I(N__7831));
    Odrv4 I__1397 (
            .O(N__7831),
            .I(\inst_midgetv_core.rinx_6 ));
    InMux I__1396 (
            .O(N__7828),
            .I(N__7810));
    InMux I__1395 (
            .O(N__7827),
            .I(N__7810));
    InMux I__1394 (
            .O(N__7826),
            .I(N__7810));
    InMux I__1393 (
            .O(N__7825),
            .I(N__7810));
    InMux I__1392 (
            .O(N__7824),
            .I(N__7810));
    InMux I__1391 (
            .O(N__7823),
            .I(N__7805));
    InMux I__1390 (
            .O(N__7822),
            .I(N__7805));
    InMux I__1389 (
            .O(N__7821),
            .I(N__7802));
    LocalMux I__1388 (
            .O(N__7810),
            .I(\inst_midgetv_core.inst_ucodepc.illegal ));
    LocalMux I__1387 (
            .O(N__7805),
            .I(\inst_midgetv_core.inst_ucodepc.illegal ));
    LocalMux I__1386 (
            .O(N__7802),
            .I(\inst_midgetv_core.inst_ucodepc.illegal ));
    CascadeMux I__1385 (
            .O(N__7795),
            .I(N__7792));
    CascadeBuf I__1384 (
            .O(N__7792),
            .I(N__7789));
    CascadeMux I__1383 (
            .O(N__7789),
            .I(N__7786));
    InMux I__1382 (
            .O(N__7786),
            .I(N__7783));
    LocalMux I__1381 (
            .O(N__7783),
            .I(N__7780));
    Span4Mux_h I__1380 (
            .O(N__7780),
            .I(N__7777));
    Odrv4 I__1379 (
            .O(N__7777),
            .I(\inst_midgetv_core.minx_6 ));
    InMux I__1378 (
            .O(N__7774),
            .I(N__7771));
    LocalMux I__1377 (
            .O(N__7771),
            .I(\inst_midgetv_core.inst_ucodepc.n15 ));
    InMux I__1376 (
            .O(N__7768),
            .I(N__7765));
    LocalMux I__1375 (
            .O(N__7765),
            .I(N__7762));
    Span4Mux_v I__1374 (
            .O(N__7762),
            .I(N__7759));
    Span4Mux_h I__1373 (
            .O(N__7759),
            .I(N__7756));
    Odrv4 I__1372 (
            .O(N__7756),
            .I(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_sa09h ));
    CascadeMux I__1371 (
            .O(N__7753),
            .I(N__7750));
    InMux I__1370 (
            .O(N__7750),
            .I(N__7745));
    InMux I__1369 (
            .O(N__7749),
            .I(N__7740));
    InMux I__1368 (
            .O(N__7748),
            .I(N__7740));
    LocalMux I__1367 (
            .O(N__7745),
            .I(N__7737));
    LocalMux I__1366 (
            .O(N__7740),
            .I(N__7734));
    Odrv4 I__1365 (
            .O(N__7737),
            .I(\inst_midgetv_core.ADR_O_20 ));
    Odrv4 I__1364 (
            .O(N__7734),
            .I(\inst_midgetv_core.ADR_O_20 ));
    CascadeMux I__1363 (
            .O(N__7729),
            .I(\inst_midgetv_core.Di_20_cascade_ ));
    InMux I__1362 (
            .O(N__7726),
            .I(N__7723));
    LocalMux I__1361 (
            .O(N__7723),
            .I(N__7720));
    Odrv4 I__1360 (
            .O(N__7720),
            .I(\inst_midgetv_core.inst_alu.genblk1_inst.A_20 ));
    CascadeMux I__1359 (
            .O(N__7717),
            .I(N__7714));
    InMux I__1358 (
            .O(N__7714),
            .I(N__7711));
    LocalMux I__1357 (
            .O(N__7711),
            .I(N__7708));
    Span4Mux_h I__1356 (
            .O(N__7708),
            .I(N__7705));
    Span4Mux_v I__1355 (
            .O(N__7705),
            .I(N__7702));
    Odrv4 I__1354 (
            .O(N__7702),
            .I(\inst_midgetv_core.DAT_O_25 ));
    CascadeMux I__1353 (
            .O(N__7699),
            .I(\inst_midgetv_core.Di_25_cascade_ ));
    CascadeMux I__1352 (
            .O(N__7696),
            .I(N__7692));
    InMux I__1351 (
            .O(N__7695),
            .I(N__7688));
    InMux I__1350 (
            .O(N__7692),
            .I(N__7685));
    InMux I__1349 (
            .O(N__7691),
            .I(N__7682));
    LocalMux I__1348 (
            .O(N__7688),
            .I(N__7679));
    LocalMux I__1347 (
            .O(N__7685),
            .I(N__7674));
    LocalMux I__1346 (
            .O(N__7682),
            .I(N__7674));
    Odrv4 I__1345 (
            .O(N__7679),
            .I(\inst_midgetv_core.ADR_O_25 ));
    Odrv4 I__1344 (
            .O(N__7674),
            .I(\inst_midgetv_core.ADR_O_25 ));
    InMux I__1343 (
            .O(N__7669),
            .I(N__7666));
    LocalMux I__1342 (
            .O(N__7666),
            .I(N__7663));
    Span4Mux_h I__1341 (
            .O(N__7663),
            .I(N__7660));
    Odrv4 I__1340 (
            .O(N__7660),
            .I(\inst_midgetv_core.inst_alu.genblk1_inst.A_25 ));
    CascadeMux I__1339 (
            .O(N__7657),
            .I(N__7654));
    InMux I__1338 (
            .O(N__7654),
            .I(N__7651));
    LocalMux I__1337 (
            .O(N__7651),
            .I(N__7648));
    Span4Mux_h I__1336 (
            .O(N__7648),
            .I(N__7645));
    Span4Mux_v I__1335 (
            .O(N__7645),
            .I(N__7642));
    Odrv4 I__1334 (
            .O(N__7642),
            .I(\inst_midgetv_core.DAT_O_26 ));
    InMux I__1333 (
            .O(N__7639),
            .I(N__7634));
    InMux I__1332 (
            .O(N__7638),
            .I(N__7629));
    InMux I__1331 (
            .O(N__7637),
            .I(N__7629));
    LocalMux I__1330 (
            .O(N__7634),
            .I(N__7626));
    LocalMux I__1329 (
            .O(N__7629),
            .I(N__7623));
    Odrv4 I__1328 (
            .O(N__7626),
            .I(\inst_midgetv_core.ADR_O_26 ));
    Odrv4 I__1327 (
            .O(N__7623),
            .I(\inst_midgetv_core.ADR_O_26 ));
    CascadeMux I__1326 (
            .O(N__7618),
            .I(\inst_midgetv_core.Di_26_cascade_ ));
    CascadeMux I__1325 (
            .O(N__7615),
            .I(N__7612));
    InMux I__1324 (
            .O(N__7612),
            .I(N__7609));
    LocalMux I__1323 (
            .O(N__7609),
            .I(N__7606));
    Odrv4 I__1322 (
            .O(N__7606),
            .I(\inst_midgetv_core.inst_alu.genblk1_inst.A_26 ));
    CascadeMux I__1321 (
            .O(N__7603),
            .I(N__7600));
    InMux I__1320 (
            .O(N__7600),
            .I(N__7597));
    LocalMux I__1319 (
            .O(N__7597),
            .I(N__7594));
    Span4Mux_h I__1318 (
            .O(N__7594),
            .I(N__7591));
    Span4Mux_v I__1317 (
            .O(N__7591),
            .I(N__7588));
    Odrv4 I__1316 (
            .O(N__7588),
            .I(\inst_midgetv_core.DAT_O_27 ));
    CascadeMux I__1315 (
            .O(N__7585),
            .I(N__7582));
    InMux I__1314 (
            .O(N__7582),
            .I(N__7577));
    InMux I__1313 (
            .O(N__7581),
            .I(N__7572));
    InMux I__1312 (
            .O(N__7580),
            .I(N__7572));
    LocalMux I__1311 (
            .O(N__7577),
            .I(N__7569));
    LocalMux I__1310 (
            .O(N__7572),
            .I(N__7566));
    Odrv4 I__1309 (
            .O(N__7569),
            .I(\inst_midgetv_core.ADR_O_27 ));
    Odrv4 I__1308 (
            .O(N__7566),
            .I(\inst_midgetv_core.ADR_O_27 ));
    CascadeMux I__1307 (
            .O(N__7561),
            .I(\inst_midgetv_core.Di_27_cascade_ ));
    InMux I__1306 (
            .O(N__7558),
            .I(N__7555));
    LocalMux I__1305 (
            .O(N__7555),
            .I(N__7552));
    Odrv4 I__1304 (
            .O(N__7552),
            .I(\inst_midgetv_core.inst_alu.genblk1_inst.A_27 ));
    InMux I__1303 (
            .O(N__7549),
            .I(N__7546));
    LocalMux I__1302 (
            .O(N__7546),
            .I(N__7541));
    InMux I__1301 (
            .O(N__7545),
            .I(N__7538));
    InMux I__1300 (
            .O(N__7544),
            .I(N__7535));
    Span4Mux_h I__1299 (
            .O(N__7541),
            .I(N__7530));
    LocalMux I__1298 (
            .O(N__7538),
            .I(N__7530));
    LocalMux I__1297 (
            .O(N__7535),
            .I(\inst_midgetv_core.ADR_O_29 ));
    Odrv4 I__1296 (
            .O(N__7530),
            .I(\inst_midgetv_core.ADR_O_29 ));
    CascadeMux I__1295 (
            .O(N__7525),
            .I(N__7522));
    InMux I__1294 (
            .O(N__7522),
            .I(N__7519));
    LocalMux I__1293 (
            .O(N__7519),
            .I(N__7516));
    Span4Mux_h I__1292 (
            .O(N__7516),
            .I(N__7513));
    Span4Mux_v I__1291 (
            .O(N__7513),
            .I(N__7510));
    Span4Mux_v I__1290 (
            .O(N__7510),
            .I(N__7507));
    Odrv4 I__1289 (
            .O(N__7507),
            .I(\inst_midgetv_core.DAT_O_28 ));
    InMux I__1288 (
            .O(N__7504),
            .I(N__7501));
    LocalMux I__1287 (
            .O(N__7501),
            .I(N__7498));
    Span4Mux_h I__1286 (
            .O(N__7498),
            .I(N__7495));
    Span4Mux_h I__1285 (
            .O(N__7495),
            .I(N__7492));
    Odrv4 I__1284 (
            .O(N__7492),
            .I(\inst_midgetv_core.DAT_O_7 ));
    CascadeMux I__1283 (
            .O(N__7489),
            .I(\inst_midgetv_core.Di_7_cascade_ ));
    CascadeMux I__1282 (
            .O(N__7486),
            .I(N__7483));
    InMux I__1281 (
            .O(N__7483),
            .I(N__7480));
    LocalMux I__1280 (
            .O(N__7480),
            .I(N__7477));
    Odrv12 I__1279 (
            .O(N__7477),
            .I(\inst_midgetv_core.inst_alu.genblk1_inst.A_7 ));
    InMux I__1278 (
            .O(N__7474),
            .I(N__7471));
    LocalMux I__1277 (
            .O(N__7471),
            .I(N__7468));
    Span4Mux_v I__1276 (
            .O(N__7468),
            .I(N__7465));
    Span4Mux_h I__1275 (
            .O(N__7465),
            .I(N__7462));
    Odrv4 I__1274 (
            .O(N__7462),
            .I(\inst_midgetv_core.DAT_O_17 ));
    CascadeMux I__1273 (
            .O(N__7459),
            .I(\inst_midgetv_core.Di_17_cascade_ ));
    InMux I__1272 (
            .O(N__7456),
            .I(N__7453));
    LocalMux I__1271 (
            .O(N__7453),
            .I(N__7450));
    Sp12to4 I__1270 (
            .O(N__7450),
            .I(N__7447));
    Odrv12 I__1269 (
            .O(N__7447),
            .I(\inst_midgetv_core.inst_alu.genblk1_inst.A_17 ));
    InMux I__1268 (
            .O(N__7444),
            .I(N__7441));
    LocalMux I__1267 (
            .O(N__7441),
            .I(N__7438));
    Span4Mux_h I__1266 (
            .O(N__7438),
            .I(N__7435));
    Span4Mux_v I__1265 (
            .O(N__7435),
            .I(N__7432));
    Odrv4 I__1264 (
            .O(N__7432),
            .I(\inst_midgetv_core.DAT_O_18 ));
    InMux I__1263 (
            .O(N__7429),
            .I(N__7424));
    InMux I__1262 (
            .O(N__7428),
            .I(N__7419));
    InMux I__1261 (
            .O(N__7427),
            .I(N__7419));
    LocalMux I__1260 (
            .O(N__7424),
            .I(N__7416));
    LocalMux I__1259 (
            .O(N__7419),
            .I(N__7413));
    Odrv4 I__1258 (
            .O(N__7416),
            .I(\inst_midgetv_core.ADR_O_18 ));
    Odrv4 I__1257 (
            .O(N__7413),
            .I(\inst_midgetv_core.ADR_O_18 ));
    CascadeMux I__1256 (
            .O(N__7408),
            .I(\inst_midgetv_core.Di_18_cascade_ ));
    CascadeMux I__1255 (
            .O(N__7405),
            .I(N__7402));
    InMux I__1254 (
            .O(N__7402),
            .I(N__7399));
    LocalMux I__1253 (
            .O(N__7399),
            .I(N__7396));
    Odrv4 I__1252 (
            .O(N__7396),
            .I(\inst_midgetv_core.inst_alu.genblk1_inst.A_18 ));
    InMux I__1251 (
            .O(N__7393),
            .I(N__7390));
    LocalMux I__1250 (
            .O(N__7390),
            .I(N__7387));
    Span4Mux_h I__1249 (
            .O(N__7387),
            .I(N__7384));
    Odrv4 I__1248 (
            .O(N__7384),
            .I(\inst_midgetv_core.DAT_O_19 ));
    CascadeMux I__1247 (
            .O(N__7381),
            .I(N__7378));
    InMux I__1246 (
            .O(N__7378),
            .I(N__7373));
    InMux I__1245 (
            .O(N__7377),
            .I(N__7368));
    InMux I__1244 (
            .O(N__7376),
            .I(N__7368));
    LocalMux I__1243 (
            .O(N__7373),
            .I(N__7365));
    LocalMux I__1242 (
            .O(N__7368),
            .I(N__7362));
    Odrv4 I__1241 (
            .O(N__7365),
            .I(\inst_midgetv_core.ADR_O_19 ));
    Odrv4 I__1240 (
            .O(N__7362),
            .I(\inst_midgetv_core.ADR_O_19 ));
    CascadeMux I__1239 (
            .O(N__7357),
            .I(\inst_midgetv_core.Di_19_cascade_ ));
    InMux I__1238 (
            .O(N__7354),
            .I(N__7351));
    LocalMux I__1237 (
            .O(N__7351),
            .I(N__7348));
    Odrv4 I__1236 (
            .O(N__7348),
            .I(\inst_midgetv_core.inst_alu.genblk1_inst.A_19 ));
    InMux I__1235 (
            .O(N__7345),
            .I(N__7342));
    LocalMux I__1234 (
            .O(N__7342),
            .I(N__7339));
    Span4Mux_v I__1233 (
            .O(N__7339),
            .I(N__7336));
    Span4Mux_v I__1232 (
            .O(N__7336),
            .I(N__7333));
    Odrv4 I__1231 (
            .O(N__7333),
            .I(\inst_midgetv_core.DAT_O_20 ));
    InMux I__1230 (
            .O(N__7330),
            .I(N__7327));
    LocalMux I__1229 (
            .O(N__7327),
            .I(N__7322));
    InMux I__1228 (
            .O(N__7326),
            .I(N__7319));
    InMux I__1227 (
            .O(N__7325),
            .I(N__7316));
    Span4Mux_h I__1226 (
            .O(N__7322),
            .I(N__7309));
    LocalMux I__1225 (
            .O(N__7319),
            .I(N__7309));
    LocalMux I__1224 (
            .O(N__7316),
            .I(N__7309));
    Odrv4 I__1223 (
            .O(N__7309),
            .I(\inst_midgetv_core.ADR_O_21 ));
    CascadeMux I__1222 (
            .O(N__7306),
            .I(N__7303));
    InMux I__1221 (
            .O(N__7303),
            .I(N__7300));
    LocalMux I__1220 (
            .O(N__7300),
            .I(N__7297));
    Span4Mux_h I__1219 (
            .O(N__7297),
            .I(N__7294));
    Span4Mux_v I__1218 (
            .O(N__7294),
            .I(N__7291));
    Odrv4 I__1217 (
            .O(N__7291),
            .I(\inst_midgetv_core.DAT_O_12 ));
    CascadeMux I__1216 (
            .O(N__7288),
            .I(N__7285));
    InMux I__1215 (
            .O(N__7285),
            .I(N__7282));
    LocalMux I__1214 (
            .O(N__7282),
            .I(N__7277));
    InMux I__1213 (
            .O(N__7281),
            .I(N__7272));
    InMux I__1212 (
            .O(N__7280),
            .I(N__7272));
    Odrv4 I__1211 (
            .O(N__7277),
            .I(\inst_midgetv_core.ADR_O_12 ));
    LocalMux I__1210 (
            .O(N__7272),
            .I(\inst_midgetv_core.ADR_O_12 ));
    CascadeMux I__1209 (
            .O(N__7267),
            .I(\inst_midgetv_core.Di_12_cascade_ ));
    InMux I__1208 (
            .O(N__7264),
            .I(N__7261));
    LocalMux I__1207 (
            .O(N__7261),
            .I(N__7258));
    Span4Mux_h I__1206 (
            .O(N__7258),
            .I(N__7255));
    Odrv4 I__1205 (
            .O(N__7255),
            .I(\inst_midgetv_core.inst_alu.genblk1_inst.A_12 ));
    CascadeMux I__1204 (
            .O(N__7252),
            .I(N__7249));
    InMux I__1203 (
            .O(N__7249),
            .I(N__7246));
    LocalMux I__1202 (
            .O(N__7246),
            .I(N__7243));
    Span4Mux_h I__1201 (
            .O(N__7243),
            .I(N__7240));
    Sp12to4 I__1200 (
            .O(N__7240),
            .I(N__7237));
    Odrv12 I__1199 (
            .O(N__7237),
            .I(\inst_midgetv_core.DAT_O_29 ));
    CascadeMux I__1198 (
            .O(N__7234),
            .I(\inst_midgetv_core.Di_29_cascade_ ));
    CascadeMux I__1197 (
            .O(N__7231),
            .I(N__7228));
    InMux I__1196 (
            .O(N__7228),
            .I(N__7225));
    LocalMux I__1195 (
            .O(N__7225),
            .I(N__7222));
    Span4Mux_v I__1194 (
            .O(N__7222),
            .I(N__7219));
    Odrv4 I__1193 (
            .O(N__7219),
            .I(\inst_midgetv_core.inst_alu.genblk1_inst.A_29 ));
    CascadeMux I__1192 (
            .O(N__7216),
            .I(N__7213));
    InMux I__1191 (
            .O(N__7213),
            .I(N__7210));
    LocalMux I__1190 (
            .O(N__7210),
            .I(N__7207));
    Span4Mux_v I__1189 (
            .O(N__7207),
            .I(N__7204));
    Span4Mux_v I__1188 (
            .O(N__7204),
            .I(N__7201));
    Span4Mux_v I__1187 (
            .O(N__7201),
            .I(N__7198));
    Odrv4 I__1186 (
            .O(N__7198),
            .I(\inst_midgetv_core.DAT_O_30 ));
    CascadeMux I__1185 (
            .O(N__7195),
            .I(N__7192));
    InMux I__1184 (
            .O(N__7192),
            .I(N__7189));
    LocalMux I__1183 (
            .O(N__7189),
            .I(N__7184));
    InMux I__1182 (
            .O(N__7188),
            .I(N__7179));
    InMux I__1181 (
            .O(N__7187),
            .I(N__7179));
    Odrv4 I__1180 (
            .O(N__7184),
            .I(\inst_midgetv_core.ADR_O_30 ));
    LocalMux I__1179 (
            .O(N__7179),
            .I(\inst_midgetv_core.ADR_O_30 ));
    CascadeMux I__1178 (
            .O(N__7174),
            .I(\inst_midgetv_core.Di_30_cascade_ ));
    InMux I__1177 (
            .O(N__7171),
            .I(N__7168));
    LocalMux I__1176 (
            .O(N__7168),
            .I(N__7165));
    Span4Mux_h I__1175 (
            .O(N__7165),
            .I(N__7162));
    Odrv4 I__1174 (
            .O(N__7162),
            .I(\inst_midgetv_core.inst_alu.genblk1_inst.A_30 ));
    InMux I__1173 (
            .O(N__7159),
            .I(N__7156));
    LocalMux I__1172 (
            .O(N__7156),
            .I(N__7153));
    Span4Mux_h I__1171 (
            .O(N__7153),
            .I(N__7150));
    Span4Mux_h I__1170 (
            .O(N__7150),
            .I(N__7147));
    Odrv4 I__1169 (
            .O(N__7147),
            .I(\inst_midgetv_core.sra_msb ));
    CascadeMux I__1168 (
            .O(N__7144),
            .I(N__7139));
    InMux I__1167 (
            .O(N__7143),
            .I(N__7132));
    InMux I__1166 (
            .O(N__7142),
            .I(N__7132));
    InMux I__1165 (
            .O(N__7139),
            .I(N__7132));
    LocalMux I__1164 (
            .O(N__7132),
            .I(N__7128));
    CascadeMux I__1163 (
            .O(N__7131),
            .I(N__7123));
    Span4Mux_h I__1162 (
            .O(N__7128),
            .I(N__7120));
    InMux I__1161 (
            .O(N__7127),
            .I(N__7115));
    InMux I__1160 (
            .O(N__7126),
            .I(N__7115));
    InMux I__1159 (
            .O(N__7123),
            .I(N__7112));
    Odrv4 I__1158 (
            .O(N__7120),
            .I(\inst_midgetv_core.ADR_O_31 ));
    LocalMux I__1157 (
            .O(N__7115),
            .I(\inst_midgetv_core.ADR_O_31 ));
    LocalMux I__1156 (
            .O(N__7112),
            .I(\inst_midgetv_core.ADR_O_31 ));
    CascadeMux I__1155 (
            .O(N__7105),
            .I(\inst_midgetv_core.Di_31_cascade_ ));
    InMux I__1154 (
            .O(N__7102),
            .I(N__7093));
    InMux I__1153 (
            .O(N__7101),
            .I(N__7093));
    InMux I__1152 (
            .O(N__7100),
            .I(N__7093));
    LocalMux I__1151 (
            .O(N__7093),
            .I(N__7090));
    Span4Mux_h I__1150 (
            .O(N__7090),
            .I(N__7087));
    Odrv4 I__1149 (
            .O(N__7087),
            .I(\inst_midgetv_core.A31 ));
    CascadeMux I__1148 (
            .O(N__7084),
            .I(\inst_midgetv_core.Di_6_cascade_ ));
    InMux I__1147 (
            .O(N__7081),
            .I(N__7078));
    LocalMux I__1146 (
            .O(N__7078),
            .I(N__7075));
    Span4Mux_h I__1145 (
            .O(N__7075),
            .I(N__7072));
    Odrv4 I__1144 (
            .O(N__7072),
            .I(\inst_midgetv_core.inst_alu.genblk1_inst.A_6 ));
    InMux I__1143 (
            .O(N__7069),
            .I(N__7066));
    LocalMux I__1142 (
            .O(N__7066),
            .I(N__7063));
    Span4Mux_h I__1141 (
            .O(N__7063),
            .I(N__7060));
    Span4Mux_v I__1140 (
            .O(N__7060),
            .I(N__7057));
    Odrv4 I__1139 (
            .O(N__7057),
            .I(\inst_midgetv_core.DAT_O_8 ));
    CascadeMux I__1138 (
            .O(N__7054),
            .I(\inst_midgetv_core.Di_8_cascade_ ));
    CascadeMux I__1137 (
            .O(N__7051),
            .I(N__7048));
    InMux I__1136 (
            .O(N__7048),
            .I(N__7045));
    LocalMux I__1135 (
            .O(N__7045),
            .I(N__7042));
    Span4Mux_h I__1134 (
            .O(N__7042),
            .I(N__7039));
    Odrv4 I__1133 (
            .O(N__7039),
            .I(\inst_midgetv_core.inst_alu.genblk1_inst.A_8 ));
    CascadeMux I__1132 (
            .O(N__7036),
            .I(N__7033));
    InMux I__1131 (
            .O(N__7033),
            .I(N__7030));
    LocalMux I__1130 (
            .O(N__7030),
            .I(N__7027));
    Span4Mux_h I__1129 (
            .O(N__7027),
            .I(N__7024));
    Odrv4 I__1128 (
            .O(N__7024),
            .I(\inst_midgetv_core.DAT_O_10 ));
    CascadeMux I__1127 (
            .O(N__7021),
            .I(\inst_midgetv_core.Di_10_cascade_ ));
    CascadeMux I__1126 (
            .O(N__7018),
            .I(N__7015));
    InMux I__1125 (
            .O(N__7015),
            .I(N__7012));
    LocalMux I__1124 (
            .O(N__7012),
            .I(N__7009));
    Span4Mux_h I__1123 (
            .O(N__7009),
            .I(N__7006));
    Odrv4 I__1122 (
            .O(N__7006),
            .I(\inst_midgetv_core.inst_alu.genblk1_inst.A_10 ));
    CascadeMux I__1121 (
            .O(N__7003),
            .I(N__7000));
    InMux I__1120 (
            .O(N__7000),
            .I(N__6997));
    LocalMux I__1119 (
            .O(N__6997),
            .I(N__6994));
    Span4Mux_v I__1118 (
            .O(N__6994),
            .I(N__6991));
    Odrv4 I__1117 (
            .O(N__6991),
            .I(\inst_midgetv_core.DAT_O_11 ));
    CascadeMux I__1116 (
            .O(N__6988),
            .I(\inst_midgetv_core.Di_11_cascade_ ));
    InMux I__1115 (
            .O(N__6985),
            .I(N__6982));
    LocalMux I__1114 (
            .O(N__6982),
            .I(N__6979));
    Span4Mux_h I__1113 (
            .O(N__6979),
            .I(N__6976));
    Odrv4 I__1112 (
            .O(N__6976),
            .I(\inst_midgetv_core.inst_alu.genblk1_inst.A_11 ));
    InMux I__1111 (
            .O(N__6973),
            .I(N__6970));
    LocalMux I__1110 (
            .O(N__6970),
            .I(N__6966));
    InMux I__1109 (
            .O(N__6969),
            .I(N__6963));
    Span4Mux_h I__1108 (
            .O(N__6966),
            .I(N__6958));
    LocalMux I__1107 (
            .O(N__6963),
            .I(N__6955));
    InMux I__1106 (
            .O(N__6962),
            .I(N__6950));
    InMux I__1105 (
            .O(N__6961),
            .I(N__6950));
    Odrv4 I__1104 (
            .O(N__6958),
            .I(\inst_midgetv_core.ADR_O_10 ));
    Odrv4 I__1103 (
            .O(N__6955),
            .I(\inst_midgetv_core.ADR_O_10 ));
    LocalMux I__1102 (
            .O(N__6950),
            .I(\inst_midgetv_core.ADR_O_10 ));
    CascadeMux I__1101 (
            .O(N__6943),
            .I(N__6940));
    InMux I__1100 (
            .O(N__6940),
            .I(N__6937));
    LocalMux I__1099 (
            .O(N__6937),
            .I(N__6934));
    Span4Mux_h I__1098 (
            .O(N__6934),
            .I(N__6931));
    Odrv4 I__1097 (
            .O(N__6931),
            .I(\inst_midgetv_core.DAT_O_9 ));
    CascadeMux I__1096 (
            .O(N__6928),
            .I(\inst_midgetv_core.Di_9_cascade_ ));
    InMux I__1095 (
            .O(N__6925),
            .I(N__6921));
    InMux I__1094 (
            .O(N__6924),
            .I(N__6918));
    LocalMux I__1093 (
            .O(N__6921),
            .I(N__6915));
    LocalMux I__1092 (
            .O(N__6918),
            .I(N__6910));
    Span4Mux_h I__1091 (
            .O(N__6915),
            .I(N__6907));
    InMux I__1090 (
            .O(N__6914),
            .I(N__6904));
    InMux I__1089 (
            .O(N__6913),
            .I(N__6901));
    Odrv12 I__1088 (
            .O(N__6910),
            .I(\inst_midgetv_core.ADR_O_9 ));
    Odrv4 I__1087 (
            .O(N__6907),
            .I(\inst_midgetv_core.ADR_O_9 ));
    LocalMux I__1086 (
            .O(N__6904),
            .I(\inst_midgetv_core.ADR_O_9 ));
    LocalMux I__1085 (
            .O(N__6901),
            .I(\inst_midgetv_core.ADR_O_9 ));
    CascadeMux I__1084 (
            .O(N__6892),
            .I(N__6889));
    InMux I__1083 (
            .O(N__6889),
            .I(N__6886));
    LocalMux I__1082 (
            .O(N__6886),
            .I(N__6883));
    Span4Mux_v I__1081 (
            .O(N__6883),
            .I(N__6880));
    Odrv4 I__1080 (
            .O(N__6880),
            .I(\inst_midgetv_core.inst_alu.genblk1_inst.A_9 ));
    CascadeMux I__1079 (
            .O(N__6877),
            .I(\inst_midgetv_core.Di_2_cascade_ ));
    InMux I__1078 (
            .O(N__6874),
            .I(N__6871));
    LocalMux I__1077 (
            .O(N__6871),
            .I(N__6868));
    Span4Mux_h I__1076 (
            .O(N__6868),
            .I(N__6865));
    Odrv4 I__1075 (
            .O(N__6865),
            .I(\inst_midgetv_core.inst_alu.genblk1_inst.A_2 ));
    CascadeMux I__1074 (
            .O(N__6862),
            .I(N__6858));
    IoInMux I__1073 (
            .O(N__6861),
            .I(N__6855));
    InMux I__1072 (
            .O(N__6858),
            .I(N__6852));
    LocalMux I__1071 (
            .O(N__6855),
            .I(N__6849));
    LocalMux I__1070 (
            .O(N__6852),
            .I(N__6846));
    Span12Mux_s5_v I__1069 (
            .O(N__6849),
            .I(N__6843));
    Span4Mux_h I__1068 (
            .O(N__6846),
            .I(N__6840));
    Odrv12 I__1067 (
            .O(N__6843),
            .I(DAT_O_3));
    Odrv4 I__1066 (
            .O(N__6840),
            .I(DAT_O_3));
    CascadeMux I__1065 (
            .O(N__6835),
            .I(\inst_midgetv_core.Di_3_cascade_ ));
    InMux I__1064 (
            .O(N__6832),
            .I(N__6829));
    LocalMux I__1063 (
            .O(N__6829),
            .I(N__6826));
    Span4Mux_h I__1062 (
            .O(N__6826),
            .I(N__6823));
    Odrv4 I__1061 (
            .O(N__6823),
            .I(\inst_midgetv_core.inst_alu.genblk1_inst.A_3 ));
    CascadeMux I__1060 (
            .O(N__6820),
            .I(N__6817));
    InMux I__1059 (
            .O(N__6817),
            .I(N__6814));
    LocalMux I__1058 (
            .O(N__6814),
            .I(N__6811));
    Span4Mux_h I__1057 (
            .O(N__6811),
            .I(N__6808));
    Odrv4 I__1056 (
            .O(N__6808),
            .I(\inst_midgetv_core.DAT_O_4 ));
    CascadeMux I__1055 (
            .O(N__6805),
            .I(\inst_midgetv_core.Di_4_cascade_ ));
    InMux I__1054 (
            .O(N__6802),
            .I(N__6799));
    LocalMux I__1053 (
            .O(N__6799),
            .I(N__6796));
    Span4Mux_h I__1052 (
            .O(N__6796),
            .I(N__6793));
    Odrv4 I__1051 (
            .O(N__6793),
            .I(\inst_midgetv_core.inst_alu.genblk1_inst.A_4 ));
    InMux I__1050 (
            .O(N__6790),
            .I(N__6787));
    LocalMux I__1049 (
            .O(N__6787),
            .I(N__6784));
    Span4Mux_v I__1048 (
            .O(N__6784),
            .I(N__6781));
    Odrv4 I__1047 (
            .O(N__6781),
            .I(\inst_midgetv_core.DAT_O_5 ));
    CascadeMux I__1046 (
            .O(N__6778),
            .I(\inst_midgetv_core.Di_5_cascade_ ));
    InMux I__1045 (
            .O(N__6775),
            .I(N__6772));
    LocalMux I__1044 (
            .O(N__6772),
            .I(N__6769));
    Span4Mux_v I__1043 (
            .O(N__6769),
            .I(N__6766));
    Odrv4 I__1042 (
            .O(N__6766),
            .I(\inst_midgetv_core.inst_alu.genblk1_inst.A_5 ));
    CascadeMux I__1041 (
            .O(N__6763),
            .I(N__6760));
    InMux I__1040 (
            .O(N__6760),
            .I(N__6757));
    LocalMux I__1039 (
            .O(N__6757),
            .I(N__6754));
    Span4Mux_h I__1038 (
            .O(N__6754),
            .I(N__6751));
    Odrv4 I__1037 (
            .O(N__6751),
            .I(\inst_midgetv_core.DAT_O_6 ));
    InMux I__1036 (
            .O(N__6748),
            .I(N__6745));
    LocalMux I__1035 (
            .O(N__6745),
            .I(N__6742));
    Span4Mux_v I__1034 (
            .O(N__6742),
            .I(N__6739));
    Odrv4 I__1033 (
            .O(N__6739),
            .I(\inst_midgetv_core.sa43 ));
    CEMux I__1032 (
            .O(N__6736),
            .I(N__6733));
    LocalMux I__1031 (
            .O(N__6733),
            .I(N__6730));
    Span4Mux_v I__1030 (
            .O(N__6730),
            .I(N__6727));
    Span4Mux_v I__1029 (
            .O(N__6727),
            .I(N__6724));
    Odrv4 I__1028 (
            .O(N__6724),
            .I(\inst_midgetv_core.inst_progressctrl.n2764 ));
    SRMux I__1027 (
            .O(N__6721),
            .I(N__6718));
    LocalMux I__1026 (
            .O(N__6718),
            .I(N__6715));
    Span4Mux_h I__1025 (
            .O(N__6715),
            .I(N__6712));
    Span4Mux_v I__1024 (
            .O(N__6712),
            .I(N__6709));
    Span4Mux_h I__1023 (
            .O(N__6709),
            .I(N__6705));
    InMux I__1022 (
            .O(N__6708),
            .I(N__6702));
    Odrv4 I__1021 (
            .O(N__6705),
            .I(\inst_midgetv_core.inst_progressctrl.ctrlreg_we_N_84 ));
    LocalMux I__1020 (
            .O(N__6702),
            .I(\inst_midgetv_core.inst_progressctrl.ctrlreg_we_N_84 ));
    InMux I__1019 (
            .O(N__6697),
            .I(N__6691));
    InMux I__1018 (
            .O(N__6696),
            .I(N__6691));
    LocalMux I__1017 (
            .O(N__6691),
            .I(N__6688));
    Span4Mux_h I__1016 (
            .O(N__6688),
            .I(N__6685));
    Odrv4 I__1015 (
            .O(N__6685),
            .I(\inst_midgetv_core.sa14 ));
    SRMux I__1014 (
            .O(N__6682),
            .I(N__6675));
    SRMux I__1013 (
            .O(N__6681),
            .I(N__6672));
    SRMux I__1012 (
            .O(N__6680),
            .I(N__6669));
    SRMux I__1011 (
            .O(N__6679),
            .I(N__6666));
    SRMux I__1010 (
            .O(N__6678),
            .I(N__6663));
    LocalMux I__1009 (
            .O(N__6675),
            .I(N__6660));
    LocalMux I__1008 (
            .O(N__6672),
            .I(N__6655));
    LocalMux I__1007 (
            .O(N__6669),
            .I(N__6655));
    LocalMux I__1006 (
            .O(N__6666),
            .I(N__6652));
    LocalMux I__1005 (
            .O(N__6663),
            .I(N__6649));
    Span4Mux_v I__1004 (
            .O(N__6660),
            .I(N__6646));
    Span4Mux_v I__1003 (
            .O(N__6655),
            .I(N__6639));
    Span4Mux_v I__1002 (
            .O(N__6652),
            .I(N__6639));
    Span4Mux_h I__1001 (
            .O(N__6649),
            .I(N__6639));
    Odrv4 I__1000 (
            .O(N__6646),
            .I(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_nsa14_or_nCORERUNNING ));
    Odrv4 I__999 (
            .O(N__6639),
            .I(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_nsa14_or_nCORERUNNING ));
    IoInMux I__998 (
            .O(N__6634),
            .I(N__6630));
    IoInMux I__997 (
            .O(N__6633),
            .I(N__6627));
    LocalMux I__996 (
            .O(N__6630),
            .I(N__6624));
    LocalMux I__995 (
            .O(N__6627),
            .I(N__6621));
    IoSpan4Mux I__994 (
            .O(N__6624),
            .I(N__6618));
    IoSpan4Mux I__993 (
            .O(N__6621),
            .I(N__6614));
    Span4Mux_s3_v I__992 (
            .O(N__6618),
            .I(N__6611));
    InMux I__991 (
            .O(N__6617),
            .I(N__6608));
    Sp12to4 I__990 (
            .O(N__6614),
            .I(N__6605));
    Span4Mux_v I__989 (
            .O(N__6611),
            .I(N__6602));
    LocalMux I__988 (
            .O(N__6608),
            .I(N__6599));
    Span12Mux_s9_v I__987 (
            .O(N__6605),
            .I(N__6596));
    Span4Mux_v I__986 (
            .O(N__6602),
            .I(N__6591));
    Span4Mux_h I__985 (
            .O(N__6599),
            .I(N__6591));
    Odrv12 I__984 (
            .O(N__6596),
            .I(DAT_O_0));
    Odrv4 I__983 (
            .O(N__6591),
            .I(DAT_O_0));
    InMux I__982 (
            .O(N__6586),
            .I(N__6583));
    LocalMux I__981 (
            .O(N__6583),
            .I(\inst_midgetv_core.INSTR_0 ));
    InMux I__980 (
            .O(N__6580),
            .I(N__6576));
    InMux I__979 (
            .O(N__6579),
            .I(N__6573));
    LocalMux I__978 (
            .O(N__6576),
            .I(\inst_midgetv_core.ADR_O_0 ));
    LocalMux I__977 (
            .O(N__6573),
            .I(\inst_midgetv_core.ADR_O_0 ));
    CascadeMux I__976 (
            .O(N__6568),
            .I(\inst_midgetv_core.Di_0_cascade_ ));
    CascadeMux I__975 (
            .O(N__6565),
            .I(N__6562));
    InMux I__974 (
            .O(N__6562),
            .I(N__6559));
    LocalMux I__973 (
            .O(N__6559),
            .I(N__6556));
    Span4Mux_h I__972 (
            .O(N__6556),
            .I(N__6553));
    Odrv4 I__971 (
            .O(N__6553),
            .I(\inst_midgetv_core.inst_alu.genblk1_inst.A_0 ));
    IoInMux I__970 (
            .O(N__6550),
            .I(N__6547));
    LocalMux I__969 (
            .O(N__6547),
            .I(N__6544));
    Span4Mux_s2_v I__968 (
            .O(N__6544),
            .I(N__6541));
    Span4Mux_v I__967 (
            .O(N__6541),
            .I(N__6537));
    InMux I__966 (
            .O(N__6540),
            .I(N__6534));
    Span4Mux_v I__965 (
            .O(N__6537),
            .I(N__6531));
    LocalMux I__964 (
            .O(N__6534),
            .I(N__6528));
    Span4Mux_v I__963 (
            .O(N__6531),
            .I(N__6525));
    Span4Mux_h I__962 (
            .O(N__6528),
            .I(N__6522));
    Odrv4 I__961 (
            .O(N__6525),
            .I(DAT_O_1));
    Odrv4 I__960 (
            .O(N__6522),
            .I(DAT_O_1));
    CascadeMux I__959 (
            .O(N__6517),
            .I(N__6514));
    InMux I__958 (
            .O(N__6514),
            .I(N__6511));
    LocalMux I__957 (
            .O(N__6511),
            .I(\inst_midgetv_core.INSTR_1 ));
    CascadeMux I__956 (
            .O(N__6508),
            .I(\inst_midgetv_core.Di_1_cascade_ ));
    CascadeMux I__955 (
            .O(N__6505),
            .I(N__6500));
    InMux I__954 (
            .O(N__6504),
            .I(N__6497));
    InMux I__953 (
            .O(N__6503),
            .I(N__6492));
    InMux I__952 (
            .O(N__6500),
            .I(N__6492));
    LocalMux I__951 (
            .O(N__6497),
            .I(\inst_midgetv_core.ADR_O_1 ));
    LocalMux I__950 (
            .O(N__6492),
            .I(\inst_midgetv_core.ADR_O_1 ));
    InMux I__949 (
            .O(N__6487),
            .I(N__6484));
    LocalMux I__948 (
            .O(N__6484),
            .I(N__6481));
    Span4Mux_v I__947 (
            .O(N__6481),
            .I(N__6478));
    Odrv4 I__946 (
            .O(N__6478),
            .I(\inst_midgetv_core.inst_alu.genblk1_inst.A_1 ));
    InMux I__945 (
            .O(N__6475),
            .I(N__6472));
    LocalMux I__944 (
            .O(N__6472),
            .I(N__6467));
    InMux I__943 (
            .O(N__6471),
            .I(N__6462));
    InMux I__942 (
            .O(N__6470),
            .I(N__6462));
    Span4Mux_h I__941 (
            .O(N__6467),
            .I(N__6457));
    LocalMux I__940 (
            .O(N__6462),
            .I(N__6457));
    Odrv4 I__939 (
            .O(N__6457),
            .I(\inst_midgetv_core.ADR_O_23 ));
    CascadeMux I__938 (
            .O(N__6454),
            .I(\inst_midgetv_core.Di_23_cascade_ ));
    CascadeMux I__937 (
            .O(N__6451),
            .I(N__6448));
    InMux I__936 (
            .O(N__6448),
            .I(N__6445));
    LocalMux I__935 (
            .O(N__6445),
            .I(\inst_midgetv_core.inst_alu.genblk1_inst.A_23 ));
    CascadeMux I__934 (
            .O(N__6442),
            .I(N__6439));
    InMux I__933 (
            .O(N__6439),
            .I(N__6436));
    LocalMux I__932 (
            .O(N__6436),
            .I(N__6433));
    Span4Mux_h I__931 (
            .O(N__6433),
            .I(N__6430));
    Span4Mux_v I__930 (
            .O(N__6430),
            .I(N__6427));
    Span4Mux_v I__929 (
            .O(N__6427),
            .I(N__6424));
    Odrv4 I__928 (
            .O(N__6424),
            .I(\inst_midgetv_core.DAT_O_24 ));
    InMux I__927 (
            .O(N__6421),
            .I(N__6416));
    InMux I__926 (
            .O(N__6420),
            .I(N__6411));
    InMux I__925 (
            .O(N__6419),
            .I(N__6411));
    LocalMux I__924 (
            .O(N__6416),
            .I(N__6406));
    LocalMux I__923 (
            .O(N__6411),
            .I(N__6406));
    Span4Mux_v I__922 (
            .O(N__6406),
            .I(N__6403));
    Odrv4 I__921 (
            .O(N__6403),
            .I(\inst_midgetv_core.ADR_O_24 ));
    CascadeMux I__920 (
            .O(N__6400),
            .I(\inst_midgetv_core.Di_24_cascade_ ));
    CascadeMux I__919 (
            .O(N__6397),
            .I(N__6394));
    InMux I__918 (
            .O(N__6394),
            .I(N__6391));
    LocalMux I__917 (
            .O(N__6391),
            .I(\inst_midgetv_core.inst_alu.genblk1_inst.A_24 ));
    CascadeMux I__916 (
            .O(N__6388),
            .I(N__6385));
    CascadeBuf I__915 (
            .O(N__6385),
            .I(N__6382));
    CascadeMux I__914 (
            .O(N__6382),
            .I(N__6379));
    CascadeBuf I__913 (
            .O(N__6379),
            .I(N__6376));
    CascadeMux I__912 (
            .O(N__6376),
            .I(N__6373));
    CascadeBuf I__911 (
            .O(N__6373),
            .I(N__6370));
    CascadeMux I__910 (
            .O(N__6370),
            .I(N__6367));
    CascadeBuf I__909 (
            .O(N__6367),
            .I(N__6364));
    CascadeMux I__908 (
            .O(N__6364),
            .I(N__6361));
    CascadeBuf I__907 (
            .O(N__6361),
            .I(N__6358));
    CascadeMux I__906 (
            .O(N__6358),
            .I(N__6355));
    CascadeBuf I__905 (
            .O(N__6355),
            .I(N__6352));
    CascadeMux I__904 (
            .O(N__6352),
            .I(N__6349));
    CascadeBuf I__903 (
            .O(N__6349),
            .I(N__6346));
    CascadeMux I__902 (
            .O(N__6346),
            .I(N__6343));
    InMux I__901 (
            .O(N__6343),
            .I(N__6340));
    LocalMux I__900 (
            .O(N__6340),
            .I(N__6337));
    Span4Mux_s2_v I__899 (
            .O(N__6337),
            .I(N__6334));
    Span4Mux_h I__898 (
            .O(N__6334),
            .I(N__6331));
    Span4Mux_v I__897 (
            .O(N__6331),
            .I(N__6328));
    Odrv4 I__896 (
            .O(N__6328),
            .I(\inst_midgetv_core.Wai_7 ));
    CascadeMux I__895 (
            .O(N__6325),
            .I(N__6322));
    CascadeBuf I__894 (
            .O(N__6322),
            .I(N__6319));
    CascadeMux I__893 (
            .O(N__6319),
            .I(N__6316));
    InMux I__892 (
            .O(N__6316),
            .I(N__6313));
    LocalMux I__891 (
            .O(N__6313),
            .I(N__6309));
    InMux I__890 (
            .O(N__6312),
            .I(N__6306));
    Span4Mux_h I__889 (
            .O(N__6309),
            .I(N__6303));
    LocalMux I__888 (
            .O(N__6306),
            .I(\inst_midgetv_core.mostofminx0 ));
    Odrv4 I__887 (
            .O(N__6303),
            .I(\inst_midgetv_core.mostofminx0 ));
    CascadeMux I__886 (
            .O(N__6298),
            .I(N__6295));
    InMux I__885 (
            .O(N__6295),
            .I(N__6292));
    LocalMux I__884 (
            .O(N__6292),
            .I(N__6289));
    Span4Mux_h I__883 (
            .O(N__6289),
            .I(N__6286));
    Odrv4 I__882 (
            .O(N__6286),
            .I(\inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.instr0100 ));
    CascadeMux I__881 (
            .O(N__6283),
            .I(N__6280));
    InMux I__880 (
            .O(N__6280),
            .I(N__6277));
    LocalMux I__879 (
            .O(N__6277),
            .I(N__6274));
    Span4Mux_h I__878 (
            .O(N__6274),
            .I(N__6271));
    Odrv4 I__877 (
            .O(N__6271),
            .I(\inst_midgetv_core.rinx_4 ));
    CascadeMux I__876 (
            .O(N__6268),
            .I(N__6265));
    CascadeBuf I__875 (
            .O(N__6265),
            .I(N__6262));
    CascadeMux I__874 (
            .O(N__6262),
            .I(N__6258));
    InMux I__873 (
            .O(N__6261),
            .I(N__6255));
    InMux I__872 (
            .O(N__6258),
            .I(N__6252));
    LocalMux I__871 (
            .O(N__6255),
            .I(N__6249));
    LocalMux I__870 (
            .O(N__6252),
            .I(N__6246));
    Odrv4 I__869 (
            .O(N__6249),
            .I(\inst_midgetv_core.minx_4 ));
    Odrv12 I__868 (
            .O(N__6246),
            .I(\inst_midgetv_core.minx_4 ));
    CascadeMux I__867 (
            .O(N__6241),
            .I(N__6238));
    InMux I__866 (
            .O(N__6238),
            .I(N__6235));
    LocalMux I__865 (
            .O(N__6235),
            .I(N__6232));
    Span4Mux_v I__864 (
            .O(N__6232),
            .I(N__6229));
    Odrv4 I__863 (
            .O(N__6229),
            .I(\inst_midgetv_core.rinx_2 ));
    CascadeMux I__862 (
            .O(N__6226),
            .I(N__6223));
    CascadeBuf I__861 (
            .O(N__6223),
            .I(N__6220));
    CascadeMux I__860 (
            .O(N__6220),
            .I(N__6217));
    InMux I__859 (
            .O(N__6217),
            .I(N__6213));
    InMux I__858 (
            .O(N__6216),
            .I(N__6210));
    LocalMux I__857 (
            .O(N__6213),
            .I(N__6207));
    LocalMux I__856 (
            .O(N__6210),
            .I(\inst_midgetv_core.minx_2 ));
    Odrv12 I__855 (
            .O(N__6207),
            .I(\inst_midgetv_core.minx_2 ));
    InMux I__854 (
            .O(N__6202),
            .I(N__6199));
    LocalMux I__853 (
            .O(N__6199),
            .I(N__6196));
    Span4Mux_h I__852 (
            .O(N__6196),
            .I(N__6193));
    Span4Mux_h I__851 (
            .O(N__6193),
            .I(N__6189));
    InMux I__850 (
            .O(N__6192),
            .I(N__6186));
    Span4Mux_v I__849 (
            .O(N__6189),
            .I(N__6183));
    LocalMux I__848 (
            .O(N__6186),
            .I(N__6180));
    Span4Mux_v I__847 (
            .O(N__6183),
            .I(N__6175));
    Span4Mux_h I__846 (
            .O(N__6180),
            .I(N__6175));
    Odrv4 I__845 (
            .O(N__6175),
            .I(\inst_midgetv_core.B_29 ));
    InMux I__844 (
            .O(N__6172),
            .I(N__6162));
    InMux I__843 (
            .O(N__6171),
            .I(N__6147));
    InMux I__842 (
            .O(N__6170),
            .I(N__6147));
    InMux I__841 (
            .O(N__6169),
            .I(N__6147));
    InMux I__840 (
            .O(N__6168),
            .I(N__6147));
    InMux I__839 (
            .O(N__6167),
            .I(N__6147));
    InMux I__838 (
            .O(N__6166),
            .I(N__6147));
    InMux I__837 (
            .O(N__6165),
            .I(N__6147));
    LocalMux I__836 (
            .O(N__6162),
            .I(N__6138));
    LocalMux I__835 (
            .O(N__6147),
            .I(N__6138));
    InMux I__834 (
            .O(N__6146),
            .I(N__6129));
    InMux I__833 (
            .O(N__6145),
            .I(N__6129));
    InMux I__832 (
            .O(N__6144),
            .I(N__6129));
    InMux I__831 (
            .O(N__6143),
            .I(N__6129));
    Span4Mux_h I__830 (
            .O(N__6138),
            .I(N__6126));
    LocalMux I__829 (
            .O(N__6129),
            .I(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_sa13 ));
    Odrv4 I__828 (
            .O(N__6126),
            .I(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_sa13 ));
    InMux I__827 (
            .O(N__6121),
            .I(N__6112));
    InMux I__826 (
            .O(N__6120),
            .I(N__6112));
    InMux I__825 (
            .O(N__6119),
            .I(N__6112));
    LocalMux I__824 (
            .O(N__6112),
            .I(N__6109));
    Span4Mux_v I__823 (
            .O(N__6109),
            .I(N__6106));
    Span4Mux_v I__822 (
            .O(N__6106),
            .I(N__6103));
    Span4Mux_v I__821 (
            .O(N__6103),
            .I(N__6100));
    Span4Mux_v I__820 (
            .O(N__6100),
            .I(N__6097));
    IoSpan4Mux I__819 (
            .O(N__6097),
            .I(N__6094));
    Span4Mux_s3_v I__818 (
            .O(N__6094),
            .I(N__6085));
    CascadeMux I__817 (
            .O(N__6093),
            .I(N__6082));
    CascadeMux I__816 (
            .O(N__6092),
            .I(N__6079));
    CascadeMux I__815 (
            .O(N__6091),
            .I(N__6075));
    CascadeMux I__814 (
            .O(N__6090),
            .I(N__6072));
    CascadeMux I__813 (
            .O(N__6089),
            .I(N__6069));
    CascadeMux I__812 (
            .O(N__6088),
            .I(N__6066));
    Span4Mux_v I__811 (
            .O(N__6085),
            .I(N__6058));
    InMux I__810 (
            .O(N__6082),
            .I(N__6046));
    InMux I__809 (
            .O(N__6079),
            .I(N__6046));
    InMux I__808 (
            .O(N__6078),
            .I(N__6046));
    InMux I__807 (
            .O(N__6075),
            .I(N__6046));
    InMux I__806 (
            .O(N__6072),
            .I(N__6037));
    InMux I__805 (
            .O(N__6069),
            .I(N__6037));
    InMux I__804 (
            .O(N__6066),
            .I(N__6037));
    InMux I__803 (
            .O(N__6065),
            .I(N__6037));
    CascadeMux I__802 (
            .O(N__6064),
            .I(N__6034));
    CascadeMux I__801 (
            .O(N__6063),
            .I(N__6031));
    CascadeMux I__800 (
            .O(N__6062),
            .I(N__6028));
    CascadeMux I__799 (
            .O(N__6061),
            .I(N__6025));
    Span4Mux_v I__798 (
            .O(N__6058),
            .I(N__6022));
    InMux I__797 (
            .O(N__6057),
            .I(N__6015));
    InMux I__796 (
            .O(N__6056),
            .I(N__6015));
    InMux I__795 (
            .O(N__6055),
            .I(N__6015));
    LocalMux I__794 (
            .O(N__6046),
            .I(N__6010));
    LocalMux I__793 (
            .O(N__6037),
            .I(N__6010));
    InMux I__792 (
            .O(N__6034),
            .I(N__6005));
    InMux I__791 (
            .O(N__6031),
            .I(N__6005));
    InMux I__790 (
            .O(N__6028),
            .I(N__6000));
    InMux I__789 (
            .O(N__6025),
            .I(N__6000));
    Span4Mux_v I__788 (
            .O(N__6022),
            .I(N__5997));
    LocalMux I__787 (
            .O(N__6015),
            .I(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_sa10 ));
    Odrv4 I__786 (
            .O(N__6010),
            .I(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_sa10 ));
    LocalMux I__785 (
            .O(N__6005),
            .I(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_sa10 ));
    LocalMux I__784 (
            .O(N__6000),
            .I(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_sa10 ));
    Odrv4 I__783 (
            .O(N__5997),
            .I(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_sa10 ));
    InMux I__782 (
            .O(N__5986),
            .I(bfn_14_19_0_));
    CascadeMux I__781 (
            .O(N__5983),
            .I(N__5980));
    InMux I__780 (
            .O(N__5980),
            .I(N__5977));
    LocalMux I__779 (
            .O(N__5977),
            .I(N__5974));
    Span4Mux_v I__778 (
            .O(N__5974),
            .I(N__5971));
    Span4Mux_h I__777 (
            .O(N__5971),
            .I(N__5968));
    Odrv4 I__776 (
            .O(N__5968),
            .I(\inst_midgetv_core.DAT_O_21 ));
    CascadeMux I__775 (
            .O(N__5965),
            .I(\inst_midgetv_core.Di_21_cascade_ ));
    CascadeMux I__774 (
            .O(N__5962),
            .I(N__5959));
    InMux I__773 (
            .O(N__5959),
            .I(N__5956));
    LocalMux I__772 (
            .O(N__5956),
            .I(\inst_midgetv_core.inst_alu.genblk1_inst.A_21 ));
    CascadeMux I__771 (
            .O(N__5953),
            .I(N__5950));
    InMux I__770 (
            .O(N__5950),
            .I(N__5947));
    LocalMux I__769 (
            .O(N__5947),
            .I(N__5944));
    Span4Mux_v I__768 (
            .O(N__5944),
            .I(N__5941));
    Span4Mux_h I__767 (
            .O(N__5941),
            .I(N__5938));
    Odrv4 I__766 (
            .O(N__5938),
            .I(\inst_midgetv_core.DAT_O_22 ));
    CascadeMux I__765 (
            .O(N__5935),
            .I(N__5932));
    InMux I__764 (
            .O(N__5932),
            .I(N__5927));
    InMux I__763 (
            .O(N__5931),
            .I(N__5922));
    InMux I__762 (
            .O(N__5930),
            .I(N__5922));
    LocalMux I__761 (
            .O(N__5927),
            .I(N__5917));
    LocalMux I__760 (
            .O(N__5922),
            .I(N__5917));
    Odrv4 I__759 (
            .O(N__5917),
            .I(\inst_midgetv_core.ADR_O_22 ));
    CascadeMux I__758 (
            .O(N__5914),
            .I(\inst_midgetv_core.Di_22_cascade_ ));
    InMux I__757 (
            .O(N__5911),
            .I(N__5908));
    LocalMux I__756 (
            .O(N__5908),
            .I(\inst_midgetv_core.inst_alu.genblk1_inst.A_22 ));
    CascadeMux I__755 (
            .O(N__5905),
            .I(N__5902));
    InMux I__754 (
            .O(N__5902),
            .I(N__5899));
    LocalMux I__753 (
            .O(N__5899),
            .I(N__5896));
    Span4Mux_v I__752 (
            .O(N__5896),
            .I(N__5893));
    Span4Mux_h I__751 (
            .O(N__5893),
            .I(N__5890));
    Odrv4 I__750 (
            .O(N__5890),
            .I(\inst_midgetv_core.DAT_O_23 ));
    InMux I__749 (
            .O(N__5887),
            .I(N__5884));
    LocalMux I__748 (
            .O(N__5884),
            .I(N__5880));
    InMux I__747 (
            .O(N__5883),
            .I(N__5877));
    Span4Mux_h I__746 (
            .O(N__5880),
            .I(N__5874));
    LocalMux I__745 (
            .O(N__5877),
            .I(N__5871));
    Span4Mux_h I__744 (
            .O(N__5874),
            .I(N__5868));
    Span4Mux_h I__743 (
            .O(N__5871),
            .I(N__5865));
    Span4Mux_v I__742 (
            .O(N__5868),
            .I(N__5862));
    Span4Mux_h I__741 (
            .O(N__5865),
            .I(N__5859));
    Odrv4 I__740 (
            .O(N__5862),
            .I(\inst_midgetv_core.B_21 ));
    Odrv4 I__739 (
            .O(N__5859),
            .I(\inst_midgetv_core.B_21 ));
    InMux I__738 (
            .O(N__5854),
            .I(N__5851));
    LocalMux I__737 (
            .O(N__5851),
            .I(N__5848));
    Span4Mux_h I__736 (
            .O(N__5848),
            .I(N__5844));
    InMux I__735 (
            .O(N__5847),
            .I(N__5841));
    Span4Mux_h I__734 (
            .O(N__5844),
            .I(N__5838));
    LocalMux I__733 (
            .O(N__5841),
            .I(N__5835));
    Span4Mux_v I__732 (
            .O(N__5838),
            .I(N__5830));
    Span4Mux_h I__731 (
            .O(N__5835),
            .I(N__5830));
    Odrv4 I__730 (
            .O(N__5830),
            .I(\inst_midgetv_core.B_22 ));
    InMux I__729 (
            .O(N__5827),
            .I(N__5824));
    LocalMux I__728 (
            .O(N__5824),
            .I(N__5821));
    Span4Mux_h I__727 (
            .O(N__5821),
            .I(N__5817));
    InMux I__726 (
            .O(N__5820),
            .I(N__5814));
    Span4Mux_h I__725 (
            .O(N__5817),
            .I(N__5811));
    LocalMux I__724 (
            .O(N__5814),
            .I(N__5808));
    Span4Mux_v I__723 (
            .O(N__5811),
            .I(N__5805));
    Span4Mux_v I__722 (
            .O(N__5808),
            .I(N__5802));
    Odrv4 I__721 (
            .O(N__5805),
            .I(\inst_midgetv_core.B_23 ));
    Odrv4 I__720 (
            .O(N__5802),
            .I(\inst_midgetv_core.B_23 ));
    InMux I__719 (
            .O(N__5797),
            .I(N__5793));
    CascadeMux I__718 (
            .O(N__5796),
            .I(N__5790));
    LocalMux I__717 (
            .O(N__5793),
            .I(N__5787));
    InMux I__716 (
            .O(N__5790),
            .I(N__5784));
    Span4Mux_h I__715 (
            .O(N__5787),
            .I(N__5781));
    LocalMux I__714 (
            .O(N__5784),
            .I(N__5778));
    Span4Mux_v I__713 (
            .O(N__5781),
            .I(N__5775));
    Span4Mux_h I__712 (
            .O(N__5778),
            .I(N__5772));
    Span4Mux_v I__711 (
            .O(N__5775),
            .I(N__5769));
    Sp12to4 I__710 (
            .O(N__5772),
            .I(N__5766));
    Odrv4 I__709 (
            .O(N__5769),
            .I(\inst_midgetv_core.B_24 ));
    Odrv12 I__708 (
            .O(N__5766),
            .I(\inst_midgetv_core.B_24 ));
    InMux I__707 (
            .O(N__5761),
            .I(N__5758));
    LocalMux I__706 (
            .O(N__5758),
            .I(N__5755));
    Span4Mux_v I__705 (
            .O(N__5755),
            .I(N__5751));
    InMux I__704 (
            .O(N__5754),
            .I(N__5748));
    Span4Mux_h I__703 (
            .O(N__5751),
            .I(N__5745));
    LocalMux I__702 (
            .O(N__5748),
            .I(N__5742));
    Span4Mux_v I__701 (
            .O(N__5745),
            .I(N__5739));
    Span4Mux_h I__700 (
            .O(N__5742),
            .I(N__5736));
    Odrv4 I__699 (
            .O(N__5739),
            .I(\inst_midgetv_core.B_25 ));
    Odrv4 I__698 (
            .O(N__5736),
            .I(\inst_midgetv_core.B_25 ));
    InMux I__697 (
            .O(N__5731),
            .I(N__5728));
    LocalMux I__696 (
            .O(N__5728),
            .I(N__5725));
    Span4Mux_h I__695 (
            .O(N__5725),
            .I(N__5721));
    InMux I__694 (
            .O(N__5724),
            .I(N__5718));
    Span4Mux_h I__693 (
            .O(N__5721),
            .I(N__5715));
    LocalMux I__692 (
            .O(N__5718),
            .I(N__5712));
    Span4Mux_v I__691 (
            .O(N__5715),
            .I(N__5709));
    Span4Mux_h I__690 (
            .O(N__5712),
            .I(N__5706));
    Odrv4 I__689 (
            .O(N__5709),
            .I(\inst_midgetv_core.B_26 ));
    Odrv4 I__688 (
            .O(N__5706),
            .I(\inst_midgetv_core.B_26 ));
    InMux I__687 (
            .O(N__5701),
            .I(N__5698));
    LocalMux I__686 (
            .O(N__5698),
            .I(N__5695));
    Span4Mux_h I__685 (
            .O(N__5695),
            .I(N__5691));
    CascadeMux I__684 (
            .O(N__5694),
            .I(N__5688));
    Span4Mux_h I__683 (
            .O(N__5691),
            .I(N__5685));
    InMux I__682 (
            .O(N__5688),
            .I(N__5682));
    Span4Mux_v I__681 (
            .O(N__5685),
            .I(N__5679));
    LocalMux I__680 (
            .O(N__5682),
            .I(N__5676));
    Odrv4 I__679 (
            .O(N__5679),
            .I(\inst_midgetv_core.B_27 ));
    Odrv4 I__678 (
            .O(N__5676),
            .I(\inst_midgetv_core.B_27 ));
    InMux I__677 (
            .O(N__5671),
            .I(N__5668));
    LocalMux I__676 (
            .O(N__5668),
            .I(N__5665));
    Span4Mux_h I__675 (
            .O(N__5665),
            .I(N__5662));
    Span4Mux_h I__674 (
            .O(N__5662),
            .I(N__5658));
    InMux I__673 (
            .O(N__5661),
            .I(N__5655));
    Span4Mux_v I__672 (
            .O(N__5658),
            .I(N__5652));
    LocalMux I__671 (
            .O(N__5655),
            .I(N__5649));
    Span4Mux_v I__670 (
            .O(N__5652),
            .I(N__5644));
    Span4Mux_h I__669 (
            .O(N__5649),
            .I(N__5644));
    Odrv4 I__668 (
            .O(N__5644),
            .I(\inst_midgetv_core.B_28 ));
    InMux I__667 (
            .O(N__5641),
            .I(N__5638));
    LocalMux I__666 (
            .O(N__5638),
            .I(N__5634));
    InMux I__665 (
            .O(N__5637),
            .I(N__5631));
    Span4Mux_v I__664 (
            .O(N__5634),
            .I(N__5628));
    LocalMux I__663 (
            .O(N__5631),
            .I(N__5625));
    Span4Mux_h I__662 (
            .O(N__5628),
            .I(N__5622));
    Span4Mux_h I__661 (
            .O(N__5625),
            .I(N__5619));
    Odrv4 I__660 (
            .O(N__5622),
            .I(\inst_midgetv_core.B_13 ));
    Odrv4 I__659 (
            .O(N__5619),
            .I(\inst_midgetv_core.B_13 ));
    InMux I__658 (
            .O(N__5614),
            .I(N__5611));
    LocalMux I__657 (
            .O(N__5611),
            .I(N__5607));
    InMux I__656 (
            .O(N__5610),
            .I(N__5604));
    Span4Mux_v I__655 (
            .O(N__5607),
            .I(N__5601));
    LocalMux I__654 (
            .O(N__5604),
            .I(N__5598));
    Span4Mux_h I__653 (
            .O(N__5601),
            .I(N__5595));
    Span4Mux_h I__652 (
            .O(N__5598),
            .I(N__5592));
    Odrv4 I__651 (
            .O(N__5595),
            .I(\inst_midgetv_core.B_14 ));
    Odrv4 I__650 (
            .O(N__5592),
            .I(\inst_midgetv_core.B_14 ));
    InMux I__649 (
            .O(N__5587),
            .I(N__5583));
    InMux I__648 (
            .O(N__5586),
            .I(N__5580));
    LocalMux I__647 (
            .O(N__5583),
            .I(N__5577));
    LocalMux I__646 (
            .O(N__5580),
            .I(N__5574));
    Span12Mux_h I__645 (
            .O(N__5577),
            .I(N__5571));
    Span4Mux_h I__644 (
            .O(N__5574),
            .I(N__5568));
    Odrv12 I__643 (
            .O(N__5571),
            .I(\inst_midgetv_core.B_15 ));
    Odrv4 I__642 (
            .O(N__5568),
            .I(\inst_midgetv_core.B_15 ));
    InMux I__641 (
            .O(N__5563),
            .I(N__5560));
    LocalMux I__640 (
            .O(N__5560),
            .I(N__5557));
    Span4Mux_h I__639 (
            .O(N__5557),
            .I(N__5553));
    InMux I__638 (
            .O(N__5556),
            .I(N__5550));
    Span4Mux_h I__637 (
            .O(N__5553),
            .I(N__5547));
    LocalMux I__636 (
            .O(N__5550),
            .I(N__5544));
    Span4Mux_v I__635 (
            .O(N__5547),
            .I(N__5541));
    Span4Mux_v I__634 (
            .O(N__5544),
            .I(N__5538));
    Odrv4 I__633 (
            .O(N__5541),
            .I(\inst_midgetv_core.B_16 ));
    Odrv4 I__632 (
            .O(N__5538),
            .I(\inst_midgetv_core.B_16 ));
    InMux I__631 (
            .O(N__5533),
            .I(N__5530));
    LocalMux I__630 (
            .O(N__5530),
            .I(N__5527));
    Span4Mux_v I__629 (
            .O(N__5527),
            .I(N__5523));
    InMux I__628 (
            .O(N__5526),
            .I(N__5520));
    Span4Mux_h I__627 (
            .O(N__5523),
            .I(N__5517));
    LocalMux I__626 (
            .O(N__5520),
            .I(N__5514));
    Span4Mux_v I__625 (
            .O(N__5517),
            .I(N__5511));
    Span4Mux_h I__624 (
            .O(N__5514),
            .I(N__5508));
    Odrv4 I__623 (
            .O(N__5511),
            .I(\inst_midgetv_core.B_17 ));
    Odrv4 I__622 (
            .O(N__5508),
            .I(\inst_midgetv_core.B_17 ));
    CascadeMux I__621 (
            .O(N__5503),
            .I(N__5500));
    InMux I__620 (
            .O(N__5500),
            .I(N__5496));
    InMux I__619 (
            .O(N__5499),
            .I(N__5493));
    LocalMux I__618 (
            .O(N__5496),
            .I(N__5490));
    LocalMux I__617 (
            .O(N__5493),
            .I(N__5487));
    Span4Mux_v I__616 (
            .O(N__5490),
            .I(N__5484));
    Span4Mux_v I__615 (
            .O(N__5487),
            .I(N__5479));
    Span4Mux_h I__614 (
            .O(N__5484),
            .I(N__5479));
    Span4Mux_h I__613 (
            .O(N__5479),
            .I(N__5476));
    Odrv4 I__612 (
            .O(N__5476),
            .I(\inst_midgetv_core.B_18 ));
    InMux I__611 (
            .O(N__5473),
            .I(N__5457));
    InMux I__610 (
            .O(N__5472),
            .I(N__5457));
    InMux I__609 (
            .O(N__5471),
            .I(N__5457));
    InMux I__608 (
            .O(N__5470),
            .I(N__5457));
    InMux I__607 (
            .O(N__5469),
            .I(N__5448));
    InMux I__606 (
            .O(N__5468),
            .I(N__5448));
    InMux I__605 (
            .O(N__5467),
            .I(N__5448));
    InMux I__604 (
            .O(N__5466),
            .I(N__5448));
    LocalMux I__603 (
            .O(N__5457),
            .I(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_sa13b ));
    LocalMux I__602 (
            .O(N__5448),
            .I(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_sa13b ));
    CascadeMux I__601 (
            .O(N__5443),
            .I(N__5435));
    CascadeMux I__600 (
            .O(N__5442),
            .I(N__5431));
    CascadeMux I__599 (
            .O(N__5441),
            .I(N__5428));
    CascadeMux I__598 (
            .O(N__5440),
            .I(N__5425));
    CascadeMux I__597 (
            .O(N__5439),
            .I(N__5422));
    InMux I__596 (
            .O(N__5438),
            .I(N__5416));
    InMux I__595 (
            .O(N__5435),
            .I(N__5416));
    InMux I__594 (
            .O(N__5434),
            .I(N__5411));
    InMux I__593 (
            .O(N__5431),
            .I(N__5411));
    InMux I__592 (
            .O(N__5428),
            .I(N__5408));
    InMux I__591 (
            .O(N__5425),
            .I(N__5401));
    InMux I__590 (
            .O(N__5422),
            .I(N__5401));
    InMux I__589 (
            .O(N__5421),
            .I(N__5401));
    LocalMux I__588 (
            .O(N__5416),
            .I(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_sa31 ));
    LocalMux I__587 (
            .O(N__5411),
            .I(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_sa31 ));
    LocalMux I__586 (
            .O(N__5408),
            .I(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_sa31 ));
    LocalMux I__585 (
            .O(N__5401),
            .I(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_sa31 ));
    InMux I__584 (
            .O(N__5392),
            .I(N__5388));
    CascadeMux I__583 (
            .O(N__5391),
            .I(N__5385));
    LocalMux I__582 (
            .O(N__5388),
            .I(N__5382));
    InMux I__581 (
            .O(N__5385),
            .I(N__5379));
    Span4Mux_h I__580 (
            .O(N__5382),
            .I(N__5376));
    LocalMux I__579 (
            .O(N__5379),
            .I(N__5373));
    Span4Mux_v I__578 (
            .O(N__5376),
            .I(N__5370));
    Span4Mux_h I__577 (
            .O(N__5373),
            .I(N__5367));
    Odrv4 I__576 (
            .O(N__5370),
            .I(\inst_midgetv_core.B_19 ));
    Odrv4 I__575 (
            .O(N__5367),
            .I(\inst_midgetv_core.B_19 ));
    InMux I__574 (
            .O(N__5362),
            .I(N__5359));
    LocalMux I__573 (
            .O(N__5359),
            .I(N__5356));
    Span4Mux_h I__572 (
            .O(N__5356),
            .I(N__5353));
    Span4Mux_h I__571 (
            .O(N__5353),
            .I(N__5349));
    InMux I__570 (
            .O(N__5352),
            .I(N__5346));
    Span4Mux_v I__569 (
            .O(N__5349),
            .I(N__5343));
    LocalMux I__568 (
            .O(N__5346),
            .I(N__5340));
    Odrv4 I__567 (
            .O(N__5343),
            .I(\inst_midgetv_core.B_20 ));
    Odrv4 I__566 (
            .O(N__5340),
            .I(\inst_midgetv_core.B_20 ));
    InMux I__565 (
            .O(N__5335),
            .I(N__5332));
    LocalMux I__564 (
            .O(N__5332),
            .I(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_imm4a ));
    InMux I__563 (
            .O(N__5329),
            .I(N__5326));
    LocalMux I__562 (
            .O(N__5326),
            .I(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_imm11b ));
    InMux I__561 (
            .O(N__5323),
            .I(N__5320));
    LocalMux I__560 (
            .O(N__5320),
            .I(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_imm11a ));
    InMux I__559 (
            .O(N__5317),
            .I(N__5314));
    LocalMux I__558 (
            .O(N__5314),
            .I(N__5310));
    CascadeMux I__557 (
            .O(N__5313),
            .I(N__5307));
    Span4Mux_v I__556 (
            .O(N__5310),
            .I(N__5304));
    InMux I__555 (
            .O(N__5307),
            .I(N__5301));
    Sp12to4 I__554 (
            .O(N__5304),
            .I(N__5298));
    LocalMux I__553 (
            .O(N__5301),
            .I(N__5295));
    Odrv12 I__552 (
            .O(N__5298),
            .I(\inst_midgetv_core.B_12 ));
    Odrv4 I__551 (
            .O(N__5295),
            .I(\inst_midgetv_core.B_12 ));
    CascadeMux I__550 (
            .O(N__5290),
            .I(N__5287));
    InMux I__549 (
            .O(N__5287),
            .I(N__5284));
    LocalMux I__548 (
            .O(N__5284),
            .I(\inst_midgetv_core.inst_ucodepc.n5608 ));
    InMux I__547 (
            .O(N__5281),
            .I(N__5278));
    LocalMux I__546 (
            .O(N__5278),
            .I(\inst_midgetv_core.inst_ucodepc.n5609 ));
    InMux I__545 (
            .O(N__5275),
            .I(N__5271));
    InMux I__544 (
            .O(N__5274),
            .I(N__5268));
    LocalMux I__543 (
            .O(N__5271),
            .I(\inst_midgetv_core.inst_cyclecnt.dbg_rccnt_0 ));
    LocalMux I__542 (
            .O(N__5268),
            .I(\inst_midgetv_core.inst_cyclecnt.dbg_rccnt_0 ));
    InMux I__541 (
            .O(N__5263),
            .I(N__5260));
    LocalMux I__540 (
            .O(N__5260),
            .I(N__5257));
    Span4Mux_v I__539 (
            .O(N__5257),
            .I(N__5254));
    Span4Mux_h I__538 (
            .O(N__5254),
            .I(N__5251));
    Span4Mux_h I__537 (
            .O(N__5251),
            .I(N__5248));
    Odrv4 I__536 (
            .O(N__5248),
            .I(\inst_midgetv_core.QQ_0 ));
    CascadeMux I__535 (
            .O(N__5245),
            .I(N__5241));
    InMux I__534 (
            .O(N__5244),
            .I(N__5236));
    InMux I__533 (
            .O(N__5241),
            .I(N__5236));
    LocalMux I__532 (
            .O(N__5236),
            .I(N__5233));
    Span4Mux_h I__531 (
            .O(N__5233),
            .I(N__5230));
    Span4Mux_h I__530 (
            .O(N__5230),
            .I(N__5227));
    Odrv4 I__529 (
            .O(N__5227),
            .I(\inst_midgetv_core.s_cyclecnt_1 ));
    CascadeMux I__528 (
            .O(N__5224),
            .I(N__5220));
    CascadeMux I__527 (
            .O(N__5223),
            .I(N__5217));
    InMux I__526 (
            .O(N__5220),
            .I(N__5214));
    InMux I__525 (
            .O(N__5217),
            .I(N__5211));
    LocalMux I__524 (
            .O(N__5214),
            .I(\inst_midgetv_core.inst_cyclecnt.dbg_rccnt_1 ));
    LocalMux I__523 (
            .O(N__5211),
            .I(\inst_midgetv_core.inst_cyclecnt.dbg_rccnt_1 ));
    CascadeMux I__522 (
            .O(N__5206),
            .I(N__5203));
    InMux I__521 (
            .O(N__5203),
            .I(N__5200));
    LocalMux I__520 (
            .O(N__5200),
            .I(N__5197));
    Span4Mux_h I__519 (
            .O(N__5197),
            .I(N__5194));
    Odrv4 I__518 (
            .O(N__5194),
            .I(\inst_midgetv_core.QQ_1 ));
    CascadeMux I__517 (
            .O(N__5191),
            .I(N__5188));
    InMux I__516 (
            .O(N__5188),
            .I(N__5184));
    InMux I__515 (
            .O(N__5187),
            .I(N__5181));
    LocalMux I__514 (
            .O(N__5184),
            .I(\inst_midgetv_core.inst_cyclecnt.dbg_rccnt_5 ));
    LocalMux I__513 (
            .O(N__5181),
            .I(\inst_midgetv_core.inst_cyclecnt.dbg_rccnt_5 ));
    CascadeMux I__512 (
            .O(N__5176),
            .I(N__5173));
    InMux I__511 (
            .O(N__5173),
            .I(N__5170));
    LocalMux I__510 (
            .O(N__5170),
            .I(N__5167));
    Span4Mux_v I__509 (
            .O(N__5167),
            .I(N__5164));
    Odrv4 I__508 (
            .O(N__5164),
            .I(\inst_midgetv_core.QQ_5 ));
    InMux I__507 (
            .O(N__5161),
            .I(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_28 ));
    InMux I__506 (
            .O(N__5158),
            .I(bfn_13_21_0_));
    InMux I__505 (
            .O(N__5155),
            .I(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_30 ));
    InMux I__504 (
            .O(N__5152),
            .I(N__5133));
    InMux I__503 (
            .O(N__5151),
            .I(N__5133));
    InMux I__502 (
            .O(N__5150),
            .I(N__5133));
    InMux I__501 (
            .O(N__5149),
            .I(N__5133));
    InMux I__500 (
            .O(N__5148),
            .I(N__5130));
    InMux I__499 (
            .O(N__5147),
            .I(N__5121));
    InMux I__498 (
            .O(N__5146),
            .I(N__5121));
    InMux I__497 (
            .O(N__5145),
            .I(N__5121));
    InMux I__496 (
            .O(N__5144),
            .I(N__5121));
    InMux I__495 (
            .O(N__5143),
            .I(N__5100));
    InMux I__494 (
            .O(N__5142),
            .I(N__5100));
    LocalMux I__493 (
            .O(N__5133),
            .I(N__5092));
    LocalMux I__492 (
            .O(N__5130),
            .I(N__5087));
    LocalMux I__491 (
            .O(N__5121),
            .I(N__5087));
    InMux I__490 (
            .O(N__5120),
            .I(N__5078));
    InMux I__489 (
            .O(N__5119),
            .I(N__5078));
    InMux I__488 (
            .O(N__5118),
            .I(N__5078));
    InMux I__487 (
            .O(N__5117),
            .I(N__5078));
    InMux I__486 (
            .O(N__5116),
            .I(N__5069));
    InMux I__485 (
            .O(N__5115),
            .I(N__5069));
    InMux I__484 (
            .O(N__5114),
            .I(N__5069));
    InMux I__483 (
            .O(N__5113),
            .I(N__5069));
    InMux I__482 (
            .O(N__5112),
            .I(N__5060));
    InMux I__481 (
            .O(N__5111),
            .I(N__5060));
    InMux I__480 (
            .O(N__5110),
            .I(N__5060));
    InMux I__479 (
            .O(N__5109),
            .I(N__5060));
    InMux I__478 (
            .O(N__5108),
            .I(N__5051));
    InMux I__477 (
            .O(N__5107),
            .I(N__5051));
    InMux I__476 (
            .O(N__5106),
            .I(N__5051));
    InMux I__475 (
            .O(N__5105),
            .I(N__5051));
    LocalMux I__474 (
            .O(N__5100),
            .I(N__5048));
    InMux I__473 (
            .O(N__5099),
            .I(N__5043));
    InMux I__472 (
            .O(N__5098),
            .I(N__5043));
    InMux I__471 (
            .O(N__5097),
            .I(N__5036));
    InMux I__470 (
            .O(N__5096),
            .I(N__5036));
    InMux I__469 (
            .O(N__5095),
            .I(N__5036));
    Span4Mux_v I__468 (
            .O(N__5092),
            .I(N__5033));
    Span4Mux_v I__467 (
            .O(N__5087),
            .I(N__5030));
    LocalMux I__466 (
            .O(N__5078),
            .I(N__5025));
    LocalMux I__465 (
            .O(N__5069),
            .I(N__5025));
    LocalMux I__464 (
            .O(N__5060),
            .I(N__5020));
    LocalMux I__463 (
            .O(N__5051),
            .I(N__5020));
    Span4Mux_h I__462 (
            .O(N__5048),
            .I(N__5017));
    LocalMux I__461 (
            .O(N__5043),
            .I(N__5012));
    LocalMux I__460 (
            .O(N__5036),
            .I(N__5012));
    Span4Mux_h I__459 (
            .O(N__5033),
            .I(N__5009));
    Span4Mux_h I__458 (
            .O(N__5030),
            .I(N__5004));
    Span4Mux_h I__457 (
            .O(N__5025),
            .I(N__5004));
    Span4Mux_h I__456 (
            .O(N__5020),
            .I(N__5001));
    Span4Mux_h I__455 (
            .O(N__5017),
            .I(N__4998));
    Span4Mux_h I__454 (
            .O(N__5012),
            .I(N__4995));
    Span4Mux_v I__453 (
            .O(N__5009),
            .I(N__4990));
    Span4Mux_v I__452 (
            .O(N__5004),
            .I(N__4990));
    Span4Mux_h I__451 (
            .O(N__5001),
            .I(N__4987));
    Span4Mux_v I__450 (
            .O(N__4998),
            .I(N__4982));
    Span4Mux_h I__449 (
            .O(N__4995),
            .I(N__4982));
    Span4Mux_v I__448 (
            .O(N__4990),
            .I(N__4979));
    Span4Mux_v I__447 (
            .O(N__4987),
            .I(N__4976));
    Span4Mux_v I__446 (
            .O(N__4982),
            .I(N__4973));
    Odrv4 I__445 (
            .O(N__4979),
            .I(\inst_midgetv_core.s_alu_2 ));
    Odrv4 I__444 (
            .O(N__4976),
            .I(\inst_midgetv_core.s_alu_2 ));
    Odrv4 I__443 (
            .O(N__4973),
            .I(\inst_midgetv_core.s_alu_2 ));
    InMux I__442 (
            .O(N__4966),
            .I(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_31 ));
    InMux I__441 (
            .O(N__4963),
            .I(\inst_midgetv_core.alu_carryout ));
    CascadeMux I__440 (
            .O(N__4960),
            .I(N__4957));
    InMux I__439 (
            .O(N__4957),
            .I(N__4954));
    LocalMux I__438 (
            .O(N__4954),
            .I(\inst_midgetv_core.inst_condcode.n2 ));
    CascadeMux I__437 (
            .O(N__4951),
            .I(N__4947));
    CascadeMux I__436 (
            .O(N__4950),
            .I(N__4944));
    InMux I__435 (
            .O(N__4947),
            .I(N__4941));
    InMux I__434 (
            .O(N__4944),
            .I(N__4938));
    LocalMux I__433 (
            .O(N__4941),
            .I(\inst_midgetv_core.alu_carryout_THRU_CO ));
    LocalMux I__432 (
            .O(N__4938),
            .I(\inst_midgetv_core.alu_carryout_THRU_CO ));
    InMux I__431 (
            .O(N__4933),
            .I(N__4930));
    LocalMux I__430 (
            .O(N__4930),
            .I(\inst_midgetv_core.inst_condcode.n6 ));
    InMux I__429 (
            .O(N__4927),
            .I(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_19 ));
    InMux I__428 (
            .O(N__4924),
            .I(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_20 ));
    InMux I__427 (
            .O(N__4921),
            .I(bfn_13_20_0_));
    InMux I__426 (
            .O(N__4918),
            .I(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_22 ));
    InMux I__425 (
            .O(N__4915),
            .I(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_23 ));
    InMux I__424 (
            .O(N__4912),
            .I(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_24 ));
    InMux I__423 (
            .O(N__4909),
            .I(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_25 ));
    InMux I__422 (
            .O(N__4906),
            .I(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_26 ));
    InMux I__421 (
            .O(N__4903),
            .I(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_27 ));
    InMux I__420 (
            .O(N__4900),
            .I(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_10 ));
    InMux I__419 (
            .O(N__4897),
            .I(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_11 ));
    InMux I__418 (
            .O(N__4894),
            .I(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_12 ));
    InMux I__417 (
            .O(N__4891),
            .I(bfn_13_19_0_));
    InMux I__416 (
            .O(N__4888),
            .I(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_14 ));
    InMux I__415 (
            .O(N__4885),
            .I(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_15 ));
    InMux I__414 (
            .O(N__4882),
            .I(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_16 ));
    InMux I__413 (
            .O(N__4879),
            .I(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_17 ));
    InMux I__412 (
            .O(N__4876),
            .I(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_18 ));
    CascadeMux I__411 (
            .O(N__4873),
            .I(N__4870));
    InMux I__410 (
            .O(N__4870),
            .I(N__4867));
    LocalMux I__409 (
            .O(N__4867),
            .I(N__4864));
    Odrv4 I__408 (
            .O(N__4864),
            .I(\inst_midgetv_core.QQ_2 ));
    InMux I__407 (
            .O(N__4861),
            .I(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_2 ));
    CascadeMux I__406 (
            .O(N__4858),
            .I(N__4855));
    InMux I__405 (
            .O(N__4855),
            .I(N__4852));
    LocalMux I__404 (
            .O(N__4852),
            .I(N__4849));
    Odrv4 I__403 (
            .O(N__4849),
            .I(\inst_midgetv_core.QQ_3 ));
    InMux I__402 (
            .O(N__4846),
            .I(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_3 ));
    CascadeMux I__401 (
            .O(N__4843),
            .I(N__4840));
    InMux I__400 (
            .O(N__4840),
            .I(N__4837));
    LocalMux I__399 (
            .O(N__4837),
            .I(N__4834));
    Odrv4 I__398 (
            .O(N__4834),
            .I(\inst_midgetv_core.QQ_4 ));
    InMux I__397 (
            .O(N__4831),
            .I(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_4 ));
    InMux I__396 (
            .O(N__4828),
            .I(bfn_13_18_0_));
    CascadeMux I__395 (
            .O(N__4825),
            .I(N__4822));
    InMux I__394 (
            .O(N__4822),
            .I(N__4819));
    LocalMux I__393 (
            .O(N__4819),
            .I(N__4816));
    Odrv12 I__392 (
            .O(N__4816),
            .I(\inst_midgetv_core.QQ_6 ));
    InMux I__391 (
            .O(N__4813),
            .I(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_6 ));
    InMux I__390 (
            .O(N__4810),
            .I(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_7 ));
    InMux I__389 (
            .O(N__4807),
            .I(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_8 ));
    InMux I__388 (
            .O(N__4804),
            .I(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_9 ));
    InMux I__387 (
            .O(N__4801),
            .I(N__4798));
    LocalMux I__386 (
            .O(N__4798),
            .I(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_sa07h ));
    InMux I__385 (
            .O(N__4795),
            .I(\inst_midgetv_core.alu_carryin ));
    InMux I__384 (
            .O(N__4792),
            .I(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_1 ));
    InMux I__383 (
            .O(N__4789),
            .I(bfn_13_15_0_));
    CascadeMux I__382 (
            .O(N__4786),
            .I(N__4783));
    InMux I__381 (
            .O(N__4783),
            .I(N__4779));
    InMux I__380 (
            .O(N__4782),
            .I(N__4776));
    LocalMux I__379 (
            .O(N__4779),
            .I(\inst_midgetv_core.inst_cyclecnt.dbg_rccnt_6 ));
    LocalMux I__378 (
            .O(N__4776),
            .I(\inst_midgetv_core.inst_cyclecnt.dbg_rccnt_6 ));
    CascadeMux I__377 (
            .O(N__4771),
            .I(N__4768));
    InMux I__376 (
            .O(N__4768),
            .I(N__4764));
    InMux I__375 (
            .O(N__4767),
            .I(N__4761));
    LocalMux I__374 (
            .O(N__4764),
            .I(\inst_midgetv_core.inst_cyclecnt.dbg_rccnt_3 ));
    LocalMux I__373 (
            .O(N__4761),
            .I(\inst_midgetv_core.inst_cyclecnt.dbg_rccnt_3 ));
    InMux I__372 (
            .O(N__4756),
            .I(N__4752));
    InMux I__371 (
            .O(N__4755),
            .I(N__4749));
    LocalMux I__370 (
            .O(N__4752),
            .I(N__4746));
    LocalMux I__369 (
            .O(N__4749),
            .I(\inst_midgetv_core.inst_cyclecnt.dbg_rccnt_2 ));
    Odrv4 I__368 (
            .O(N__4746),
            .I(\inst_midgetv_core.inst_cyclecnt.dbg_rccnt_2 ));
    InMux I__367 (
            .O(N__4741),
            .I(N__4737));
    InMux I__366 (
            .O(N__4740),
            .I(N__4734));
    LocalMux I__365 (
            .O(N__4737),
            .I(\inst_midgetv_core.inst_cyclecnt.dbg_rccnt_4 ));
    LocalMux I__364 (
            .O(N__4734),
            .I(\inst_midgetv_core.inst_cyclecnt.dbg_rccnt_4 ));
    InMux I__363 (
            .O(N__4729),
            .I(N__4726));
    LocalMux I__362 (
            .O(N__4726),
            .I(\inst_midgetv_core.inst_ucodepc.n28 ));
    InMux I__361 (
            .O(N__4723),
            .I(N__4720));
    LocalMux I__360 (
            .O(N__4720),
            .I(\inst_midgetv_core.inst_ucodepc.n5610 ));
    InMux I__359 (
            .O(N__4717),
            .I(\inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_ccntcy_0 ));
    InMux I__358 (
            .O(N__4714),
            .I(\inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_ccntcy_1 ));
    InMux I__357 (
            .O(N__4711),
            .I(\inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_ccntcy_2 ));
    InMux I__356 (
            .O(N__4708),
            .I(\inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_ccntcy_3 ));
    InMux I__355 (
            .O(N__4705),
            .I(\inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_ccntcy_4 ));
    InMux I__354 (
            .O(N__4702),
            .I(\inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_ccntcy_5 ));
    InMux I__353 (
            .O(N__4699),
            .I(\inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_ccntcy_6 ));
    CascadeMux I__352 (
            .O(N__4696),
            .I(N__4693));
    CascadeBuf I__351 (
            .O(N__4693),
            .I(N__4690));
    CascadeMux I__350 (
            .O(N__4690),
            .I(N__4687));
    CascadeBuf I__349 (
            .O(N__4687),
            .I(N__4684));
    CascadeMux I__348 (
            .O(N__4684),
            .I(N__4681));
    CascadeBuf I__347 (
            .O(N__4681),
            .I(N__4678));
    CascadeMux I__346 (
            .O(N__4678),
            .I(N__4675));
    CascadeBuf I__345 (
            .O(N__4675),
            .I(N__4672));
    CascadeMux I__344 (
            .O(N__4672),
            .I(N__4669));
    CascadeBuf I__343 (
            .O(N__4669),
            .I(N__4666));
    CascadeMux I__342 (
            .O(N__4666),
            .I(N__4663));
    CascadeBuf I__341 (
            .O(N__4663),
            .I(N__4660));
    CascadeMux I__340 (
            .O(N__4660),
            .I(N__4657));
    CascadeBuf I__339 (
            .O(N__4657),
            .I(N__4654));
    CascadeMux I__338 (
            .O(N__4654),
            .I(N__4651));
    InMux I__337 (
            .O(N__4651),
            .I(N__4648));
    LocalMux I__336 (
            .O(N__4648),
            .I(N__4645));
    Span4Mux_s3_v I__335 (
            .O(N__4645),
            .I(N__4642));
    Span4Mux_v I__334 (
            .O(N__4642),
            .I(N__4639));
    Sp12to4 I__333 (
            .O(N__4639),
            .I(N__4636));
    Span12Mux_h I__332 (
            .O(N__4636),
            .I(N__4633));
    Odrv12 I__331 (
            .O(N__4633),
            .I(\inst_midgetv_core.Wai_8 ));
    defparam IN_MUX_bfv_17_15_0_.C_INIT=2'b00;
    ICE_CARRY_IN_MUX IN_MUX_bfv_17_15_0_ (
            .carryinitin(),
            .carryinitout(bfn_17_15_0_));
    defparam IN_MUX_bfv_18_17_0_.C_INIT=2'b01;
    ICE_CARRY_IN_MUX IN_MUX_bfv_18_17_0_ (
            .carryinitin(),
            .carryinitout(bfn_18_17_0_));
    defparam IN_MUX_bfv_14_15_0_.C_INIT=2'b00;
    ICE_CARRY_IN_MUX IN_MUX_bfv_14_15_0_ (
            .carryinitin(),
            .carryinitout(bfn_14_15_0_));
    defparam IN_MUX_bfv_14_16_0_.C_INIT=2'b10;
    ICE_CARRY_IN_MUX IN_MUX_bfv_14_16_0_ (
            .carryinitin(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy8 ),
            .carryinitout(bfn_14_16_0_));
    defparam IN_MUX_bfv_14_17_0_.C_INIT=2'b10;
    ICE_CARRY_IN_MUX IN_MUX_bfv_14_17_0_ (
            .carryinitin(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy16 ),
            .carryinitout(bfn_14_17_0_));
    defparam IN_MUX_bfv_14_18_0_.C_INIT=2'b10;
    ICE_CARRY_IN_MUX IN_MUX_bfv_14_18_0_ (
            .carryinitin(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy24 ),
            .carryinitout(bfn_14_18_0_));
    defparam IN_MUX_bfv_14_19_0_.C_INIT=2'b10;
    ICE_CARRY_IN_MUX IN_MUX_bfv_14_19_0_ (
            .carryinitin(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy32 ),
            .carryinitout(bfn_14_19_0_));
    defparam IN_MUX_bfv_13_14_0_.C_INIT=2'b01;
    ICE_CARRY_IN_MUX IN_MUX_bfv_13_14_0_ (
            .carryinitin(),
            .carryinitout(bfn_13_14_0_));
    defparam IN_MUX_bfv_13_15_0_.C_INIT=2'b10;
    ICE_CARRY_IN_MUX IN_MUX_bfv_13_15_0_ (
            .carryinitin(\inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_ccntcy_7 ),
            .carryinitout(bfn_13_15_0_));
    defparam IN_MUX_bfv_13_17_0_.C_INIT=2'b01;
    ICE_CARRY_IN_MUX IN_MUX_bfv_13_17_0_ (
            .carryinitin(),
            .carryinitout(bfn_13_17_0_));
    defparam IN_MUX_bfv_13_18_0_.C_INIT=2'b10;
    ICE_CARRY_IN_MUX IN_MUX_bfv_13_18_0_ (
            .carryinitin(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_5_THRU_CRY_0_THRU_CO ),
            .carryinitout(bfn_13_18_0_));
    defparam IN_MUX_bfv_13_19_0_.C_INIT=2'b10;
    ICE_CARRY_IN_MUX IN_MUX_bfv_13_19_0_ (
            .carryinitin(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_13 ),
            .carryinitout(bfn_13_19_0_));
    defparam IN_MUX_bfv_13_20_0_.C_INIT=2'b10;
    ICE_CARRY_IN_MUX IN_MUX_bfv_13_20_0_ (
            .carryinitin(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_21 ),
            .carryinitout(bfn_13_20_0_));
    defparam IN_MUX_bfv_13_21_0_.C_INIT=2'b10;
    ICE_CARRY_IN_MUX IN_MUX_bfv_13_21_0_ (
            .carryinitin(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_29 ),
            .carryinitout(bfn_13_21_0_));
    VCC VCC (
            .Y(VCCG0));
    GND GND (
            .Y(GNDG0));
    GND GND_Inst (
            .Y(_gnd_net_));
    defparam \inst_midgetv_core.inst_wai.genblk1_genblk1_L_93_LC_12_17_6 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_wai.genblk1_genblk1_L_93_LC_12_17_6 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_wai.genblk1_genblk1_L_93_LC_12_17_6 .LUT_INIT=16'b0001000100000000;
    LogicCell40 \inst_midgetv_core.inst_wai.genblk1_genblk1_L_93_LC_12_17_6  (
            .in0(N__13357),
            .in1(N__13441),
            .in2(_gnd_net_),
            .in3(N__6973),
            .lcout(\inst_midgetv_core.Wai_8 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_ucodepc.i3947_4_lut_LC_13_13_0 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_ucodepc.i3947_4_lut_LC_13_13_0 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_ucodepc.i3947_4_lut_LC_13_13_0 .LUT_INIT=16'b1110101011000000;
    LogicCell40 \inst_midgetv_core.inst_ucodepc.i3947_4_lut_LC_13_13_0  (
            .in0(N__11853),
            .in1(N__8236),
            .in2(N__11830),
            .in3(N__12751),
            .lcout(\inst_midgetv_core.inst_ucodepc.n5610 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_ucodepc.i35_3_lut_LC_13_13_1 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_ucodepc.i35_3_lut_LC_13_13_1 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_ucodepc.i35_3_lut_LC_13_13_1 .LUT_INIT=16'b1110111001000100;
    LogicCell40 \inst_midgetv_core.inst_ucodepc.i35_3_lut_LC_13_13_1  (
            .in0(N__8908),
            .in1(N__9757),
            .in2(_gnd_net_),
            .in3(N__12473),
            .lcout(\inst_midgetv_core.inst_ucodepc.n28 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_ucodepc.i3962_4_lut_LC_13_13_2 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_ucodepc.i3962_4_lut_LC_13_13_2 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_ucodepc.i3962_4_lut_LC_13_13_2 .LUT_INIT=16'b1111111111101010;
    LogicCell40 \inst_midgetv_core.inst_ucodepc.i3962_4_lut_LC_13_13_2  (
            .in0(N__4729),
            .in1(N__11418),
            .in2(N__11875),
            .in3(N__4723),
            .lcout(\inst_midgetv_core.inst_ucodepc.n5608 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_r_rcntlsb_0_LC_13_14_0 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_r_rcntlsb_0_LC_13_14_0 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_r_rcntlsb_0_LC_13_14_0 .LUT_INIT=16'b1011101100000000;
    LogicCell40 \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_r_rcntlsb_0_LC_13_14_0  (
            .in0(N__11189),
            .in1(N__5275),
            .in2(_gnd_net_),
            .in3(N__12991),
            .lcout(\inst_midgetv_core.inst_cyclecnt.dbg_rccnt_0 ),
            .ltout(),
            .carryin(bfn_13_14_0_),
            .carryout(\inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_ccntcy_0 ),
            .clk(N__13806),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_r_rcntlsb_1_LC_13_14_1 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_r_rcntlsb_1_LC_13_14_1 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_r_rcntlsb_1_LC_13_14_1 .LUT_INIT=16'b0000001000100000;
    LogicCell40 \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_r_rcntlsb_1_LC_13_14_1  (
            .in0(N__12992),
            .in1(N__11179),
            .in2(N__5224),
            .in3(N__4717),
            .lcout(\inst_midgetv_core.inst_cyclecnt.dbg_rccnt_1 ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_ccntcy_0 ),
            .carryout(\inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_ccntcy_1 ),
            .clk(N__13806),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_r_rcntlsb_2_LC_13_14_2 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_r_rcntlsb_2_LC_13_14_2 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_r_rcntlsb_2_LC_13_14_2 .LUT_INIT=16'b0000001000001000;
    LogicCell40 \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_r_rcntlsb_2_LC_13_14_2  (
            .in0(N__12996),
            .in1(N__4755),
            .in2(N__11197),
            .in3(N__4714),
            .lcout(\inst_midgetv_core.inst_cyclecnt.dbg_rccnt_2 ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_ccntcy_1 ),
            .carryout(\inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_ccntcy_2 ),
            .clk(N__13806),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_r_rcntlsb_3_LC_13_14_3 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_r_rcntlsb_3_LC_13_14_3 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_r_rcntlsb_3_LC_13_14_3 .LUT_INIT=16'b0000001000100000;
    LogicCell40 \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_r_rcntlsb_3_LC_13_14_3  (
            .in0(N__12993),
            .in1(N__11183),
            .in2(N__4771),
            .in3(N__4711),
            .lcout(\inst_midgetv_core.inst_cyclecnt.dbg_rccnt_3 ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_ccntcy_2 ),
            .carryout(\inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_ccntcy_3 ),
            .clk(N__13806),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_r_rcntlsb_4_LC_13_14_4 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_r_rcntlsb_4_LC_13_14_4 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_r_rcntlsb_4_LC_13_14_4 .LUT_INIT=16'b0000001000001000;
    LogicCell40 \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_r_rcntlsb_4_LC_13_14_4  (
            .in0(N__12997),
            .in1(N__4741),
            .in2(N__11198),
            .in3(N__4708),
            .lcout(\inst_midgetv_core.inst_cyclecnt.dbg_rccnt_4 ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_ccntcy_3 ),
            .carryout(\inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_ccntcy_4 ),
            .clk(N__13806),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_r_rcntlsb_5_LC_13_14_5 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_r_rcntlsb_5_LC_13_14_5 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_r_rcntlsb_5_LC_13_14_5 .LUT_INIT=16'b0000001000100000;
    LogicCell40 \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_r_rcntlsb_5_LC_13_14_5  (
            .in0(N__12994),
            .in1(N__11187),
            .in2(N__5191),
            .in3(N__4705),
            .lcout(\inst_midgetv_core.inst_cyclecnt.dbg_rccnt_5 ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_ccntcy_4 ),
            .carryout(\inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_ccntcy_5 ),
            .clk(N__13806),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_r_buserror_LC_13_14_6 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_r_buserror_LC_13_14_6 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_r_buserror_LC_13_14_6 .LUT_INIT=16'b1010101000000000;
    LogicCell40 \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_r_buserror_LC_13_14_6  (
            .in0(N__13549),
            .in1(N__12990),
            .in2(_gnd_net_),
            .in3(N__4702),
            .lcout(\inst_midgetv_core.buserror ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_ccntcy_5 ),
            .carryout(\inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_ccntcy_6 ),
            .clk(N__13806),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_r_rcntlsb_6_LC_13_14_7 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_r_rcntlsb_6_LC_13_14_7 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_r_rcntlsb_6_LC_13_14_7 .LUT_INIT=16'b0000001000100000;
    LogicCell40 \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_r_rcntlsb_6_LC_13_14_7  (
            .in0(N__12995),
            .in1(N__11188),
            .in2(N__4786),
            .in3(N__4699),
            .lcout(\inst_midgetv_core.inst_cyclecnt.dbg_rccnt_6 ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_ccntcy_6 ),
            .carryout(\inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_ccntcy_7 ),
            .clk(N__13806),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_r_rcrun_LC_13_15_0 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_r_rcrun_LC_13_15_0 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_r_rcrun_LC_13_15_0 .LUT_INIT=16'b1111111111001100;
    LogicCell40 \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_r_rcrun_LC_13_15_0  (
            .in0(_gnd_net_),
            .in1(N__10625),
            .in2(_gnd_net_),
            .in3(N__4789),
            .lcout(corerunning),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__13800),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_c_qq_62_4.l_LC_13_15_1 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_c_qq_62_4.l_LC_13_15_1 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_c_qq_62_4.l_LC_13_15_1 .LUT_INIT=16'b1011101110001000;
    LogicCell40 \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_c_qq_62_4.l_LC_13_15_1  (
            .in0(N__4782),
            .in1(N__11168),
            .in2(_gnd_net_),
            .in3(N__10230),
            .lcout(\inst_midgetv_core.QQ_6 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_c_qq_62_1.l_LC_13_15_2 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_c_qq_62_1.l_LC_13_15_2 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_c_qq_62_1.l_LC_13_15_2 .LUT_INIT=16'b1101110110001000;
    LogicCell40 \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_c_qq_62_1.l_LC_13_15_2  (
            .in0(N__11166),
            .in1(N__4767),
            .in2(_gnd_net_),
            .in3(N__11770),
            .lcout(\inst_midgetv_core.QQ_3 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_c_qq_62_0.l_LC_13_15_3 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_c_qq_62_0.l_LC_13_15_3 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_c_qq_62_0.l_LC_13_15_3 .LUT_INIT=16'b1011101110001000;
    LogicCell40 \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_c_qq_62_0.l_LC_13_15_3  (
            .in0(N__4756),
            .in1(N__11165),
            .in2(_gnd_net_),
            .in3(N__11510),
            .lcout(\inst_midgetv_core.QQ_2 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_L_1796_LC_13_15_4 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_L_1796_LC_13_15_4 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_L_1796_LC_13_15_4 .LUT_INIT=16'b1011001010100000;
    LogicCell40 \inst_midgetv_core.inst_immexp_zfind_q.genblk1_L_1796_LC_13_15_4  (
            .in0(N__10980),
            .in1(N__10899),
            .in2(N__10837),
            .in3(N__10270),
            .lcout(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_imm4a ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_l_sa09_LC_13_15_5 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_l_sa09_LC_13_15_5 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_l_sa09_LC_13_15_5 .LUT_INIT=16'b1100110011111111;
    LogicCell40 \inst_midgetv_core.inst_immexp_zfind_q.genblk1_l_sa09_LC_13_15_5  (
            .in0(_gnd_net_),
            .in1(N__7768),
            .in2(_gnd_net_),
            .in3(N__11169),
            .lcout(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_sa09 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_c_qq_62_2.l_LC_13_15_7 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_c_qq_62_2.l_LC_13_15_7 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_c_qq_62_2.l_LC_13_15_7 .LUT_INIT=16'b1011101110001000;
    LogicCell40 \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_c_qq_62_2.l_LC_13_15_7  (
            .in0(N__4740),
            .in1(N__11167),
            .in2(_gnd_net_),
            .in3(N__10449),
            .lcout(\inst_midgetv_core.QQ_4 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_L_1605_LC_13_16_0 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_L_1605_LC_13_16_0 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_L_1605_LC_13_16_0 .LUT_INIT=16'b0000101000101011;
    LogicCell40 \inst_midgetv_core.inst_immexp_zfind_q.genblk1_L_1605_LC_13_16_0  (
            .in0(N__8867),
            .in1(N__10955),
            .in2(N__10836),
            .in3(N__10887),
            .lcout(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_sa13 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_l_sa07_LC_13_16_1 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_l_sa07_LC_13_16_1 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_l_sa07_LC_13_16_1 .LUT_INIT=16'b1100110011111111;
    LogicCell40 \inst_midgetv_core.inst_immexp_zfind_q.genblk1_l_sa07_LC_13_16_1  (
            .in0(_gnd_net_),
            .in1(N__4801),
            .in2(_gnd_net_),
            .in3(N__11190),
            .lcout(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_sa07 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_L_1804_LC_13_16_2 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_L_1804_LC_13_16_2 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_L_1804_LC_13_16_2 .LUT_INIT=16'b1001100000000000;
    LogicCell40 \inst_midgetv_core.inst_immexp_zfind_q.genblk1_L_1804_LC_13_16_2  (
            .in0(N__10829),
            .in1(N__10960),
            .in2(N__14391),
            .in3(N__10889),
            .lcout(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_imm11a ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_L_1598_LC_13_16_3 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_L_1598_LC_13_16_3 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_L_1598_LC_13_16_3 .LUT_INIT=16'b1110010011100101;
    LogicCell40 \inst_midgetv_core.inst_immexp_zfind_q.genblk1_L_1598_LC_13_16_3  (
            .in0(N__11268),
            .in1(N__11105),
            .in2(N__11323),
            .in3(N__8337),
            .lcout(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_sa07h ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_L_1603_LC_13_16_4 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_L_1603_LC_13_16_4 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_L_1603_LC_13_16_4 .LUT_INIT=16'b1000100000010001;
    LogicCell40 \inst_midgetv_core.inst_immexp_zfind_q.genblk1_L_1603_LC_13_16_4  (
            .in0(N__10823),
            .in1(N__10954),
            .in2(_gnd_net_),
            .in3(N__10886),
            .lcout(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_sa10 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_L_1606_LC_13_16_5 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_L_1606_LC_13_16_5 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_L_1606_LC_13_16_5 .LUT_INIT=16'b0011011100000011;
    LogicCell40 \inst_midgetv_core.inst_immexp_zfind_q.genblk1_L_1606_LC_13_16_5  (
            .in0(N__10888),
            .in1(N__10827),
            .in2(N__10981),
            .in3(N__8868),
            .lcout(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_sa13b ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_L_1604_LC_13_16_6 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_L_1604_LC_13_16_6 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_L_1604_LC_13_16_6 .LUT_INIT=16'b1001100100010001;
    LogicCell40 \inst_midgetv_core.inst_immexp_zfind_q.genblk1_L_1604_LC_13_16_6  (
            .in0(N__10822),
            .in1(N__10953),
            .in2(_gnd_net_),
            .in3(N__10885),
            .lcout(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_sa31 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_L_1805_LC_13_16_7 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_L_1805_LC_13_16_7 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_L_1805_LC_13_16_7 .LUT_INIT=16'b1110111010100000;
    LogicCell40 \inst_midgetv_core.inst_immexp_zfind_q.genblk1_L_1805_LC_13_16_7  (
            .in0(N__10956),
            .in1(N__10039),
            .in2(N__8872),
            .in3(N__10828),
            .lcout(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_imm11b ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_alu_carryin.genblk1_genblk1_lb.l_LC_13_17_0 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_alu_carryin.genblk1_genblk1_lb.l_LC_13_17_0 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_alu_carryin.genblk1_genblk1_lb.l_LC_13_17_0 .LUT_INIT=16'b1110010010100000;
    LogicCell40 \inst_midgetv_core.inst_alu_carryin.genblk1_genblk1_lb.l_LC_13_17_0  (
            .in0(N__8404),
            .in1(N__8253),
            .in2(N__7131),
            .in3(N__8756),
            .lcout(\inst_midgetv_core.sra_msb ),
            .ltout(),
            .carryin(bfn_13_17_0_),
            .carryout(\inst_midgetv_core.inst_alu_carryin.genblk1_genblk1_prealucyin ),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_alu_carryin.genblk1_genblk1_reglastshift_LC_13_17_1 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_alu_carryin.genblk1_genblk1_reglastshift_LC_13_17_1 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_alu_carryin.genblk1_genblk1_reglastshift_LC_13_17_1 .LUT_INIT=16'b1111111100000000;
    LogicCell40 \inst_midgetv_core.inst_alu_carryin.genblk1_genblk1_reglastshift_LC_13_17_1  (
            .in0(_gnd_net_),
            .in1(N__12415),
            .in2(N__12136),
            .in3(N__12788),
            .lcout(\inst_midgetv_core.rlastshift ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_alu_carryin.genblk1_genblk1_prealucyin ),
            .carryout(\inst_midgetv_core.alu_carryin ),
            .clk(N__13791),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_0.l_LC_13_17_2 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_0.l_LC_13_17_2 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_0.l_LC_13_17_2 .LUT_INIT=16'b1100001101101001;
    LogicCell40 \inst_midgetv_core.inst_alu.genblk1_inst.b_0.l_LC_13_17_2  (
            .in0(N__5095),
            .in1(N__5263),
            .in2(N__6565),
            .in3(N__4795),
            .lcout(\inst_midgetv_core.B_0 ),
            .ltout(),
            .carryin(\inst_midgetv_core.alu_carryin ),
            .carryout(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_1 ),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_1.l_LC_13_17_3 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_1.l_LC_13_17_3 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_1.l_LC_13_17_3 .LUT_INIT=16'b1100001101101001;
    LogicCell40 \inst_midgetv_core.inst_alu.genblk1_inst.b_1.l_LC_13_17_3  (
            .in0(N__5098),
            .in1(N__6487),
            .in2(N__5206),
            .in3(N__4792),
            .lcout(\inst_midgetv_core.B_1 ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_1 ),
            .carryout(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_2 ),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_2.l_LC_13_17_4 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_2.l_LC_13_17_4 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_2.l_LC_13_17_4 .LUT_INIT=16'b1100001101101001;
    LogicCell40 \inst_midgetv_core.inst_alu.genblk1_inst.b_2.l_LC_13_17_4  (
            .in0(N__5096),
            .in1(N__6874),
            .in2(N__4873),
            .in3(N__4861),
            .lcout(\inst_midgetv_core.B_2 ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_2 ),
            .carryout(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_3 ),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_3.l_LC_13_17_5 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_3.l_LC_13_17_5 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_3.l_LC_13_17_5 .LUT_INIT=16'b1100001101101001;
    LogicCell40 \inst_midgetv_core.inst_alu.genblk1_inst.b_3.l_LC_13_17_5  (
            .in0(N__5099),
            .in1(N__6832),
            .in2(N__4858),
            .in3(N__4846),
            .lcout(\inst_midgetv_core.B_3 ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_3 ),
            .carryout(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_4 ),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_4.l_LC_13_17_6 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_4.l_LC_13_17_6 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_4.l_LC_13_17_6 .LUT_INIT=16'b1100001101101001;
    LogicCell40 \inst_midgetv_core.inst_alu.genblk1_inst.b_4.l_LC_13_17_6  (
            .in0(N__5097),
            .in1(N__6802),
            .in2(N__4843),
            .in3(N__4831),
            .lcout(\inst_midgetv_core.B_4 ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_4 ),
            .carryout(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_5 ),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_4.y_THRU_CRY_0_LC_13_17_7 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_4.y_THRU_CRY_0_LC_13_17_7 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_4.y_THRU_CRY_0_LC_13_17_7 .LUT_INIT=16'b0000000000000000;
    LogicCell40 \inst_midgetv_core.inst_alu.genblk1_inst.b_4.y_THRU_CRY_0_LC_13_17_7  (
            .in0(_gnd_net_),
            .in1(N__12906),
            .in2(GNDG0),
            .in3(_gnd_net_),
            .lcout(),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_5 ),
            .carryout(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_5_THRU_CRY_0_THRU_CO ),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_5.l_LC_13_18_0 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_5.l_LC_13_18_0 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_5.l_LC_13_18_0 .LUT_INIT=16'b1100001101101001;
    LogicCell40 \inst_midgetv_core.inst_alu.genblk1_inst.b_5.l_LC_13_18_0  (
            .in0(N__5105),
            .in1(N__6775),
            .in2(N__5176),
            .in3(N__4828),
            .lcout(\inst_midgetv_core.B_5 ),
            .ltout(),
            .carryin(bfn_13_18_0_),
            .carryout(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_6 ),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_6.l_LC_13_18_1 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_6.l_LC_13_18_1 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_6.l_LC_13_18_1 .LUT_INIT=16'b1100001101101001;
    LogicCell40 \inst_midgetv_core.inst_alu.genblk1_inst.b_6.l_LC_13_18_1  (
            .in0(N__5109),
            .in1(N__7081),
            .in2(N__4825),
            .in3(N__4813),
            .lcout(\inst_midgetv_core.B_6 ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_6 ),
            .carryout(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_7 ),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_7.l_LC_13_18_2 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_7.l_LC_13_18_2 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_7.l_LC_13_18_2 .LUT_INIT=16'b1100001101101001;
    LogicCell40 \inst_midgetv_core.inst_alu.genblk1_inst.b_7.l_LC_13_18_2  (
            .in0(N__5106),
            .in1(N__10143),
            .in2(N__7486),
            .in3(N__4810),
            .lcout(\inst_midgetv_core.B_7 ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_7 ),
            .carryout(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_8 ),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_8.l_LC_13_18_3 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_8.l_LC_13_18_3 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_8.l_LC_13_18_3 .LUT_INIT=16'b1100001101101001;
    LogicCell40 \inst_midgetv_core.inst_alu.genblk1_inst.b_8.l_LC_13_18_3  (
            .in0(N__5111),
            .in1(N__13266),
            .in2(N__7051),
            .in3(N__4807),
            .lcout(\inst_midgetv_core.B_8 ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_8 ),
            .carryout(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_9 ),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_9.l_LC_13_18_4 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_9.l_LC_13_18_4 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_9.l_LC_13_18_4 .LUT_INIT=16'b1100001101101001;
    LogicCell40 \inst_midgetv_core.inst_alu.genblk1_inst.b_9.l_LC_13_18_4  (
            .in0(N__5107),
            .in1(N__6925),
            .in2(N__6892),
            .in3(N__4804),
            .lcout(\inst_midgetv_core.B_9 ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_9 ),
            .carryout(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_10 ),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_10.l_LC_13_18_5 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_10.l_LC_13_18_5 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_10.l_LC_13_18_5 .LUT_INIT=16'b1100001101101001;
    LogicCell40 \inst_midgetv_core.inst_alu.genblk1_inst.b_10.l_LC_13_18_5  (
            .in0(N__5110),
            .in1(N__6969),
            .in2(N__7018),
            .in3(N__4900),
            .lcout(\inst_midgetv_core.B_10 ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_10 ),
            .carryout(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_11 ),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_11.l_LC_13_18_6 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_11.l_LC_13_18_6 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_11.l_LC_13_18_6 .LUT_INIT=16'b1100001101101001;
    LogicCell40 \inst_midgetv_core.inst_alu.genblk1_inst.b_11.l_LC_13_18_6  (
            .in0(N__5108),
            .in1(N__6985),
            .in2(N__11736),
            .in3(N__4897),
            .lcout(\inst_midgetv_core.B_11 ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_11 ),
            .carryout(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_12 ),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_12.l_LC_13_18_7 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_12.l_LC_13_18_7 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_12.l_LC_13_18_7 .LUT_INIT=16'b1100001101101001;
    LogicCell40 \inst_midgetv_core.inst_alu.genblk1_inst.b_12.l_LC_13_18_7  (
            .in0(N__5112),
            .in1(N__7264),
            .in2(N__7288),
            .in3(N__4894),
            .lcout(\inst_midgetv_core.B_12 ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_12 ),
            .carryout(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_13 ),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_13.l_LC_13_19_0 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_13.l_LC_13_19_0 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_13.l_LC_13_19_0 .LUT_INIT=16'b1100001101101001;
    LogicCell40 \inst_midgetv_core.inst_alu.genblk1_inst.b_13.l_LC_13_19_0  (
            .in0(N__5113),
            .in1(N__8593),
            .in2(N__8620),
            .in3(N__4891),
            .lcout(\inst_midgetv_core.B_13 ),
            .ltout(),
            .carryin(bfn_13_19_0_),
            .carryout(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_14 ),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_14.l_LC_13_19_1 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_14.l_LC_13_19_1 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_14.l_LC_13_19_1 .LUT_INIT=16'b1100001101101001;
    LogicCell40 \inst_midgetv_core.inst_alu.genblk1_inst.b_14.l_LC_13_19_1  (
            .in0(N__5117),
            .in1(N__9571),
            .in2(N__9601),
            .in3(N__4888),
            .lcout(\inst_midgetv_core.B_14 ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_14 ),
            .carryout(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_15 ),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_15.l_LC_13_19_2 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_15.l_LC_13_19_2 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_15.l_LC_13_19_2 .LUT_INIT=16'b1100001101101001;
    LogicCell40 \inst_midgetv_core.inst_alu.genblk1_inst.b_15.l_LC_13_19_2  (
            .in0(N__5114),
            .in1(N__9517),
            .in2(N__9547),
            .in3(N__4885),
            .lcout(\inst_midgetv_core.B_15 ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_15 ),
            .carryout(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_16 ),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_16.l_LC_13_19_3 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_16.l_LC_13_19_3 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_16.l_LC_13_19_3 .LUT_INIT=16'b1100001101101001;
    LogicCell40 \inst_midgetv_core.inst_alu.genblk1_inst.b_16.l_LC_13_19_3  (
            .in0(N__5119),
            .in1(N__9323),
            .in2(N__8962),
            .in3(N__4882),
            .lcout(\inst_midgetv_core.B_16 ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_16 ),
            .carryout(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_17 ),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_17.l_LC_13_19_4 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_17.l_LC_13_19_4 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_17.l_LC_13_19_4 .LUT_INIT=16'b1100001101101001;
    LogicCell40 \inst_midgetv_core.inst_alu.genblk1_inst.b_17.l_LC_13_19_4  (
            .in0(N__5115),
            .in1(N__7456),
            .in2(N__9508),
            .in3(N__4879),
            .lcout(\inst_midgetv_core.B_17 ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_17 ),
            .carryout(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_18 ),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_18.l_LC_13_19_5 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_18.l_LC_13_19_5 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_18.l_LC_13_19_5 .LUT_INIT=16'b1100001101101001;
    LogicCell40 \inst_midgetv_core.inst_alu.genblk1_inst.b_18.l_LC_13_19_5  (
            .in0(N__5118),
            .in1(N__7429),
            .in2(N__7405),
            .in3(N__4876),
            .lcout(\inst_midgetv_core.B_18 ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_18 ),
            .carryout(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_19 ),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_19.l_LC_13_19_6 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_19.l_LC_13_19_6 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_19.l_LC_13_19_6 .LUT_INIT=16'b1100001101101001;
    LogicCell40 \inst_midgetv_core.inst_alu.genblk1_inst.b_19.l_LC_13_19_6  (
            .in0(N__5116),
            .in1(N__7354),
            .in2(N__7381),
            .in3(N__4927),
            .lcout(\inst_midgetv_core.B_19 ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_19 ),
            .carryout(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_20 ),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_20.l_LC_13_19_7 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_20.l_LC_13_19_7 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_20.l_LC_13_19_7 .LUT_INIT=16'b1100001101101001;
    LogicCell40 \inst_midgetv_core.inst_alu.genblk1_inst.b_20.l_LC_13_19_7  (
            .in0(N__5120),
            .in1(N__7726),
            .in2(N__7753),
            .in3(N__4924),
            .lcout(\inst_midgetv_core.B_20 ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_20 ),
            .carryout(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_21 ),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_21.l_LC_13_20_0 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_21.l_LC_13_20_0 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_21.l_LC_13_20_0 .LUT_INIT=16'b1100001101101001;
    LogicCell40 \inst_midgetv_core.inst_alu.genblk1_inst.b_21.l_LC_13_20_0  (
            .in0(N__5144),
            .in1(N__7330),
            .in2(N__5962),
            .in3(N__4921),
            .lcout(\inst_midgetv_core.B_21 ),
            .ltout(),
            .carryin(bfn_13_20_0_),
            .carryout(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_22 ),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_22.l_LC_13_20_1 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_22.l_LC_13_20_1 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_22.l_LC_13_20_1 .LUT_INIT=16'b1100001101101001;
    LogicCell40 \inst_midgetv_core.inst_alu.genblk1_inst.b_22.l_LC_13_20_1  (
            .in0(N__5149),
            .in1(N__5911),
            .in2(N__5935),
            .in3(N__4918),
            .lcout(\inst_midgetv_core.B_22 ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_22 ),
            .carryout(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_23 ),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_23.l_LC_13_20_2 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_23.l_LC_13_20_2 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_23.l_LC_13_20_2 .LUT_INIT=16'b1100001101101001;
    LogicCell40 \inst_midgetv_core.inst_alu.genblk1_inst.b_23.l_LC_13_20_2  (
            .in0(N__5145),
            .in1(N__6475),
            .in2(N__6451),
            .in3(N__4915),
            .lcout(\inst_midgetv_core.B_23 ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_23 ),
            .carryout(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_24 ),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_24.l_LC_13_20_3 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_24.l_LC_13_20_3 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_24.l_LC_13_20_3 .LUT_INIT=16'b1100001101101001;
    LogicCell40 \inst_midgetv_core.inst_alu.genblk1_inst.b_24.l_LC_13_20_3  (
            .in0(N__5150),
            .in1(N__6421),
            .in2(N__6397),
            .in3(N__4912),
            .lcout(\inst_midgetv_core.B_24 ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_24 ),
            .carryout(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_25 ),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_25.l_LC_13_20_4 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_25.l_LC_13_20_4 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_25.l_LC_13_20_4 .LUT_INIT=16'b1100001101101001;
    LogicCell40 \inst_midgetv_core.inst_alu.genblk1_inst.b_25.l_LC_13_20_4  (
            .in0(N__5146),
            .in1(N__7669),
            .in2(N__7696),
            .in3(N__4909),
            .lcout(\inst_midgetv_core.B_25 ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_25 ),
            .carryout(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_26 ),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_26.l_LC_13_20_5 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_26.l_LC_13_20_5 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_26.l_LC_13_20_5 .LUT_INIT=16'b1100001101101001;
    LogicCell40 \inst_midgetv_core.inst_alu.genblk1_inst.b_26.l_LC_13_20_5  (
            .in0(N__5151),
            .in1(N__7639),
            .in2(N__7615),
            .in3(N__4906),
            .lcout(\inst_midgetv_core.B_26 ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_26 ),
            .carryout(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_27 ),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_27.l_LC_13_20_6 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_27.l_LC_13_20_6 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_27.l_LC_13_20_6 .LUT_INIT=16'b1100001101101001;
    LogicCell40 \inst_midgetv_core.inst_alu.genblk1_inst.b_27.l_LC_13_20_6  (
            .in0(N__5147),
            .in1(N__7558),
            .in2(N__7585),
            .in3(N__4903),
            .lcout(\inst_midgetv_core.B_27 ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_27 ),
            .carryout(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_28 ),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_28.l_LC_13_20_7 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_28.l_LC_13_20_7 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_28.l_LC_13_20_7 .LUT_INIT=16'b1100001101101001;
    LogicCell40 \inst_midgetv_core.inst_alu.genblk1_inst.b_28.l_LC_13_20_7  (
            .in0(N__5152),
            .in1(N__8095),
            .in2(N__8068),
            .in3(N__5161),
            .lcout(\inst_midgetv_core.B_28 ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_28 ),
            .carryout(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_29 ),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_29.l_LC_13_21_0 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_29.l_LC_13_21_0 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_29.l_LC_13_21_0 .LUT_INIT=16'b1100001101101001;
    LogicCell40 \inst_midgetv_core.inst_alu.genblk1_inst.b_29.l_LC_13_21_0  (
            .in0(N__5143),
            .in1(N__7549),
            .in2(N__7231),
            .in3(N__5158),
            .lcout(\inst_midgetv_core.B_29 ),
            .ltout(),
            .carryin(bfn_13_21_0_),
            .carryout(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_30 ),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_30.l_LC_13_21_1 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_30.l_LC_13_21_1 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_30.l_LC_13_21_1 .LUT_INIT=16'b1100001101101001;
    LogicCell40 \inst_midgetv_core.inst_alu.genblk1_inst.b_30.l_LC_13_21_1  (
            .in0(N__5148),
            .in1(N__7171),
            .in2(N__7195),
            .in3(N__5155),
            .lcout(\inst_midgetv_core.B_30 ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_30 ),
            .carryout(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_31 ),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_31.l_LC_13_21_2 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_31.l_LC_13_21_2 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.b_31.l_LC_13_21_2 .LUT_INIT=16'b1100001101101001;
    LogicCell40 \inst_midgetv_core.inst_alu.genblk1_inst.b_31.l_LC_13_21_2  (
            .in0(N__5142),
            .in1(N__7100),
            .in2(N__7144),
            .in3(N__4966),
            .lcout(\inst_midgetv_core.B_31 ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_alu.genblk1_inst.alucy_31 ),
            .carryout(\inst_midgetv_core.alu_carryout ),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.alu_carryout_THRU_LUT4_0_LC_13_21_3 .C_ON=1'b0;
    defparam \inst_midgetv_core.alu_carryout_THRU_LUT4_0_LC_13_21_3 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.alu_carryout_THRU_LUT4_0_LC_13_21_3 .LUT_INIT=16'b1111111100000000;
    LogicCell40 \inst_midgetv_core.alu_carryout_THRU_LUT4_0_LC_13_21_3  (
            .in0(_gnd_net_),
            .in1(_gnd_net_),
            .in2(_gnd_net_),
            .in3(N__4963),
            .lcout(\inst_midgetv_core.alu_carryout_THRU_CO ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_condcode.genblk1_tmp_raluF_31_LC_13_21_5 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_condcode.genblk1_tmp_raluF_31_LC_13_21_5 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_condcode.genblk1_tmp_raluF_31_LC_13_21_5 .LUT_INIT=16'b1010101011000000;
    LogicCell40 \inst_midgetv_core.inst_condcode.genblk1_tmp_raluF_31_LC_13_21_5  (
            .in0(N__4933),
            .in1(N__8676),
            .in2(N__4960),
            .in3(N__8568),
            .lcout(\inst_midgetv_core.raluF ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__13782),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_condcode.INSTR_14__I_0_i2_3_lut_4_lut_LC_13_21_6 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_condcode.INSTR_14__I_0_i2_3_lut_4_lut_LC_13_21_6 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_condcode.INSTR_14__I_0_i2_3_lut_4_lut_LC_13_21_6 .LUT_INIT=16'b0000111110001110;
    LogicCell40 \inst_midgetv_core.inst_condcode.INSTR_14__I_0_i2_3_lut_4_lut_LC_13_21_6  (
            .in0(N__7142),
            .in1(N__7101),
            .in2(N__4951),
            .in3(N__8211),
            .lcout(\inst_midgetv_core.inst_condcode.n2 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_condcode.INSTR_14__I_0_i6_3_lut_4_lut_LC_13_21_7 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_condcode.INSTR_14__I_0_i6_3_lut_4_lut_LC_13_21_7 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_condcode.INSTR_14__I_0_i6_3_lut_4_lut_LC_13_21_7 .LUT_INIT=16'b0000111110001110;
    LogicCell40 \inst_midgetv_core.inst_condcode.INSTR_14__I_0_i6_3_lut_4_lut_LC_13_21_7  (
            .in0(N__7102),
            .in1(N__7143),
            .in2(N__4950),
            .in3(N__8675),
            .lcout(\inst_midgetv_core.inst_condcode.n6 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_ucodepc.i3958_2_lut_LC_14_13_0 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_ucodepc.i3958_2_lut_LC_14_13_0 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_ucodepc.i3958_2_lut_LC_14_13_0 .LUT_INIT=16'b0000000011001100;
    LogicCell40 \inst_midgetv_core.inst_ucodepc.i3958_2_lut_LC_14_13_0  (
            .in0(_gnd_net_),
            .in1(N__11267),
            .in2(_gnd_net_),
            .in3(N__7821),
            .lcout(\inst_midgetv_core.inst_ucodepc.n5609 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_ucodepc.i1_4_lut_LC_14_13_3 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_ucodepc.i1_4_lut_LC_14_13_3 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_ucodepc.i1_4_lut_LC_14_13_3 .LUT_INIT=16'b1111111010111010;
    LogicCell40 \inst_midgetv_core.inst_ucodepc.i1_4_lut_LC_14_13_3  (
            .in0(N__11944),
            .in1(N__7882),
            .in2(N__5290),
            .in3(N__5281),
            .lcout(\inst_midgetv_core.mostofminx0 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_genblk1_c_qq_10_0.l_LC_14_14_0 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_genblk1_c_qq_10_0.l_LC_14_14_0 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_genblk1_c_qq_10_0.l_LC_14_14_0 .LUT_INIT=16'b1100110010101111;
    LogicCell40 \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_genblk1_c_qq_10_0.l_LC_14_14_0  (
            .in0(N__6580),
            .in1(N__5274),
            .in2(N__5245),
            .in3(N__11162),
            .lcout(\inst_midgetv_core.QQ_0 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.reg_d18_LC_14_14_1 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.reg_d18_LC_14_14_1 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.reg_d18_LC_14_14_1 .LUT_INIT=16'b1000000000000000;
    LogicCell40 \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.reg_d18_LC_14_14_1  (
            .in0(N__7947),
            .in1(N__6261),
            .in2(N__6298),
            .in3(N__7989),
            .lcout(\inst_midgetv_core.s_cyclecnt_0 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__13811),
            .ce(N__9808),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_genblk1_c_qq_10_1.l_LC_14_14_2 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_genblk1_c_qq_10_1.l_LC_14_14_2 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_genblk1_c_qq_10_1.l_LC_14_14_2 .LUT_INIT=16'b1111000011011101;
    LogicCell40 \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_genblk1_c_qq_10_1.l_LC_14_14_2  (
            .in0(N__5244),
            .in1(N__6504),
            .in2(N__5223),
            .in3(N__11163),
            .lcout(\inst_midgetv_core.QQ_1 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_c_qq_62_3.l_LC_14_14_6 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_c_qq_62_3.l_LC_14_14_6 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_c_qq_62_3.l_LC_14_14_6 .LUT_INIT=16'b1011101110001000;
    LogicCell40 \inst_midgetv_core.inst_cyclecnt.genblk1_genblk1_c_qq_62_3.l_LC_14_14_6  (
            .in0(N__5187),
            .in1(N__11164),
            .in2(_gnd_net_),
            .in3(N__10356),
            .lcout(\inst_midgetv_core.QQ_5 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_0__r_LC_14_15_0 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_0__r_LC_14_15_0 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_0__r_LC_14_15_0 .LUT_INIT=16'b1000111110000000;
    LogicCell40 \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_0__r_LC_14_15_0  (
            .in0(N__10900),
            .in1(N__12465),
            .in2(N__10832),
            .in3(N__10006),
            .lcout(\inst_midgetv_core.ADR_O_0 ),
            .ltout(),
            .carryin(bfn_14_15_0_),
            .carryout(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy1 ),
            .clk(N__13807),
            .ce(N__9735),
            .sr(N__6678));
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_1__r_LC_14_15_1 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_1__r_LC_14_15_1 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_1__r_LC_14_15_1 .LUT_INIT=16'b1101101010001010;
    LogicCell40 \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_1__r_LC_14_15_1  (
            .in0(N__11011),
            .in1(N__12750),
            .in2(N__10901),
            .in3(N__13169),
            .lcout(\inst_midgetv_core.ADR_O_1 ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy1 ),
            .carryout(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy2 ),
            .clk(N__13807),
            .ce(N__9735),
            .sr(N__6678));
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_2__r_LC_14_15_2 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_2__r_LC_14_15_2 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_2__r_LC_14_15_2 .LUT_INIT=16'b1110011010100010;
    LogicCell40 \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_2__r_LC_14_15_2  (
            .in0(N__9955),
            .in1(N__10880),
            .in2(N__14200),
            .in3(N__15198),
            .lcout(ADR_O_2),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy2 ),
            .carryout(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy3 ),
            .clk(N__13807),
            .ce(N__9735),
            .sr(N__6678));
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_3__r_LC_14_15_3 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_3__r_LC_14_15_3 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_3__r_LC_14_15_3 .LUT_INIT=16'b1100111110100000;
    LogicCell40 \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_3__r_LC_14_15_3  (
            .in0(N__13058),
            .in1(N__14051),
            .in2(N__10902),
            .in3(N__10729),
            .lcout(ADR_O_3),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy3 ),
            .carryout(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy4 ),
            .clk(N__13807),
            .ce(N__9735),
            .sr(N__6678));
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_4__r_LC_14_15_4 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_4__r_LC_14_15_4 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_4__r_LC_14_15_4 .LUT_INIT=16'b1111001110001000;
    LogicCell40 \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_4__r_LC_14_15_4  (
            .in0(N__14476),
            .in1(N__10884),
            .in2(N__15131),
            .in3(N__5335),
            .lcout(\inst_midgetv_core.ADR_O_4 ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy4 ),
            .carryout(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy5 ),
            .clk(N__13807),
            .ce(N__9735),
            .sr(N__6678));
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_5__r_LC_14_15_5 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_5__r_LC_14_15_5 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_5__r_LC_14_15_5 .LUT_INIT=16'b1100000010101010;
    LogicCell40 \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_5__r_LC_14_15_5  (
            .in0(N__8764),
            .in1(N__15306),
            .in2(N__10982),
            .in3(N__6120),
            .lcout(\inst_midgetv_core.ADR_O_5 ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy5 ),
            .carryout(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy6 ),
            .clk(N__13807),
            .ce(N__9735),
            .sr(N__6678));
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_6__r_LC_14_15_6 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_6__r_LC_14_15_6 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_6__r_LC_14_15_6 .LUT_INIT=16'b1101010110000000;
    LogicCell40 \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_6__r_LC_14_15_6  (
            .in0(N__6121),
            .in1(N__10964),
            .in2(N__14291),
            .in3(N__8833),
            .lcout(\inst_midgetv_core.ADR_O_6 ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy6 ),
            .carryout(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy7 ),
            .clk(N__13807),
            .ce(N__9735),
            .sr(N__6678));
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_7__r_LC_14_15_7 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_7__r_LC_14_15_7 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_7__r_LC_14_15_7 .LUT_INIT=16'b1100000010101010;
    LogicCell40 \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_7__r_LC_14_15_7  (
            .in0(N__8467),
            .in1(N__13919),
            .in2(N__10983),
            .in3(N__6119),
            .lcout(\inst_midgetv_core.ADR_O_7 ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy7 ),
            .carryout(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy8 ),
            .clk(N__13807),
            .ce(N__9735),
            .sr(N__6678));
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_8__r_LC_14_16_0 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_8__r_LC_14_16_0 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_8__r_LC_14_16_0 .LUT_INIT=16'b1101010110000000;
    LogicCell40 \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_8__r_LC_14_16_0  (
            .in0(N__6056),
            .in1(N__14780),
            .in2(N__10984),
            .in3(N__8796),
            .lcout(\inst_midgetv_core.ADR_O_8 ),
            .ltout(),
            .carryin(bfn_14_16_0_),
            .carryout(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy9 ),
            .clk(N__13801),
            .ce(N__9727),
            .sr(N__6681));
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_9__r_LC_14_16_1 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_9__r_LC_14_16_1 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_9__r_LC_14_16_1 .LUT_INIT=16'b1100000010101010;
    LogicCell40 \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_9__r_LC_14_16_1  (
            .in0(N__8440),
            .in1(N__14606),
            .in2(N__10986),
            .in3(N__6057),
            .lcout(\inst_midgetv_core.ADR_O_9 ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy9 ),
            .carryout(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy10 ),
            .clk(N__13801),
            .ce(N__9727),
            .sr(N__6681));
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_10__r_LC_14_16_2 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_10__r_LC_14_16_2 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_10__r_LC_14_16_2 .LUT_INIT=16'b1101010110000000;
    LogicCell40 \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_10__r_LC_14_16_2  (
            .in0(N__6055),
            .in1(N__14978),
            .in2(N__10985),
            .in3(N__8400),
            .lcout(\inst_midgetv_core.ADR_O_10 ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy10 ),
            .carryout(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy11 ),
            .clk(N__13801),
            .ce(N__9727),
            .sr(N__6681));
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_11__r_LC_14_16_3 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_11__r_LC_14_16_3 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_11__r_LC_14_16_3 .LUT_INIT=16'b1101110110101010;
    LogicCell40 \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_11__r_LC_14_16_3  (
            .in0(N__5329),
            .in1(N__14885),
            .in2(N__12989),
            .in3(N__5323),
            .lcout(\inst_midgetv_core.ADR_O_11 ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy11 ),
            .carryout(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy12 ),
            .clk(N__13801),
            .ce(N__9727),
            .sr(N__6681));
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_12__r_LC_14_16_4 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_12__r_LC_14_16_4 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_12__r_LC_14_16_4 .LUT_INIT=16'b1110101001100010;
    LogicCell40 \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_12__r_LC_14_16_4  (
            .in0(N__5466),
            .in1(N__5421),
            .in2(N__5313),
            .in3(N__8203),
            .lcout(\inst_midgetv_core.ADR_O_12 ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy12 ),
            .carryout(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy13 ),
            .clk(N__13801),
            .ce(N__9727),
            .sr(N__6681));
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_13__r_LC_14_16_5 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_13__r_LC_14_16_5 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_13__r_LC_14_16_5 .LUT_INIT=16'b1010111111000000;
    LogicCell40 \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_13__r_LC_14_16_5  (
            .in0(N__8677),
            .in1(N__5637),
            .in2(N__5439),
            .in3(N__5468),
            .lcout(\inst_midgetv_core.ADR_O_13 ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy13 ),
            .carryout(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy14 ),
            .clk(N__13801),
            .ce(N__9727),
            .sr(N__6681));
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_14__r_LC_14_16_6 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_14__r_LC_14_16_6 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_14__r_LC_14_16_6 .LUT_INIT=16'b1110101001001010;
    LogicCell40 \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_14__r_LC_14_16_6  (
            .in0(N__5467),
            .in1(N__5610),
            .in2(N__5441),
            .in3(N__8569),
            .lcout(\inst_midgetv_core.ADR_O_14 ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy14 ),
            .carryout(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy15 ),
            .clk(N__13801),
            .ce(N__9727),
            .sr(N__6681));
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_15__r_LC_14_16_7 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_15__r_LC_14_16_7 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_15__r_LC_14_16_7 .LUT_INIT=16'b1010111111000000;
    LogicCell40 \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_15__r_LC_14_16_7  (
            .in0(N__14334),
            .in1(N__5586),
            .in2(N__5440),
            .in3(N__5469),
            .lcout(\inst_midgetv_core.ADR_O_15 ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy15 ),
            .carryout(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy16 ),
            .clk(N__13801),
            .ce(N__9727),
            .sr(N__6681));
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_16__r_LC_14_17_0 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_16__r_LC_14_17_0 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_16__r_LC_14_17_0 .LUT_INIT=16'b1010111111000000;
    LogicCell40 \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_16__r_LC_14_17_0  (
            .in0(N__13141),
            .in1(N__5556),
            .in2(N__5442),
            .in3(N__5472),
            .lcout(\inst_midgetv_core.ADR_O_16 ),
            .ltout(),
            .carryin(bfn_14_17_0_),
            .carryout(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy17 ),
            .clk(N__13797),
            .ce(N__9736),
            .sr(N__6679));
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_17__r_LC_14_17_1 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_17__r_LC_14_17_1 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_17__r_LC_14_17_1 .LUT_INIT=16'b1110101001001010;
    LogicCell40 \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_17__r_LC_14_17_1  (
            .in0(N__5470),
            .in1(N__5526),
            .in2(N__5443),
            .in3(N__15162),
            .lcout(\inst_midgetv_core.ADR_O_17 ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy17 ),
            .carryout(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy18 ),
            .clk(N__13797),
            .ce(N__9736),
            .sr(N__6679));
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_18__r_LC_14_17_2 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_18__r_LC_14_17_2 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_18__r_LC_14_17_2 .LUT_INIT=16'b1011101111000000;
    LogicCell40 \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_18__r_LC_14_17_2  (
            .in0(N__13104),
            .in1(N__5438),
            .in2(N__5503),
            .in3(N__5473),
            .lcout(\inst_midgetv_core.ADR_O_18 ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy18 ),
            .carryout(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy19 ),
            .clk(N__13797),
            .ce(N__9736),
            .sr(N__6679));
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_19__r_LC_14_17_3 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_19__r_LC_14_17_3 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_19__r_LC_14_17_3 .LUT_INIT=16'b1110101001100010;
    LogicCell40 \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_19__r_LC_14_17_3  (
            .in0(N__5471),
            .in1(N__5434),
            .in2(N__5391),
            .in3(N__14430),
            .lcout(\inst_midgetv_core.ADR_O_19 ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy19 ),
            .carryout(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy20 ),
            .clk(N__13797),
            .ce(N__9736),
            .sr(N__6679));
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_20__r_LC_14_17_4 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_20__r_LC_14_17_4 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_20__r_LC_14_17_4 .LUT_INIT=16'b1010111111000000;
    LogicCell40 \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_20__r_LC_14_17_4  (
            .in0(N__14386),
            .in1(N__5352),
            .in2(N__6061),
            .in3(N__6145),
            .lcout(\inst_midgetv_core.ADR_O_20 ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy20 ),
            .carryout(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy21 ),
            .clk(N__13797),
            .ce(N__9736),
            .sr(N__6679));
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_21__r_LC_14_17_5 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_21__r_LC_14_17_5 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_21__r_LC_14_17_5 .LUT_INIT=16'b1110101001001010;
    LogicCell40 \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_21__r_LC_14_17_5  (
            .in0(N__6143),
            .in1(N__5883),
            .in2(N__6063),
            .in3(N__13176),
            .lcout(\inst_midgetv_core.ADR_O_21 ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy21 ),
            .carryout(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy22 ),
            .clk(N__13797),
            .ce(N__9736),
            .sr(N__6679));
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_22__r_LC_14_17_6 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_22__r_LC_14_17_6 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_22__r_LC_14_17_6 .LUT_INIT=16'b1010111111000000;
    LogicCell40 \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_22__r_LC_14_17_6  (
            .in0(N__15197),
            .in1(N__5847),
            .in2(N__6062),
            .in3(N__6146),
            .lcout(\inst_midgetv_core.ADR_O_22 ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy22 ),
            .carryout(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy23 ),
            .clk(N__13797),
            .ce(N__9736),
            .sr(N__6679));
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_23__r_LC_14_17_7 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_23__r_LC_14_17_7 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_23__r_LC_14_17_7 .LUT_INIT=16'b1110101001001010;
    LogicCell40 \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_23__r_LC_14_17_7  (
            .in0(N__6144),
            .in1(N__5820),
            .in2(N__6064),
            .in3(N__13059),
            .lcout(\inst_midgetv_core.ADR_O_23 ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy23 ),
            .carryout(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy24 ),
            .clk(N__13797),
            .ce(N__9736),
            .sr(N__6679));
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_24__r_LC_14_18_0 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_24__r_LC_14_18_0 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_24__r_LC_14_18_0 .LUT_INIT=16'b1011101111000000;
    LogicCell40 \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_24__r_LC_14_18_0  (
            .in0(N__14465),
            .in1(N__6065),
            .in2(N__5796),
            .in3(N__6168),
            .lcout(\inst_midgetv_core.ADR_O_24 ),
            .ltout(),
            .carryin(bfn_14_18_0_),
            .carryout(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy25 ),
            .clk(N__13792),
            .ce(N__9728),
            .sr(N__6680));
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_25__r_LC_14_18_1 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_25__r_LC_14_18_1 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_25__r_LC_14_18_1 .LUT_INIT=16'b1110101001001010;
    LogicCell40 \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_25__r_LC_14_18_1  (
            .in0(N__6165),
            .in1(N__5754),
            .in2(N__6088),
            .in3(N__8760),
            .lcout(\inst_midgetv_core.ADR_O_25 ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy25 ),
            .carryout(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy26 ),
            .clk(N__13792),
            .ce(N__9728),
            .sr(N__6680));
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_26__r_LC_14_18_2 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_26__r_LC_14_18_2 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_26__r_LC_14_18_2 .LUT_INIT=16'b1010111111000000;
    LogicCell40 \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_26__r_LC_14_18_2  (
            .in0(N__8829),
            .in1(N__5724),
            .in2(N__6091),
            .in3(N__6169),
            .lcout(\inst_midgetv_core.ADR_O_26 ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy26 ),
            .carryout(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy27 ),
            .clk(N__13792),
            .ce(N__9728),
            .sr(N__6680));
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_27__r_LC_14_18_3 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_27__r_LC_14_18_3 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_27__r_LC_14_18_3 .LUT_INIT=16'b1011101111000000;
    LogicCell40 \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_27__r_LC_14_18_3  (
            .in0(N__8465),
            .in1(N__6078),
            .in2(N__5694),
            .in3(N__6172),
            .lcout(\inst_midgetv_core.ADR_O_27 ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy27 ),
            .carryout(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy28 ),
            .clk(N__13792),
            .ce(N__9728),
            .sr(N__6680));
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_28__r_LC_14_18_4 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_28__r_LC_14_18_4 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_28__r_LC_14_18_4 .LUT_INIT=16'b1010111111000000;
    LogicCell40 \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_28__r_LC_14_18_4  (
            .in0(N__8797),
            .in1(N__5661),
            .in2(N__6092),
            .in3(N__6170),
            .lcout(\inst_midgetv_core.ADR_O_28 ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy28 ),
            .carryout(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy29 ),
            .clk(N__13792),
            .ce(N__9728),
            .sr(N__6680));
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_29__r_LC_14_18_5 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_29__r_LC_14_18_5 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_29__r_LC_14_18_5 .LUT_INIT=16'b1110101001001010;
    LogicCell40 \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_29__r_LC_14_18_5  (
            .in0(N__6166),
            .in1(N__6192),
            .in2(N__6089),
            .in3(N__8438),
            .lcout(\inst_midgetv_core.ADR_O_29 ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy29 ),
            .carryout(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy30 ),
            .clk(N__13792),
            .ce(N__9728),
            .sr(N__6680));
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_30__r_LC_14_18_6 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_30__r_LC_14_18_6 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_30__r_LC_14_18_6 .LUT_INIT=16'b1010111111000000;
    LogicCell40 \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_30__r_LC_14_18_6  (
            .in0(N__8416),
            .in1(N__8943),
            .in2(N__6093),
            .in3(N__6171),
            .lcout(\inst_midgetv_core.ADR_O_30 ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy30 ),
            .carryout(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy31 ),
            .clk(N__13792),
            .ce(N__9728),
            .sr(N__6680));
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_31__r_LC_14_18_7 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_31__r_LC_14_18_7 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_31__r_LC_14_18_7 .LUT_INIT=16'b1110101001001010;
    LogicCell40 \inst_midgetv_core.inst_immexp_zfind_q.genblk1_blk0_31__r_LC_14_18_7  (
            .in0(N__6167),
            .in1(N__11433),
            .in2(N__6090),
            .in3(N__8866),
            .lcout(\inst_midgetv_core.ADR_O_31 ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy31 ),
            .carryout(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_zcy32 ),
            .clk(N__13792),
            .ce(N__9728),
            .sr(N__6680));
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_rNE0_LC_14_19_0 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_rNE0_LC_14_19_0 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_rNE0_LC_14_19_0 .LUT_INIT=16'b1111111100000000;
    LogicCell40 \inst_midgetv_core.inst_immexp_zfind_q.genblk1_rNE0_LC_14_19_0  (
            .in0(_gnd_net_),
            .in1(_gnd_net_),
            .in2(_gnd_net_),
            .in3(N__5986),
            .lcout(\inst_midgetv_core.rzcy32 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__13789),
            .ce(N__9726),
            .sr(N__6682));
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC31_16_21_LC_14_20_0 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC31_16_21_LC_14_20_0 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC31_16_21_LC_14_20_0 .LUT_INIT=16'b1111000010101100;
    LogicCell40 \inst_midgetv_core.inst_opreg.genblk1_OpC31_16_21_LC_14_20_0  (
            .in0(_gnd_net_),
            .in1(N__5930),
            .in2(N__5983),
            .in3(N__9460),
            .lcout(\inst_midgetv_core.INSTR_21 ),
            .ltout(\inst_midgetv_core.Di_21_cascade_ ),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__13786),
            .ce(N__9918),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_21.l_LC_14_20_1 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_21.l_LC_14_20_1 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_21.l_LC_14_20_1 .LUT_INIT=16'b0010010100110000;
    LogicCell40 \inst_midgetv_core.inst_alu.genblk1_inst.a_21.l_LC_14_20_1  (
            .in0(N__7326),
            .in1(N__9301),
            .in2(N__5965),
            .in3(N__9124),
            .lcout(\inst_midgetv_core.inst_alu.genblk1_inst.A_21 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC31_16_22_LC_14_20_2 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC31_16_22_LC_14_20_2 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC31_16_22_LC_14_20_2 .LUT_INIT=16'b1111000010101100;
    LogicCell40 \inst_midgetv_core.inst_opreg.genblk1_OpC31_16_22_LC_14_20_2  (
            .in0(_gnd_net_),
            .in1(N__6470),
            .in2(N__5953),
            .in3(N__9461),
            .lcout(\inst_midgetv_core.INSTR_22 ),
            .ltout(\inst_midgetv_core.Di_22_cascade_ ),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__13786),
            .ce(N__9918),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_22.l_LC_14_20_3 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_22.l_LC_14_20_3 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_22.l_LC_14_20_3 .LUT_INIT=16'b0010010100110000;
    LogicCell40 \inst_midgetv_core.inst_alu.genblk1_inst.a_22.l_LC_14_20_3  (
            .in0(N__5931),
            .in1(N__9302),
            .in2(N__5914),
            .in3(N__9125),
            .lcout(\inst_midgetv_core.inst_alu.genblk1_inst.A_22 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC31_16_23_LC_14_20_4 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC31_16_23_LC_14_20_4 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC31_16_23_LC_14_20_4 .LUT_INIT=16'b1111000010101100;
    LogicCell40 \inst_midgetv_core.inst_opreg.genblk1_OpC31_16_23_LC_14_20_4  (
            .in0(_gnd_net_),
            .in1(N__6419),
            .in2(N__5905),
            .in3(N__9462),
            .lcout(\inst_midgetv_core.INSTR_23 ),
            .ltout(\inst_midgetv_core.Di_23_cascade_ ),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__13786),
            .ce(N__9918),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_23.l_LC_14_20_5 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_23.l_LC_14_20_5 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_23.l_LC_14_20_5 .LUT_INIT=16'b0010010100110000;
    LogicCell40 \inst_midgetv_core.inst_alu.genblk1_inst.a_23.l_LC_14_20_5  (
            .in0(N__6471),
            .in1(N__9303),
            .in2(N__6454),
            .in3(N__9126),
            .lcout(\inst_midgetv_core.inst_alu.genblk1_inst.A_23 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC31_16_24_LC_14_20_6 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC31_16_24_LC_14_20_6 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC31_16_24_LC_14_20_6 .LUT_INIT=16'b1111000010101100;
    LogicCell40 \inst_midgetv_core.inst_opreg.genblk1_OpC31_16_24_LC_14_20_6  (
            .in0(_gnd_net_),
            .in1(N__7691),
            .in2(N__6442),
            .in3(N__9463),
            .lcout(\inst_midgetv_core.INSTR_24 ),
            .ltout(\inst_midgetv_core.Di_24_cascade_ ),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__13786),
            .ce(N__9918),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_24.l_LC_14_20_7 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_24.l_LC_14_20_7 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_24.l_LC_14_20_7 .LUT_INIT=16'b0010010100110000;
    LogicCell40 \inst_midgetv_core.inst_alu.genblk1_inst.a_24.l_LC_14_20_7  (
            .in0(N__6420),
            .in1(N__9304),
            .in2(N__6400),
            .in3(N__9127),
            .lcout(\inst_midgetv_core.inst_alu.genblk1_inst.A_24 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_progressctrl.genblk4_rWE_O_66_LC_14_21_1 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_progressctrl.genblk4_rWE_O_66_LC_14_21_1 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_progressctrl.genblk4_rWE_O_66_LC_14_21_1 .LUT_INIT=16'b0011001100100010;
    LogicCell40 \inst_midgetv_core.inst_progressctrl.genblk4_rWE_O_66_LC_14_21_1  (
            .in0(N__8935),
            .in1(N__11353),
            .in2(_gnd_net_),
            .in3(N__11417),
            .lcout(WE_O),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__13785),
            .ce(N__6736),
            .sr(N__6721));
    defparam \inst_midgetv_core.inst_wai.genblk1_L_2327_LC_14_21_6 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_wai.genblk1_L_2327_LC_14_21_6 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_wai.genblk1_L_2327_LC_14_21_6 .LUT_INIT=16'b0001000100000000;
    LogicCell40 \inst_midgetv_core.inst_wai.genblk1_L_2327_LC_14_21_6  (
            .in0(N__13344),
            .in1(N__13442),
            .in2(_gnd_net_),
            .in3(N__6924),
            .lcout(\inst_midgetv_core.Wai_7 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.leq0100.l_LC_15_13_0 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.leq0100.l_LC_15_13_0 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.leq0100.l_LC_15_13_0 .LUT_INIT=16'b0000000000000100;
    LogicCell40 \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.leq0100.l_LC_15_13_0  (
            .in0(N__7902),
            .in1(N__6216),
            .in2(N__8031),
            .in3(N__6312),
            .lcout(\inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.instr0100 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_ucodepc.rinx_7__I_0_i3_4_lut_LC_15_13_1 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_ucodepc.rinx_7__I_0_i3_4_lut_LC_15_13_1 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_ucodepc.rinx_7__I_0_i3_4_lut_LC_15_13_1 .LUT_INIT=16'b1111110010111000;
    LogicCell40 \inst_midgetv_core.inst_ucodepc.rinx_7__I_0_i3_4_lut_LC_15_13_1  (
            .in0(N__7823),
            .in1(N__7877),
            .in2(N__6283),
            .in3(N__11322),
            .lcout(\inst_midgetv_core.minx_4 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_ucodepc.rinx_7__I_0_i1_4_lut_LC_15_13_6 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_ucodepc.rinx_7__I_0_i1_4_lut_LC_15_13_6 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_ucodepc.rinx_7__I_0_i1_4_lut_LC_15_13_6 .LUT_INIT=16'b1111101011011000;
    LogicCell40 \inst_midgetv_core.inst_ucodepc.rinx_7__I_0_i1_4_lut_LC_15_13_6  (
            .in0(N__7876),
            .in1(N__11107),
            .in2(N__6241),
            .in3(N__7822),
            .lcout(\inst_midgetv_core.minx_2 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_ucodepc.inst_illegalop.i1_4_lut_adj_51_LC_15_14_0 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_ucodepc.inst_illegalop.i1_4_lut_adj_51_LC_15_14_0 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_ucodepc.inst_illegalop.i1_4_lut_adj_51_LC_15_14_0 .LUT_INIT=16'b1100110001001100;
    LogicCell40 \inst_midgetv_core.inst_ucodepc.inst_illegalop.i1_4_lut_adj_51_LC_15_14_0  (
            .in0(N__6586),
            .in1(N__10645),
            .in2(N__6517),
            .in3(N__8116),
            .lcout(\inst_midgetv_core.inst_ucodepc.illegal ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_progressctrl.i1_3_lut_LC_15_14_1 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_progressctrl.i1_3_lut_LC_15_14_1 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_progressctrl.i1_3_lut_LC_15_14_1 .LUT_INIT=16'b1100110011101110;
    LogicCell40 \inst_midgetv_core.inst_progressctrl.i1_3_lut_LC_15_14_1  (
            .in0(N__6748),
            .in1(N__6708),
            .in2(_gnd_net_),
            .in3(N__11957),
            .lcout(\inst_midgetv_core.inst_progressctrl.n2764 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_progressctrl.ctrlreg_we_I_7_2_lut_LC_15_14_2 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_progressctrl.ctrlreg_we_I_7_2_lut_LC_15_14_2 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_progressctrl.ctrlreg_we_I_7_2_lut_LC_15_14_2 .LUT_INIT=16'b1010101011111111;
    LogicCell40 \inst_midgetv_core.inst_progressctrl.ctrlreg_we_I_7_2_lut_LC_15_14_2  (
            .in0(N__11956),
            .in1(_gnd_net_),
            .in2(_gnd_net_),
            .in3(N__6696),
            .lcout(\inst_midgetv_core.inst_progressctrl.ctrlreg_we_N_84 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_progressctrl.badalignment_I_0_70_4_lut_LC_15_14_4 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_progressctrl.badalignment_I_0_70_4_lut_LC_15_14_4 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_progressctrl.badalignment_I_0_70_4_lut_LC_15_14_4 .LUT_INIT=16'b1010111110001111;
    LogicCell40 \inst_midgetv_core.inst_progressctrl.badalignment_I_0_70_4_lut_LC_15_14_4  (
            .in0(N__11857),
            .in1(N__12492),
            .in2(N__10660),
            .in3(N__12727),
            .lcout(\inst_midgetv_core.inst_progressctrl.badalignment ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_cmb_sa14_or_nCORERUNNING_LC_15_14_6 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_cmb_sa14_or_nCORERUNNING_LC_15_14_6 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_cmb_sa14_or_nCORERUNNING_LC_15_14_6 .LUT_INIT=16'b0011001111111111;
    LogicCell40 \inst_midgetv_core.inst_immexp_zfind_q.genblk1_cmb_sa14_or_nCORERUNNING_LC_15_14_6  (
            .in0(_gnd_net_),
            .in1(N__6697),
            .in2(_gnd_net_),
            .in3(N__10646),
            .lcout(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_nsa14_or_nCORERUNNING ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC15_0_0_LC_15_15_0 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC15_0_0_LC_15_15_0 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC15_0_0_LC_15_15_0 .LUT_INIT=16'b1100110010111000;
    LogicCell40 \inst_midgetv_core.inst_opreg.genblk1_OpC15_0_0_LC_15_15_0  (
            .in0(_gnd_net_),
            .in1(N__6617),
            .in2(N__6505),
            .in3(N__9375),
            .lcout(\inst_midgetv_core.INSTR_0 ),
            .ltout(\inst_midgetv_core.Di_0_cascade_ ),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__13812),
            .ce(N__9876),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_0.l_LC_15_15_1 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_0.l_LC_15_15_1 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_0.l_LC_15_15_1 .LUT_INIT=16'b0010010100110000;
    LogicCell40 \inst_midgetv_core.inst_alu.genblk1_inst.a_0.l_LC_15_15_1  (
            .in0(N__6579),
            .in1(N__9247),
            .in2(N__6568),
            .in3(N__9013),
            .lcout(\inst_midgetv_core.inst_alu.genblk1_inst.A_0 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC15_0_1_LC_15_15_2 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC15_0_1_LC_15_15_2 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC15_0_1_LC_15_15_2 .LUT_INIT=16'b1010101011100100;
    LogicCell40 \inst_midgetv_core.inst_opreg.genblk1_OpC15_0_1_LC_15_15_2  (
            .in0(N__6540),
            .in1(N__11508),
            .in2(_gnd_net_),
            .in3(N__9376),
            .lcout(\inst_midgetv_core.INSTR_1 ),
            .ltout(\inst_midgetv_core.Di_1_cascade_ ),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__13812),
            .ce(N__9876),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_1.l_LC_15_15_3 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_1.l_LC_15_15_3 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_1.l_LC_15_15_3 .LUT_INIT=16'b0101000000011100;
    LogicCell40 \inst_midgetv_core.inst_alu.genblk1_inst.a_1.l_LC_15_15_3  (
            .in0(N__9197),
            .in1(N__9012),
            .in2(N__6508),
            .in3(N__6503),
            .lcout(\inst_midgetv_core.inst_alu.genblk1_inst.A_1 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC15_0_2_LC_15_15_4 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC15_0_2_LC_15_15_4 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC15_0_2_LC_15_15_4 .LUT_INIT=16'b1010101011011000;
    LogicCell40 \inst_midgetv_core.inst_opreg.genblk1_OpC15_0_2_LC_15_15_4  (
            .in0(N__10557),
            .in1(_gnd_net_),
            .in2(N__11781),
            .in3(N__9377),
            .lcout(\inst_midgetv_core.INSTR_2 ),
            .ltout(\inst_midgetv_core.Di_2_cascade_ ),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__13812),
            .ce(N__9876),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_2.l_LC_15_15_5 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_2.l_LC_15_15_5 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_2.l_LC_15_15_5 .LUT_INIT=16'b0010010100110000;
    LogicCell40 \inst_midgetv_core.inst_alu.genblk1_inst.a_2.l_LC_15_15_5  (
            .in0(N__11509),
            .in1(N__9248),
            .in2(N__6877),
            .in3(N__9015),
            .lcout(\inst_midgetv_core.inst_alu.genblk1_inst.A_2 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC15_0_3_LC_15_15_6 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC15_0_3_LC_15_15_6 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC15_0_3_LC_15_15_6 .LUT_INIT=16'b1111000010101100;
    LogicCell40 \inst_midgetv_core.inst_opreg.genblk1_OpC15_0_3_LC_15_15_6  (
            .in0(_gnd_net_),
            .in1(N__10447),
            .in2(N__6862),
            .in3(N__9378),
            .lcout(\inst_midgetv_core.INSTR_3 ),
            .ltout(\inst_midgetv_core.Di_3_cascade_ ),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__13812),
            .ce(N__9876),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_3.l_LC_15_15_7 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_3.l_LC_15_15_7 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_3.l_LC_15_15_7 .LUT_INIT=16'b0101000000011100;
    LogicCell40 \inst_midgetv_core.inst_alu.genblk1_inst.a_3.l_LC_15_15_7  (
            .in0(N__9198),
            .in1(N__9014),
            .in2(N__6835),
            .in3(N__11769),
            .lcout(\inst_midgetv_core.inst_alu.genblk1_inst.A_3 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC15_0_4_LC_15_16_0 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC15_0_4_LC_15_16_0 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC15_0_4_LC_15_16_0 .LUT_INIT=16'b1111000010101100;
    LogicCell40 \inst_midgetv_core.inst_opreg.genblk1_OpC15_0_4_LC_15_16_0  (
            .in0(_gnd_net_),
            .in1(N__10354),
            .in2(N__6820),
            .in3(N__9379),
            .lcout(\inst_midgetv_core.INSTR_4 ),
            .ltout(\inst_midgetv_core.Di_4_cascade_ ),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__13808),
            .ce(N__9901),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_4.l_LC_15_16_1 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_4.l_LC_15_16_1 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_4.l_LC_15_16_1 .LUT_INIT=16'b0011000000011010;
    LogicCell40 \inst_midgetv_core.inst_alu.genblk1_inst.a_4.l_LC_15_16_1  (
            .in0(N__9081),
            .in1(N__9254),
            .in2(N__6805),
            .in3(N__10448),
            .lcout(\inst_midgetv_core.inst_alu.genblk1_inst.A_4 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC15_0_5_LC_15_16_2 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC15_0_5_LC_15_16_2 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC15_0_5_LC_15_16_2 .LUT_INIT=16'b1010101011100100;
    LogicCell40 \inst_midgetv_core.inst_opreg.genblk1_OpC15_0_5_LC_15_16_2  (
            .in0(N__6790),
            .in1(N__10228),
            .in2(_gnd_net_),
            .in3(N__9380),
            .lcout(\inst_midgetv_core.INSTR_5 ),
            .ltout(\inst_midgetv_core.Di_5_cascade_ ),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__13808),
            .ce(N__9901),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_5.l_LC_15_16_3 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_5.l_LC_15_16_3 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_5.l_LC_15_16_3 .LUT_INIT=16'b0000001011010010;
    LogicCell40 \inst_midgetv_core.inst_alu.genblk1_inst.a_5.l_LC_15_16_3  (
            .in0(N__9082),
            .in1(N__10355),
            .in2(N__6778),
            .in3(N__9255),
            .lcout(\inst_midgetv_core.inst_alu.genblk1_inst.A_5 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC15_0_6_LC_15_16_4 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC15_0_6_LC_15_16_4 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC15_0_6_LC_15_16_4 .LUT_INIT=16'b1111000010101100;
    LogicCell40 \inst_midgetv_core.inst_opreg.genblk1_OpC15_0_6_LC_15_16_4  (
            .in0(_gnd_net_),
            .in1(N__10132),
            .in2(N__6763),
            .in3(N__9381),
            .lcout(\inst_midgetv_core.INSTR_6 ),
            .ltout(\inst_midgetv_core.Di_6_cascade_ ),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__13808),
            .ce(N__9901),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_6.l_LC_15_16_5 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_6.l_LC_15_16_5 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_6.l_LC_15_16_5 .LUT_INIT=16'b0000010010110100;
    LogicCell40 \inst_midgetv_core.inst_alu.genblk1_inst.a_6.l_LC_15_16_5  (
            .in0(N__10229),
            .in1(N__9109),
            .in2(N__7084),
            .in3(N__9256),
            .lcout(\inst_midgetv_core.inst_alu.genblk1_inst.A_6 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC15_0_8_LC_15_16_6 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC15_0_8_LC_15_16_6 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC15_0_8_LC_15_16_6 .LUT_INIT=16'b1111101001000100;
    LogicCell40 \inst_midgetv_core.inst_opreg.genblk1_OpC15_0_8_LC_15_16_6  (
            .in0(N__9445),
            .in1(N__6913),
            .in2(N__8887),
            .in3(N__7069),
            .lcout(\inst_midgetv_core.INSTR_8 ),
            .ltout(\inst_midgetv_core.Di_8_cascade_ ),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__13808),
            .ce(N__9901),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_8.l_LC_15_16_7 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_8.l_LC_15_16_7 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_8.l_LC_15_16_7 .LUT_INIT=16'b0000001011010010;
    LogicCell40 \inst_midgetv_core.inst_alu.genblk1_inst.a_8.l_LC_15_16_7  (
            .in0(N__9083),
            .in1(N__13258),
            .in2(N__7054),
            .in3(N__9257),
            .lcout(\inst_midgetv_core.inst_alu.genblk1_inst.A_8 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC15_0_10_LC_15_17_0 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC15_0_10_LC_15_17_0 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC15_0_10_LC_15_17_0 .LUT_INIT=16'b1111000010101100;
    LogicCell40 \inst_midgetv_core.inst_opreg.genblk1_OpC15_0_10_LC_15_17_0  (
            .in0(_gnd_net_),
            .in1(N__11722),
            .in2(N__7036),
            .in3(N__9419),
            .lcout(\inst_midgetv_core.INSTR_10 ),
            .ltout(\inst_midgetv_core.Di_10_cascade_ ),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__13802),
            .ce(N__9899),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_10.l_LC_15_17_1 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_10.l_LC_15_17_1 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_10.l_LC_15_17_1 .LUT_INIT=16'b0010010100110000;
    LogicCell40 \inst_midgetv_core.inst_alu.genblk1_inst.a_10.l_LC_15_17_1  (
            .in0(N__6962),
            .in1(N__9262),
            .in2(N__7021),
            .in3(N__9087),
            .lcout(\inst_midgetv_core.inst_alu.genblk1_inst.A_10 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC15_0_11_LC_15_17_2 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC15_0_11_LC_15_17_2 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC15_0_11_LC_15_17_2 .LUT_INIT=16'b1111000010101100;
    LogicCell40 \inst_midgetv_core.inst_opreg.genblk1_OpC15_0_11_LC_15_17_2  (
            .in0(_gnd_net_),
            .in1(N__7280),
            .in2(N__7003),
            .in3(N__9420),
            .lcout(\inst_midgetv_core.INSTR_11 ),
            .ltout(\inst_midgetv_core.Di_11_cascade_ ),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__13802),
            .ce(N__9899),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_11.l_LC_15_17_3 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_11.l_LC_15_17_3 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_11.l_LC_15_17_3 .LUT_INIT=16'b0010010100110000;
    LogicCell40 \inst_midgetv_core.inst_alu.genblk1_inst.a_11.l_LC_15_17_3  (
            .in0(N__11723),
            .in1(N__9263),
            .in2(N__6988),
            .in3(N__9088),
            .lcout(\inst_midgetv_core.inst_alu.genblk1_inst.A_11 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC15_0_9_LC_15_17_4 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC15_0_9_LC_15_17_4 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC15_0_9_LC_15_17_4 .LUT_INIT=16'b1111000010101100;
    LogicCell40 \inst_midgetv_core.inst_opreg.genblk1_OpC15_0_9_LC_15_17_4  (
            .in0(_gnd_net_),
            .in1(N__6961),
            .in2(N__6943),
            .in3(N__9418),
            .lcout(\inst_midgetv_core.INSTR_9 ),
            .ltout(\inst_midgetv_core.Di_9_cascade_ ),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__13802),
            .ce(N__9899),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_9.l_LC_15_17_5 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_9.l_LC_15_17_5 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_9.l_LC_15_17_5 .LUT_INIT=16'b0101000000011100;
    LogicCell40 \inst_midgetv_core.inst_alu.genblk1_inst.a_9.l_LC_15_17_5  (
            .in0(N__9249),
            .in1(N__9086),
            .in2(N__6928),
            .in3(N__6914),
            .lcout(\inst_midgetv_core.inst_alu.genblk1_inst.A_9 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC15_0_12_LC_15_17_6 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC15_0_12_LC_15_17_6 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC15_0_12_LC_15_17_6 .LUT_INIT=16'b1111000010101100;
    LogicCell40 \inst_midgetv_core.inst_opreg.genblk1_OpC15_0_12_LC_15_17_6  (
            .in0(_gnd_net_),
            .in1(N__8606),
            .in2(N__7306),
            .in3(N__9421),
            .lcout(\inst_midgetv_core.INSTR_12 ),
            .ltout(\inst_midgetv_core.Di_12_cascade_ ),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__13802),
            .ce(N__9899),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_12.l_LC_15_17_7 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_12.l_LC_15_17_7 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_12.l_LC_15_17_7 .LUT_INIT=16'b0010010100110000;
    LogicCell40 \inst_midgetv_core.inst_alu.genblk1_inst.a_12.l_LC_15_17_7  (
            .in0(N__7281),
            .in1(N__9264),
            .in2(N__7267),
            .in3(N__9089),
            .lcout(\inst_midgetv_core.inst_alu.genblk1_inst.A_12 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC31_16_29_LC_15_18_0 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC31_16_29_LC_15_18_0 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC31_16_29_LC_15_18_0 .LUT_INIT=16'b1111000010101100;
    LogicCell40 \inst_midgetv_core.inst_opreg.genblk1_OpC31_16_29_LC_15_18_0  (
            .in0(_gnd_net_),
            .in1(N__7187),
            .in2(N__7252),
            .in3(N__9423),
            .lcout(\inst_midgetv_core.FUNC7_4 ),
            .ltout(\inst_midgetv_core.Di_29_cascade_ ),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__13798),
            .ce(N__9911),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_29.l_LC_15_18_1 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_29.l_LC_15_18_1 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_29.l_LC_15_18_1 .LUT_INIT=16'b0011000000011010;
    LogicCell40 \inst_midgetv_core.inst_alu.genblk1_inst.a_29.l_LC_15_18_1  (
            .in0(N__9085),
            .in1(N__9259),
            .in2(N__7234),
            .in3(N__7544),
            .lcout(\inst_midgetv_core.inst_alu.genblk1_inst.A_29 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC31_16_30_LC_15_18_2 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC31_16_30_LC_15_18_2 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC31_16_30_LC_15_18_2 .LUT_INIT=16'b1111000010101100;
    LogicCell40 \inst_midgetv_core.inst_opreg.genblk1_OpC31_16_30_LC_15_18_2  (
            .in0(_gnd_net_),
            .in1(N__7126),
            .in2(N__7216),
            .in3(N__9424),
            .lcout(\inst_midgetv_core.FUNC7_5 ),
            .ltout(\inst_midgetv_core.Di_30_cascade_ ),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__13798),
            .ce(N__9911),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_30.l_LC_15_18_3 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_30.l_LC_15_18_3 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_30.l_LC_15_18_3 .LUT_INIT=16'b0010010100110000;
    LogicCell40 \inst_midgetv_core.inst_alu.genblk1_inst.a_30.l_LC_15_18_3  (
            .in0(N__7188),
            .in1(N__9260),
            .in2(N__7174),
            .in3(N__9118),
            .lcout(\inst_midgetv_core.inst_alu.genblk1_inst.A_30 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC31_16_31_LC_15_18_4 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC31_16_31_LC_15_18_4 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC31_16_31_LC_15_18_4 .LUT_INIT=16'b1010101011100100;
    LogicCell40 \inst_midgetv_core.inst_opreg.genblk1_OpC31_16_31_LC_15_18_4  (
            .in0(N__11641),
            .in1(N__7159),
            .in2(_gnd_net_),
            .in3(N__9425),
            .lcout(\inst_midgetv_core.FUNC7_6 ),
            .ltout(\inst_midgetv_core.Di_31_cascade_ ),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__13798),
            .ce(N__9911),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_31.l_LC_15_18_5 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_31.l_LC_15_18_5 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_31.l_LC_15_18_5 .LUT_INIT=16'b0010010100110000;
    LogicCell40 \inst_midgetv_core.inst_alu.genblk1_inst.a_31.l_LC_15_18_5  (
            .in0(N__7127),
            .in1(N__9261),
            .in2(N__7105),
            .in3(N__9119),
            .lcout(\inst_midgetv_core.A31 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC15_0_7_LC_15_18_6 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC15_0_7_LC_15_18_6 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC15_0_7_LC_15_18_6 .LUT_INIT=16'b1010101011100100;
    LogicCell40 \inst_midgetv_core.inst_opreg.genblk1_OpC15_0_7_LC_15_18_6  (
            .in0(N__7504),
            .in1(N__13265),
            .in2(_gnd_net_),
            .in3(N__9422),
            .lcout(\inst_midgetv_core.INSTR_7 ),
            .ltout(\inst_midgetv_core.Di_7_cascade_ ),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__13798),
            .ce(N__9911),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_7.l_LC_15_18_7 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_7.l_LC_15_18_7 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_7.l_LC_15_18_7 .LUT_INIT=16'b0011000000011010;
    LogicCell40 \inst_midgetv_core.inst_alu.genblk1_inst.a_7.l_LC_15_18_7  (
            .in0(N__9084),
            .in1(N__9258),
            .in2(N__7489),
            .in3(N__10142),
            .lcout(\inst_midgetv_core.inst_alu.genblk1_inst.A_7 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC31_16_17_LC_15_19_0 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC31_16_17_LC_15_19_0 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC31_16_17_LC_15_19_0 .LUT_INIT=16'b1101100111001000;
    LogicCell40 \inst_midgetv_core.inst_opreg.genblk1_OpC31_16_17_LC_15_19_0  (
            .in0(N__9430),
            .in1(N__7474),
            .in2(_gnd_net_),
            .in3(N__7427),
            .lcout(\inst_midgetv_core.INSTR_17 ),
            .ltout(\inst_midgetv_core.Di_17_cascade_ ),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__13793),
            .ce(N__9898),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_17.l_LC_15_19_1 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_17.l_LC_15_19_1 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_17.l_LC_15_19_1 .LUT_INIT=16'b0101000000011100;
    LogicCell40 \inst_midgetv_core.inst_alu.genblk1_inst.a_17.l_LC_15_19_1  (
            .in0(N__9253),
            .in1(N__9114),
            .in2(N__7459),
            .in3(N__9507),
            .lcout(\inst_midgetv_core.inst_alu.genblk1_inst.A_17 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC31_16_18_LC_15_19_2 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC31_16_18_LC_15_19_2 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC31_16_18_LC_15_19_2 .LUT_INIT=16'b1101100111001000;
    LogicCell40 \inst_midgetv_core.inst_opreg.genblk1_OpC31_16_18_LC_15_19_2  (
            .in0(N__9431),
            .in1(N__7444),
            .in2(_gnd_net_),
            .in3(N__7376),
            .lcout(\inst_midgetv_core.INSTR_18 ),
            .ltout(\inst_midgetv_core.Di_18_cascade_ ),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__13793),
            .ce(N__9898),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_18.l_LC_15_19_3 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_18.l_LC_15_19_3 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_18.l_LC_15_19_3 .LUT_INIT=16'b0010010100110000;
    LogicCell40 \inst_midgetv_core.inst_alu.genblk1_inst.a_18.l_LC_15_19_3  (
            .in0(N__7428),
            .in1(N__9294),
            .in2(N__7408),
            .in3(N__9115),
            .lcout(\inst_midgetv_core.inst_alu.genblk1_inst.A_18 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC31_16_19_LC_15_19_4 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC31_16_19_LC_15_19_4 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC31_16_19_LC_15_19_4 .LUT_INIT=16'b1010111010100100;
    LogicCell40 \inst_midgetv_core.inst_opreg.genblk1_OpC31_16_19_LC_15_19_4  (
            .in0(N__7393),
            .in1(N__7748),
            .in2(N__9455),
            .in3(_gnd_net_),
            .lcout(\inst_midgetv_core.INSTR_19 ),
            .ltout(\inst_midgetv_core.Di_19_cascade_ ),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__13793),
            .ce(N__9898),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_19.l_LC_15_19_5 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_19.l_LC_15_19_5 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_19.l_LC_15_19_5 .LUT_INIT=16'b0010010100110000;
    LogicCell40 \inst_midgetv_core.inst_alu.genblk1_inst.a_19.l_LC_15_19_5  (
            .in0(N__7377),
            .in1(N__9295),
            .in2(N__7357),
            .in3(N__9116),
            .lcout(\inst_midgetv_core.inst_alu.genblk1_inst.A_19 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC31_16_20_LC_15_19_6 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC31_16_20_LC_15_19_6 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC31_16_20_LC_15_19_6 .LUT_INIT=16'b1101100111001000;
    LogicCell40 \inst_midgetv_core.inst_opreg.genblk1_OpC31_16_20_LC_15_19_6  (
            .in0(N__9435),
            .in1(N__7345),
            .in2(_gnd_net_),
            .in3(N__7325),
            .lcout(\inst_midgetv_core.INSTR_20 ),
            .ltout(\inst_midgetv_core.Di_20_cascade_ ),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__13793),
            .ce(N__9898),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_20.l_LC_15_19_7 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_20.l_LC_15_19_7 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_20.l_LC_15_19_7 .LUT_INIT=16'b0010010100110000;
    LogicCell40 \inst_midgetv_core.inst_alu.genblk1_inst.a_20.l_LC_15_19_7  (
            .in0(N__7749),
            .in1(N__9296),
            .in2(N__7729),
            .in3(N__9117),
            .lcout(\inst_midgetv_core.inst_alu.genblk1_inst.A_20 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC31_16_25_LC_15_20_0 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC31_16_25_LC_15_20_0 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC31_16_25_LC_15_20_0 .LUT_INIT=16'b1111000010101100;
    LogicCell40 \inst_midgetv_core.inst_opreg.genblk1_OpC31_16_25_LC_15_20_0  (
            .in0(_gnd_net_),
            .in1(N__7637),
            .in2(N__7717),
            .in3(N__9456),
            .lcout(\inst_midgetv_core.FUNC7_0 ),
            .ltout(\inst_midgetv_core.Di_25_cascade_ ),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__13790),
            .ce(N__9919),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_25.l_LC_15_20_1 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_25.l_LC_15_20_1 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_25.l_LC_15_20_1 .LUT_INIT=16'b0011000000011010;
    LogicCell40 \inst_midgetv_core.inst_alu.genblk1_inst.a_25.l_LC_15_20_1  (
            .in0(N__9120),
            .in1(N__9297),
            .in2(N__7699),
            .in3(N__7695),
            .lcout(\inst_midgetv_core.inst_alu.genblk1_inst.A_25 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC31_16_26_LC_15_20_2 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC31_16_26_LC_15_20_2 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC31_16_26_LC_15_20_2 .LUT_INIT=16'b1111000010101100;
    LogicCell40 \inst_midgetv_core.inst_opreg.genblk1_OpC31_16_26_LC_15_20_2  (
            .in0(_gnd_net_),
            .in1(N__7580),
            .in2(N__7657),
            .in3(N__9457),
            .lcout(\inst_midgetv_core.FUNC7_1 ),
            .ltout(\inst_midgetv_core.Di_26_cascade_ ),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__13790),
            .ce(N__9919),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_26.l_LC_15_20_3 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_26.l_LC_15_20_3 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_26.l_LC_15_20_3 .LUT_INIT=16'b0010010100110000;
    LogicCell40 \inst_midgetv_core.inst_alu.genblk1_inst.a_26.l_LC_15_20_3  (
            .in0(N__7638),
            .in1(N__9298),
            .in2(N__7618),
            .in3(N__9122),
            .lcout(\inst_midgetv_core.inst_alu.genblk1_inst.A_26 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC31_16_27_LC_15_20_4 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC31_16_27_LC_15_20_4 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC31_16_27_LC_15_20_4 .LUT_INIT=16'b1111000010101100;
    LogicCell40 \inst_midgetv_core.inst_opreg.genblk1_OpC31_16_27_LC_15_20_4  (
            .in0(_gnd_net_),
            .in1(N__8090),
            .in2(N__7603),
            .in3(N__9458),
            .lcout(\inst_midgetv_core.FUNC7_2 ),
            .ltout(\inst_midgetv_core.Di_27_cascade_ ),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__13790),
            .ce(N__9919),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_27.l_LC_15_20_5 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_27.l_LC_15_20_5 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_27.l_LC_15_20_5 .LUT_INIT=16'b0010010100110000;
    LogicCell40 \inst_midgetv_core.inst_alu.genblk1_inst.a_27.l_LC_15_20_5  (
            .in0(N__7581),
            .in1(N__9299),
            .in2(N__7561),
            .in3(N__9123),
            .lcout(\inst_midgetv_core.inst_alu.genblk1_inst.A_27 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC31_16_28_LC_15_20_6 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC31_16_28_LC_15_20_6 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC31_16_28_LC_15_20_6 .LUT_INIT=16'b1111000010101100;
    LogicCell40 \inst_midgetv_core.inst_opreg.genblk1_OpC31_16_28_LC_15_20_6  (
            .in0(_gnd_net_),
            .in1(N__7545),
            .in2(N__7525),
            .in3(N__9459),
            .lcout(\inst_midgetv_core.FUNC7_3 ),
            .ltout(\inst_midgetv_core.Di_28_cascade_ ),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__13790),
            .ce(N__9919),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_28.l_LC_15_20_7 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_28.l_LC_15_20_7 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_28.l_LC_15_20_7 .LUT_INIT=16'b0010010100110000;
    LogicCell40 \inst_midgetv_core.inst_alu.genblk1_inst.a_28.l_LC_15_20_7  (
            .in0(N__8091),
            .in1(N__9300),
            .in2(N__8071),
            .in3(N__9121),
            .lcout(\inst_midgetv_core.inst_alu.genblk1_inst.A_28 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_ucodepc.rinx_1__I_0_4_lut_LC_16_13_0 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_ucodepc.rinx_1__I_0_4_lut_LC_16_13_0 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_ucodepc.rinx_1__I_0_4_lut_LC_16_13_0 .LUT_INIT=16'b1111110010111000;
    LogicCell40 \inst_midgetv_core.inst_ucodepc.rinx_1__I_0_4_lut_LC_16_13_0  (
            .in0(N__7825),
            .in1(N__7869),
            .in2(N__8053),
            .in3(N__8149),
            .lcout(\inst_midgetv_core.minx_1 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_ucodepc.rinx_7__I_0_i4_4_lut_LC_16_13_1 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_ucodepc.rinx_7__I_0_i4_4_lut_LC_16_13_1 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_ucodepc.rinx_7__I_0_i4_4_lut_LC_16_13_1 .LUT_INIT=16'b1111101011011000;
    LogicCell40 \inst_midgetv_core.inst_ucodepc.rinx_7__I_0_i4_4_lut_LC_16_13_1  (
            .in0(N__7873),
            .in1(N__8212),
            .in2(N__8011),
            .in3(N__7826),
            .lcout(\inst_midgetv_core.minx_5 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_ucodepc.usedinx_or_RST_I_notcorerunning_I_0_2_lut_LC_16_13_2 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_ucodepc.usedinx_or_RST_I_notcorerunning_I_0_2_lut_LC_16_13_2 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_ucodepc.usedinx_or_RST_I_notcorerunning_I_0_2_lut_LC_16_13_2 .LUT_INIT=16'b1111111100110011;
    LogicCell40 \inst_midgetv_core.inst_ucodepc.usedinx_or_RST_I_notcorerunning_I_0_2_lut_LC_16_13_2  (
            .in0(_gnd_net_),
            .in1(N__10650),
            .in2(_gnd_net_),
            .in3(N__11202),
            .lcout(\inst_midgetv_core.inst_ucodepc.usedinx_or_RST_I_notcorerunning ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_ucodepc.rinx_7__I_0_i6_4_lut_LC_16_13_3 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_ucodepc.rinx_7__I_0_i6_4_lut_LC_16_13_3 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_ucodepc.rinx_7__I_0_i6_4_lut_LC_16_13_3 .LUT_INIT=16'b1111101001110010;
    LogicCell40 \inst_midgetv_core.inst_ucodepc.rinx_7__I_0_i6_4_lut_LC_16_13_3  (
            .in0(N__7874),
            .in1(N__7774),
            .in2(N__7966),
            .in3(N__7827),
            .lcout(\inst_midgetv_core.minx_7 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_ucodepc.rinx_7__I_0_i2_4_lut_LC_16_13_5 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_ucodepc.rinx_7__I_0_i2_4_lut_LC_16_13_5 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_ucodepc.rinx_7__I_0_i2_4_lut_LC_16_13_5 .LUT_INIT=16'b1111110010101100;
    LogicCell40 \inst_midgetv_core.inst_ucodepc.rinx_7__I_0_i2_4_lut_LC_16_13_5  (
            .in0(N__8341),
            .in1(N__7921),
            .in2(N__7881),
            .in3(N__7824),
            .lcout(\inst_midgetv_core.minx_3 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_ucodepc.rinx_7__I_0_i5_4_lut_LC_16_13_7 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_ucodepc.rinx_7__I_0_i5_4_lut_LC_16_13_7 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_ucodepc.rinx_7__I_0_i5_4_lut_LC_16_13_7 .LUT_INIT=16'b1111101011011000;
    LogicCell40 \inst_midgetv_core.inst_ucodepc.rinx_7__I_0_i5_4_lut_LC_16_13_7  (
            .in0(N__7875),
            .in1(N__8131),
            .in2(N__7843),
            .in3(N__7828),
            .lcout(\inst_midgetv_core.minx_6 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_ucodepc.i1_3_lut_LC_16_14_0 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_ucodepc.i1_3_lut_LC_16_14_0 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_ucodepc.i1_3_lut_LC_16_14_0 .LUT_INIT=16'b1000100011111111;
    LogicCell40 \inst_midgetv_core.inst_ucodepc.i1_3_lut_LC_16_14_0  (
            .in0(N__11256),
            .in1(N__8143),
            .in2(_gnd_net_),
            .in3(N__8561),
            .lcout(\inst_midgetv_core.inst_ucodepc.n15 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_l_sa09h_LC_16_14_3 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_l_sa09h_LC_16_14_3 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_l_sa09h_LC_16_14_3 .LUT_INIT=16'b1011101100011001;
    LogicCell40 \inst_midgetv_core.inst_immexp_zfind_q.genblk1_l_sa09h_LC_16_14_3  (
            .in0(N__11319),
            .in1(N__11252),
            .in2(N__8515),
            .in3(N__11108),
            .lcout(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_sa09h ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_ucodepc.i3950_4_lut_LC_16_14_4 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_ucodepc.i3950_4_lut_LC_16_14_4 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_ucodepc.i3950_4_lut_LC_16_14_4 .LUT_INIT=16'b1110110011001100;
    LogicCell40 \inst_midgetv_core.inst_ucodepc.i3950_4_lut_LC_16_14_4  (
            .in0(N__11110),
            .in1(N__8137),
            .in2(N__11266),
            .in3(N__8340),
            .lcout(\inst_midgetv_core.inst_ucodepc.n5603 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_ucodepc.i29_3_lut_LC_16_14_5 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_ucodepc.i29_3_lut_LC_16_14_5 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_ucodepc.i29_3_lut_LC_16_14_5 .LUT_INIT=16'b0011001110001000;
    LogicCell40 \inst_midgetv_core.inst_ucodepc.i29_3_lut_LC_16_14_5  (
            .in0(N__8339),
            .in1(N__8511),
            .in2(_gnd_net_),
            .in3(N__11109),
            .lcout(\inst_midgetv_core.inst_ucodepc.n17 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_ucodepc.i255_4_lut_LC_16_14_6 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_ucodepc.i255_4_lut_LC_16_14_6 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_ucodepc.i255_4_lut_LC_16_14_6 .LUT_INIT=16'b1011100010101010;
    LogicCell40 \inst_midgetv_core.inst_ucodepc.i255_4_lut_LC_16_14_6  (
            .in0(N__8510),
            .in1(N__11320),
            .in2(N__8415),
            .in3(N__8338),
            .lcout(\inst_midgetv_core.inst_ucodepc.dinx_1_N_145_0 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_ucodepc.i3956_4_lut_LC_16_15_0 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_ucodepc.i3956_4_lut_LC_16_15_0 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_ucodepc.i3956_4_lut_LC_16_15_0 .LUT_INIT=16'b1111011100000000;
    LogicCell40 \inst_midgetv_core.inst_ucodepc.i3956_4_lut_LC_16_15_0  (
            .in0(N__11084),
            .in1(N__11245),
            .in2(N__8514),
            .in3(N__8666),
            .lcout(\inst_midgetv_core.inst_ucodepc.n5613 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_ucodepc.inst_illegalop.i1545_4_lut_LC_16_15_2 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_ucodepc.inst_illegalop.i1545_4_lut_LC_16_15_2 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_ucodepc.inst_illegalop.i1545_4_lut_LC_16_15_2 .LUT_INIT=16'b1111010010100100;
    LogicCell40 \inst_midgetv_core.inst_ucodepc.inst_illegalop.i1545_4_lut_LC_16_15_2  (
            .in0(N__11083),
            .in1(N__11244),
            .in2(N__8513),
            .in3(N__8322),
            .lcout(\inst_midgetv_core.inst_ucodepc.inst_illegalop.genblk2_illegal_a ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_ucodepc.inst_illegalop.i2_4_lut_adj_50_LC_16_15_3 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_ucodepc.inst_illegalop.i2_4_lut_adj_50_LC_16_15_3 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_ucodepc.inst_illegalop.i2_4_lut_adj_50_LC_16_15_3 .LUT_INIT=16'b1111111011110010;
    LogicCell40 \inst_midgetv_core.inst_ucodepc.inst_illegalop.i2_4_lut_adj_50_LC_16_15_3  (
            .in0(N__8122),
            .in1(N__11300),
            .in2(N__8110),
            .in3(N__8521),
            .lcout(\inst_midgetv_core.inst_ucodepc.inst_illegalop.n6 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_ucodepc.inst_illegalop.i1_4_lut_adj_49_LC_16_15_4 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_ucodepc.inst_illegalop.i1_4_lut_adj_49_LC_16_15_4 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_ucodepc.inst_illegalop.i1_4_lut_adj_49_LC_16_15_4 .LUT_INIT=16'b1111110010101000;
    LogicCell40 \inst_midgetv_core.inst_ucodepc.inst_illegalop.i1_4_lut_adj_49_LC_16_15_4  (
            .in0(N__8716),
            .in1(N__8101),
            .in2(N__8266),
            .in3(N__8347),
            .lcout(\inst_midgetv_core.inst_ucodepc.inst_illegalop.n2 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_ucodepc.inst_illegalop.i2_4_lut_LC_16_15_6 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_ucodepc.inst_illegalop.i2_4_lut_LC_16_15_6 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_ucodepc.inst_illegalop.i2_4_lut_LC_16_15_6 .LUT_INIT=16'b0000001000000000;
    LogicCell40 \inst_midgetv_core.inst_ucodepc.inst_illegalop.i2_4_lut_LC_16_15_6  (
            .in0(N__11082),
            .in1(N__11243),
            .in2(N__11315),
            .in3(N__8321),
            .lcout(\inst_midgetv_core.inst_ucodepc.inst_illegalop.genblk1_checkfunct7_N_286 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_ucodepc.inst_illegalop.i256_4_lut_LC_16_16_0 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_ucodepc.inst_illegalop.i256_4_lut_LC_16_16_0 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_ucodepc.inst_illegalop.i256_4_lut_LC_16_16_0 .LUT_INIT=16'b0100110000011100;
    LogicCell40 \inst_midgetv_core.inst_ucodepc.inst_illegalop.i256_4_lut_LC_16_16_0  (
            .in0(N__8664),
            .in1(N__8559),
            .in2(N__8336),
            .in3(N__8190),
            .lcout(\inst_midgetv_core.inst_ucodepc.inst_illegalop.n497 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_ucodepc.inst_illegalop.i3967_4_lut_LC_16_16_1 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_ucodepc.inst_illegalop.i3967_4_lut_LC_16_16_1 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_ucodepc.inst_illegalop.i3967_4_lut_LC_16_16_1 .LUT_INIT=16'b0111001100110011;
    LogicCell40 \inst_midgetv_core.inst_ucodepc.inst_illegalop.i3967_4_lut_LC_16_16_1  (
            .in0(N__8194),
            .in1(N__8473),
            .in2(N__8281),
            .in3(N__8899),
            .lcout(\inst_midgetv_core.inst_ucodepc.inst_illegalop.n5605 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_ucodepc.inst_illegalop.i1_4_lut_LC_16_16_2 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_ucodepc.inst_illegalop.i1_4_lut_LC_16_16_2 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_ucodepc.inst_illegalop.i1_4_lut_LC_16_16_2 .LUT_INIT=16'b0010011100000000;
    LogicCell40 \inst_midgetv_core.inst_ucodepc.inst_illegalop.i1_4_lut_LC_16_16_2  (
            .in0(N__11242),
            .in1(N__11085),
            .in2(N__8512),
            .in3(N__8320),
            .lcout(\inst_midgetv_core.inst_ucodepc.inst_illegalop.n8 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_ucodepc.inst_illegalop.i1_2_lut_LC_16_16_3 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_ucodepc.inst_illegalop.i1_2_lut_LC_16_16_3 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_ucodepc.inst_illegalop.i1_2_lut_LC_16_16_3 .LUT_INIT=16'b0000000011001100;
    LogicCell40 \inst_midgetv_core.inst_ucodepc.inst_illegalop.i1_2_lut_LC_16_16_3  (
            .in0(_gnd_net_),
            .in1(N__11081),
            .in2(_gnd_net_),
            .in3(N__8663),
            .lcout(\inst_midgetv_core.inst_ucodepc.inst_illegalop.n2575 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_mimux.genblk1_sa00mod_r_LC_16_16_4 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_mimux.genblk1_sa00mod_r_LC_16_16_4 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_mimux.genblk1_sa00mod_r_LC_16_16_4 .LUT_INIT=16'b0000000000000100;
    LogicCell40 \inst_midgetv_core.inst_mimux.genblk1_sa00mod_r_LC_16_16_4  (
            .in0(N__9679),
            .in1(N__10666),
            .in2(_gnd_net_),
            .in3(N__13615),
            .lcout(\inst_midgetv_core.inst_mimux.genblk1_sa00mod ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__13813),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_ucodepc.inst_illegalop.i4_4_lut_LC_16_16_5 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_ucodepc.inst_illegalop.i4_4_lut_LC_16_16_5 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_ucodepc.inst_illegalop.i4_4_lut_LC_16_16_5 .LUT_INIT=16'b1110111011111110;
    LogicCell40 \inst_midgetv_core.inst_ucodepc.inst_illegalop.i4_4_lut_LC_16_16_5  (
            .in0(N__8466),
            .in1(N__8439),
            .in2(N__8414),
            .in3(N__8353),
            .lcout(\inst_midgetv_core.inst_ucodepc.inst_illegalop.n11 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_ucodepc.inst_illegalop.i3_4_lut_LC_16_16_7 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_ucodepc.inst_illegalop.i3_4_lut_LC_16_16_7 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_ucodepc.inst_illegalop.i3_4_lut_LC_16_16_7 .LUT_INIT=16'b0001000000000000;
    LogicCell40 \inst_midgetv_core.inst_ucodepc.inst_illegalop.i3_4_lut_LC_16_16_7  (
            .in0(N__8319),
            .in1(N__11241),
            .in2(N__8204),
            .in3(N__8277),
            .lcout(\inst_midgetv_core.inst_ucodepc.inst_illegalop.genblk1_checkfunct7_N_281 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_condcode.INSTR_14__I_0_32_i7_4_lut_LC_16_17_1 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_condcode.INSTR_14__I_0_32_i7_4_lut_LC_16_17_1 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_condcode.INSTR_14__I_0_32_i7_4_lut_LC_16_17_1 .LUT_INIT=16'b0110011011110000;
    LogicCell40 \inst_midgetv_core.inst_condcode.INSTR_14__I_0_32_i7_4_lut_LC_16_17_1  (
            .in0(N__8196),
            .in1(N__8257),
            .in2(N__8158),
            .in3(N__8560),
            .lcout(\inst_midgetv_core.is_brcond ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam STB_O_I_0_2_lut_LC_16_17_3.C_ON=1'b0;
    defparam STB_O_I_0_2_lut_LC_16_17_3.SEQ_MODE=4'b0000;
    defparam STB_O_I_0_2_lut_LC_16_17_3.LUT_INIT=16'b1100110000000000;
    LogicCell40 STB_O_I_0_2_lut_LC_16_17_3 (
            .in0(_gnd_net_),
            .in1(N__11795),
            .in2(_gnd_net_),
            .in3(N__13545),
            .lcout(uart_ACK_O),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_condcode.i3953_3_lut_LC_16_17_4 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_condcode.i3953_3_lut_LC_16_17_4 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_condcode.i3953_3_lut_LC_16_17_4 .LUT_INIT=16'b0000000010011001;
    LogicCell40 \inst_midgetv_core.inst_condcode.i3953_3_lut_LC_16_17_4  (
            .in0(N__8224),
            .in1(N__8195),
            .in2(_gnd_net_),
            .in3(N__8665),
            .lcout(\inst_midgetv_core.inst_condcode.n5618 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_ucodepc.inst_illegalop.i9_4_lut_LC_16_17_5 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_ucodepc.inst_illegalop.i9_4_lut_LC_16_17_5 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_ucodepc.inst_illegalop.i9_4_lut_LC_16_17_5 .LUT_INIT=16'b1111111111111110;
    LogicCell40 \inst_midgetv_core.inst_ucodepc.inst_illegalop.i9_4_lut_LC_16_17_5  (
            .in0(N__13130),
            .in1(N__10019),
            .in2(N__8701),
            .in3(N__8707),
            .lcout(\inst_midgetv_core.inst_ucodepc.inst_illegalop.genblk1_illegal_rs1_rd_N_300 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_inputmux.genblk1_ireg__i1_LC_16_17_6 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_inputmux.genblk1_ireg__i1_LC_16_17_6 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_inputmux.genblk1_ireg__i1_LC_16_17_6 .LUT_INIT=16'b1101010110000000;
    LogicCell40 \inst_midgetv_core.inst_inputmux.genblk1_ireg__i1_LC_16_17_6  (
            .in0(N__10662),
            .in1(N__8893),
            .in2(N__10593),
            .in3(N__8886),
            .lcout(rDee_8),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__13809),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_ucodepc.inst_illegalop.i5_4_lut_LC_16_18_1 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_ucodepc.inst_illegalop.i5_4_lut_LC_16_18_1 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_ucodepc.inst_illegalop.i5_4_lut_LC_16_18_1 .LUT_INIT=16'b1111111111111110;
    LogicCell40 \inst_midgetv_core.inst_ucodepc.inst_illegalop.i5_4_lut_LC_16_18_1  (
            .in0(N__8849),
            .in1(N__8825),
            .in2(N__8795),
            .in3(N__8749),
            .lcout(\inst_midgetv_core.inst_ucodepc.inst_illegalop.n12 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_ucodepc.inst_illegalop.i7_4_lut_LC_16_18_3 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_ucodepc.inst_illegalop.i7_4_lut_LC_16_18_3 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_ucodepc.inst_illegalop.i7_4_lut_LC_16_18_3 .LUT_INIT=16'b1111111111111110;
    LogicCell40 \inst_midgetv_core.inst_ucodepc.inst_illegalop.i7_4_lut_LC_16_18_3  (
            .in0(N__10742),
            .in1(N__14324),
            .in2(N__10262),
            .in3(N__15146),
            .lcout(\inst_midgetv_core.inst_ucodepc.inst_illegalop.n17 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_ucodepc.inst_illegalop.i6_4_lut_LC_16_18_4 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_ucodepc.inst_illegalop.i6_4_lut_LC_16_18_4 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_ucodepc.inst_illegalop.i6_4_lut_LC_16_18_4 .LUT_INIT=16'b1111111111111110;
    LogicCell40 \inst_midgetv_core.inst_ucodepc.inst_illegalop.i6_4_lut_LC_16_18_4  (
            .in0(N__9980),
            .in1(N__13094),
            .in2(N__14420),
            .in3(N__11033),
            .lcout(\inst_midgetv_core.inst_ucodepc.inst_illegalop.n16 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC15_0_13_LC_16_19_0 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC15_0_13_LC_16_19_0 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC15_0_13_LC_16_19_0 .LUT_INIT=16'b1111000010101100;
    LogicCell40 \inst_midgetv_core.inst_opreg.genblk1_OpC15_0_13_LC_16_19_0  (
            .in0(_gnd_net_),
            .in1(N__9599),
            .in2(N__8692),
            .in3(N__9426),
            .lcout(\inst_midgetv_core.INSTR_13 ),
            .ltout(\inst_midgetv_core.Di_13_cascade_ ),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__13799),
            .ce(N__9900),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_13.l_LC_16_19_1 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_13.l_LC_16_19_1 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_13.l_LC_16_19_1 .LUT_INIT=16'b0101000000011100;
    LogicCell40 \inst_midgetv_core.inst_alu.genblk1_inst.a_13.l_LC_16_19_1  (
            .in0(N__9293),
            .in1(N__9110),
            .in2(N__8623),
            .in3(N__8619),
            .lcout(\inst_midgetv_core.inst_alu.genblk1_inst.A_13 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC15_0_14_LC_16_19_2 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC15_0_14_LC_16_19_2 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC15_0_14_LC_16_19_2 .LUT_INIT=16'b1111000010101100;
    LogicCell40 \inst_midgetv_core.inst_opreg.genblk1_OpC15_0_14_LC_16_19_2  (
            .in0(_gnd_net_),
            .in1(N__9542),
            .in2(N__8584),
            .in3(N__9427),
            .lcout(\inst_midgetv_core.INSTR_14 ),
            .ltout(\inst_midgetv_core.Di_14_cascade_ ),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__13799),
            .ce(N__9900),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_14.l_LC_16_19_3 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_14.l_LC_16_19_3 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_14.l_LC_16_19_3 .LUT_INIT=16'b0010010100110000;
    LogicCell40 \inst_midgetv_core.inst_alu.genblk1_inst.a_14.l_LC_16_19_3  (
            .in0(N__9600),
            .in1(N__9250),
            .in2(N__9574),
            .in3(N__9111),
            .lcout(\inst_midgetv_core.inst_alu.genblk1_inst.A_14 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC15_0_15_LC_16_19_4 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC15_0_15_LC_16_19_4 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC15_0_15_LC_16_19_4 .LUT_INIT=16'b1111000010101100;
    LogicCell40 \inst_midgetv_core.inst_opreg.genblk1_OpC15_0_15_LC_16_19_4  (
            .in0(_gnd_net_),
            .in1(N__9324),
            .in2(N__9562),
            .in3(N__9428),
            .lcout(\inst_midgetv_core.INSTR_15 ),
            .ltout(\inst_midgetv_core.Di_15_cascade_ ),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__13799),
            .ce(N__9900),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_15.l_LC_16_19_5 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_15.l_LC_16_19_5 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_15.l_LC_16_19_5 .LUT_INIT=16'b0010010100110000;
    LogicCell40 \inst_midgetv_core.inst_alu.genblk1_inst.a_15.l_LC_16_19_5  (
            .in0(N__9543),
            .in1(N__9251),
            .in2(N__9520),
            .in3(N__9112),
            .lcout(\inst_midgetv_core.inst_alu.genblk1_inst.A_15 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC31_16_16_LC_16_19_6 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC31_16_16_LC_16_19_6 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_opreg.genblk1_OpC31_16_16_LC_16_19_6 .LUT_INIT=16'b1111000010101100;
    LogicCell40 \inst_midgetv_core.inst_opreg.genblk1_OpC31_16_16_LC_16_19_6  (
            .in0(_gnd_net_),
            .in1(N__9506),
            .in2(N__9481),
            .in3(N__9429),
            .lcout(\inst_midgetv_core.INSTR_16 ),
            .ltout(\inst_midgetv_core.Di_16_cascade_ ),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__13799),
            .ce(N__9900),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_16.l_LC_16_19_7 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_16.l_LC_16_19_7 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_alu.genblk1_inst.a_16.l_LC_16_19_7 .LUT_INIT=16'b0010010100110000;
    LogicCell40 \inst_midgetv_core.inst_alu.genblk1_inst.a_16.l_LC_16_19_7  (
            .in0(N__9325),
            .in1(N__9252),
            .in2(N__9130),
            .in3(N__9113),
            .lcout(\inst_midgetv_core.inst_alu.genblk1_inst.A_16 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_progressctrl.i1_2_lut_3_lut_LC_16_21_4 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_progressctrl.i1_2_lut_3_lut_LC_16_21_4 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_progressctrl.i1_2_lut_3_lut_LC_16_21_4 .LUT_INIT=16'b0000000010001000;
    LogicCell40 \inst_midgetv_core.inst_progressctrl.i1_2_lut_3_lut_LC_16_21_4  (
            .in0(N__11373),
            .in1(N__8939),
            .in2(_gnd_net_),
            .in3(N__11345),
            .lcout(\inst_midgetv_core.inst_progressctrl.n4_adj_311 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam CONSTANT_ONE_LUT4_LC_16_21_5.C_ON=1'b0;
    defparam CONSTANT_ONE_LUT4_LC_16_21_5.SEQ_MODE=4'b0000;
    defparam CONSTANT_ONE_LUT4_LC_16_21_5.LUT_INIT=16'b1111111111111111;
    LogicCell40 CONSTANT_ONE_LUT4_LC_16_21_5 (
            .in0(_gnd_net_),
            .in1(_gnd_net_),
            .in2(_gnd_net_),
            .in3(_gnd_net_),
            .lcout(CONSTANT_ONE_NET),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.cmb_d31_LC_17_13_1 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.cmb_d31_LC_17_13_1 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.cmb_d31_LC_17_13_1 .LUT_INIT=16'b0001000100000000;
    LogicCell40 \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.cmb_d31_LC_17_13_1  (
            .in0(N__12325),
            .in1(N__12262),
            .in2(N__12399),
            .in3(N__12202),
            .lcout(\inst_midgetv_core.sa29 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.cmb_d15_LC_17_13_2 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.cmb_d15_LC_17_13_2 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.cmb_d15_LC_17_13_2 .LUT_INIT=16'b1000000010000000;
    LogicCell40 \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.cmb_d15_LC_17_13_2  (
            .in0(N__12204),
            .in1(N__12327),
            .in2(N__12273),
            .in3(N__12392),
            .lcout(\inst_midgetv_core.is_valid_instrhigh ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_progressctrl.progress_ucode_I_0_4_lut_LC_17_13_3 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_progressctrl.progress_ucode_I_0_4_lut_LC_17_13_3 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_progressctrl.progress_ucode_I_0_4_lut_LC_17_13_3 .LUT_INIT=16'b1101110111011100;
    LogicCell40 \inst_midgetv_core.inst_progressctrl.progress_ucode_I_0_4_lut_LC_17_13_3  (
            .in0(N__13538),
            .in1(N__11964),
            .in2(N__10711),
            .in3(N__9742),
            .lcout(\inst_midgetv_core.progress_ucode ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.cmb_d34_LC_17_13_4 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.cmb_d34_LC_17_13_4 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.cmb_d34_LC_17_13_4 .LUT_INIT=16'b0000000001001000;
    LogicCell40 \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.cmb_d34_LC_17_13_4  (
            .in0(N__12203),
            .in1(N__12326),
            .in2(N__12272),
            .in3(N__12391),
            .lcout(\inst_midgetv_core.sa33 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_ucodepc.i3968_4_lut_LC_17_13_6 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_ucodepc.i3968_4_lut_LC_17_13_6 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_ucodepc.i3968_4_lut_LC_17_13_6 .LUT_INIT=16'b0000000000010000;
    LogicCell40 \inst_midgetv_core.inst_ucodepc.i3968_4_lut_LC_17_13_6  (
            .in0(N__11823),
            .in1(N__11846),
            .in2(N__9772),
            .in3(N__11868),
            .lcout(\inst_midgetv_core.inst_ucodepc.n5624 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_progressctrl.i1_2_lut_LC_17_13_7 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_progressctrl.i1_2_lut_LC_17_13_7 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_progressctrl.i1_2_lut_LC_17_13_7 .LUT_INIT=16'b1111111101010101;
    LogicCell40 \inst_midgetv_core.inst_progressctrl.i1_2_lut_LC_17_13_7  (
            .in0(N__9748),
            .in1(_gnd_net_),
            .in2(_gnd_net_),
            .in3(N__12789),
            .lcout(\inst_midgetv_core.inst_progressctrl.n4 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_progressctrl.blka_l_en_LC_17_14_1 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_progressctrl.blka_l_en_LC_17_14_1 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_progressctrl.blka_l_en_LC_17_14_1 .LUT_INIT=16'b1111111110101010;
    LogicCell40 \inst_midgetv_core.inst_progressctrl.blka_l_en_LC_17_14_1  (
            .in0(_gnd_net_),
            .in1(_gnd_net_),
            .in2(_gnd_net_),
            .in3(N__10686),
            .lcout(\inst_midgetv_core.inst_progressctrl.blka_en ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_progressctrl.i1_4_lut_LC_17_14_4 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_progressctrl.i1_4_lut_LC_17_14_4 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_progressctrl.i1_4_lut_LC_17_14_4 .LUT_INIT=16'b0000010100000100;
    LogicCell40 \inst_midgetv_core.inst_progressctrl.i1_4_lut_LC_17_14_4  (
            .in0(N__13537),
            .in1(N__11905),
            .in2(N__12793),
            .in3(N__11887),
            .lcout(\inst_midgetv_core.enaQ ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.cmb_d08_LC_17_14_5 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.cmb_d08_LC_17_14_5 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.cmb_d08_LC_17_14_5 .LUT_INIT=16'b0100000100100000;
    LogicCell40 \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.cmb_d08_LC_17_14_5  (
            .in0(N__12274),
            .in1(N__12208),
            .in2(N__12334),
            .in3(N__12400),
            .lcout(\inst_midgetv_core.sa00 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_wai.genblk1_L_2319_LC_17_15_0 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_wai.genblk1_L_2319_LC_17_15_0 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_wai.genblk1_L_2319_LC_17_15_0 .LUT_INIT=16'b1110111101000000;
    LogicCell40 \inst_midgetv_core.inst_wai.genblk1_L_2319_LC_17_15_0  (
            .in0(N__13330),
            .in1(N__10037),
            .in2(N__13430),
            .in3(N__10045),
            .lcout(\inst_midgetv_core.Wai_0 ),
            .ltout(),
            .carryin(bfn_17_15_0_),
            .carryout(\inst_midgetv_core.inst_wai.genblk1_waicy0 ),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_wai.genblk1_L_2321_LC_17_15_1 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_wai.genblk1_L_2321_LC_17_15_1 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_wai.genblk1_L_2321_LC_17_15_1 .LUT_INIT=16'b1010101011100010;
    LogicCell40 \inst_midgetv_core.inst_wai.genblk1_L_2321_LC_17_15_1  (
            .in0(N__11743),
            .in1(N__13413),
            .in2(N__11041),
            .in3(N__13332),
            .lcout(\inst_midgetv_core.Wai_1 ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_wai.genblk1_waicy0 ),
            .carryout(\inst_midgetv_core.inst_wai.genblk1_waicy1 ),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_wai.genblk1_L_2322_LC_17_15_2 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_wai.genblk1_L_2322_LC_17_15_2 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_wai.genblk1_L_2322_LC_17_15_2 .LUT_INIT=16'b1110010111100000;
    LogicCell40 \inst_midgetv_core.inst_wai.genblk1_L_2322_LC_17_15_2  (
            .in0(N__13331),
            .in1(N__9987),
            .in2(N__13431),
            .in3(N__10453),
            .lcout(\inst_midgetv_core.Wai_2 ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_wai.genblk1_waicy1 ),
            .carryout(\inst_midgetv_core.inst_wai.genblk1_waicy2 ),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_wai.genblk1_L_2323_LC_17_15_3 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_wai.genblk1_L_2323_LC_17_15_3 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_wai.genblk1_L_2323_LC_17_15_3 .LUT_INIT=16'b1100110011100010;
    LogicCell40 \inst_midgetv_core.inst_wai.genblk1_L_2323_LC_17_15_3  (
            .in0(N__10360),
            .in1(N__13417),
            .in2(N__10762),
            .in3(N__13329),
            .lcout(\inst_midgetv_core.Wai_3 ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_wai.genblk1_waicy2 ),
            .carryout(\inst_midgetv_core.inst_wai.genblk1_waicy3 ),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_wai.genblk1_L_2324_LC_17_15_4 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_wai.genblk1_L_2324_LC_17_15_4 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_wai.genblk1_L_2324_LC_17_15_4 .LUT_INIT=16'b0100010101000000;
    LogicCell40 \inst_midgetv_core.inst_wai.genblk1_L_2324_LC_17_15_4  (
            .in0(N__13328),
            .in1(N__10269),
            .in2(N__13432),
            .in3(N__10240),
            .lcout(\inst_midgetv_core.Wai_4 ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_wai.genblk1_waicy3 ),
            .carryout(\inst_midgetv_core.inst_wai.genblk1_waicy4 ),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_wai.genblk1_L_2325_LC_17_15_5 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_wai.genblk1_L_2325_LC_17_15_5 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_wai.genblk1_L_2325_LC_17_15_5 .LUT_INIT=16'b1111001011111110;
    LogicCell40 \inst_midgetv_core.inst_wai.genblk1_L_2325_LC_17_15_5  (
            .in0(N__10144),
            .in1(N__13421),
            .in2(N__13365),
            .in3(N__10111),
            .lcout(\inst_midgetv_core.Wai_5 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_wai.genblk1_L_2318_LC_17_15_6 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_wai.genblk1_L_2318_LC_17_15_6 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_wai.genblk1_L_2318_LC_17_15_6 .LUT_INIT=16'b1101110110001000;
    LogicCell40 \inst_midgetv_core.inst_wai.genblk1_L_2318_LC_17_15_6  (
            .in0(N__13327),
            .in1(N__12115),
            .in2(_gnd_net_),
            .in3(N__11534),
            .lcout(\inst_midgetv_core.inst_wai.genblk1_preWai0 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_L_1788_LC_17_16_0 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_L_1788_LC_17_16_0 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_L_1788_LC_17_16_0 .LUT_INIT=16'b1010001010000000;
    LogicCell40 \inst_midgetv_core.inst_immexp_zfind_q.genblk1_L_1788_LC_17_16_0  (
            .in0(N__10996),
            .in1(N__10904),
            .in2(N__14390),
            .in3(N__10038),
            .lcout(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_imm0a ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_L_1792_LC_17_16_1 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_L_1792_LC_17_16_1 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_L_1792_LC_17_16_1 .LUT_INIT=16'b1101110001000000;
    LogicCell40 \inst_midgetv_core.inst_immexp_zfind_q.genblk1_L_1792_LC_17_16_1  (
            .in0(N__10903),
            .in1(N__10997),
            .in2(N__9991),
            .in3(N__10815),
            .lcout(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_imm2a ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrb.we_I_0_2_lut_LC_17_16_2 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrb.we_I_0_2_lut_LC_17_16_2 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrb.we_I_0_2_lut_LC_17_16_2 .LUT_INIT=16'b0000000010101010;
    LogicCell40 \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrb.we_I_0_2_lut_LC_17_16_2  (
            .in0(N__12576),
            .in1(_gnd_net_),
            .in2(_gnd_net_),
            .in3(N__10717),
            .lcout(\inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrb.we ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_L_1599_LC_17_16_3 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_L_1599_LC_17_16_3 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_L_1599_LC_17_16_3 .LUT_INIT=16'b0000111100101111;
    LogicCell40 \inst_midgetv_core.inst_immexp_zfind_q.genblk1_L_1599_LC_17_16_3  (
            .in0(N__11321),
            .in1(N__11269),
            .in2(N__11203),
            .in3(N__11106),
            .lcout(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_sa08 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_L_1790_LC_17_16_4 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_L_1790_LC_17_16_4 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_L_1790_LC_17_16_4 .LUT_INIT=16'b1011001010100000;
    LogicCell40 \inst_midgetv_core.inst_immexp_zfind_q.genblk1_L_1790_LC_17_16_4  (
            .in0(N__10998),
            .in1(N__10905),
            .in2(N__10831),
            .in3(N__11037),
            .lcout(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_imm1a ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_L_1794_LC_17_16_6 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_L_1794_LC_17_16_6 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_immexp_zfind_q.genblk1_L_1794_LC_17_16_6 .LUT_INIT=16'b1011001010100000;
    LogicCell40 \inst_midgetv_core.inst_immexp_zfind_q.genblk1_L_1794_LC_17_16_6  (
            .in0(N__10999),
            .in1(N__10906),
            .in2(N__10830),
            .in3(N__10758),
            .lcout(\inst_midgetv_core.inst_immexp_zfind_q.genblk1_imm3a ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_progressctrl.blka_r_bsel0_LC_17_17_0 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_progressctrl.blka_r_bsel0_LC_17_17_0 .SEQ_MODE=4'b1001;
    defparam \inst_midgetv_core.inst_progressctrl.blka_r_bsel0_LC_17_17_0 .LUT_INIT=16'b0000011100000100;
    LogicCell40 \inst_midgetv_core.inst_progressctrl.blka_r_bsel0_LC_17_17_0  (
            .in0(N__12117),
            .in1(N__12479),
            .in2(N__12070),
            .in3(N__12731),
            .lcout(\inst_midgetv_core.bmask_0 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__13814),
            .ce(N__12028),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_progressctrl.genblk6_l_iwe_LC_17_17_2 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_progressctrl.genblk6_l_iwe_LC_17_17_2 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_progressctrl.genblk6_l_iwe_LC_17_17_2 .LUT_INIT=16'b0000000100000000;
    LogicCell40 \inst_midgetv_core.inst_progressctrl.genblk6_l_iwe_LC_17_17_2  (
            .in0(N__11560),
            .in1(N__10704),
            .in2(N__10687),
            .in3(N__10661),
            .lcout(\inst_midgetv_core.iwe ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_progressctrl.blka_r_bsel3_LC_17_17_6 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_progressctrl.blka_r_bsel3_LC_17_17_6 .SEQ_MODE=4'b1001;
    defparam \inst_midgetv_core.inst_progressctrl.blka_r_bsel3_LC_17_17_6 .LUT_INIT=16'b0000000100000111;
    LogicCell40 \inst_midgetv_core.inst_progressctrl.blka_r_bsel3_LC_17_17_6  (
            .in0(N__12116),
            .in1(N__12478),
            .in2(N__12069),
            .in3(N__12730),
            .lcout(\inst_midgetv_core.bmask_3 ),
            .ltout(\inst_midgetv_core.inst_progressctrl.blka_cmb_bsel_3_cascade_ ),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__13814),
            .ce(N__12028),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_progressctrl.blka_r_asel3_LC_17_17_7 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_progressctrl.blka_r_asel3_LC_17_17_7 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_progressctrl.blka_r_asel3_LC_17_17_7 .LUT_INIT=16'b0000111100001111;
    LogicCell40 \inst_midgetv_core.inst_progressctrl.blka_r_asel3_LC_17_17_7  (
            .in0(_gnd_net_),
            .in1(_gnd_net_),
            .in2(N__10597),
            .in3(_gnd_net_),
            .lcout(SEL_O_3),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__13814),
            .ce(N__12028),
            .sr(_gnd_net_));
    defparam \i_LEDs.LED3_26_LC_17_18_0 .C_ON=1'b0;
    defparam \i_LEDs.LED3_26_LC_17_18_0 .SEQ_MODE=4'b1000;
    defparam \i_LEDs.LED3_26_LC_17_18_0 .LUT_INIT=16'b0111011101000100;
    LogicCell40 \i_LEDs.LED3_26_LC_17_18_0  (
            .in0(N__10594),
            .in1(N__11610),
            .in2(_gnd_net_),
            .in3(N__10561),
            .lcout(LED3_c),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__13810),
            .ce(N__11593),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_wai.genblk1_genblk1_genblk1_L_95_LC_17_19_3 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_wai.genblk1_genblk1_genblk1_L_95_LC_17_19_3 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_wai.genblk1_genblk1_genblk1_L_95_LC_17_19_3 .LUT_INIT=16'b0001000100000000;
    LogicCell40 \inst_midgetv_core.inst_wai.genblk1_genblk1_genblk1_L_95_LC_17_19_3  (
            .in0(N__13361),
            .in1(N__13449),
            .in2(_gnd_net_),
            .in3(N__11737),
            .lcout(\inst_midgetv_core.Wai_9 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \i_LEDs.bluesource_is_uart_25_LC_17_19_5 .C_ON=1'b0;
    defparam \i_LEDs.bluesource_is_uart_25_LC_17_19_5 .SEQ_MODE=4'b1000;
    defparam \i_LEDs.bluesource_is_uart_25_LC_17_19_5 .LUT_INIT=16'b1111100001110000;
    LogicCell40 \i_LEDs.bluesource_is_uart_25_LC_17_19_5  (
            .in0(N__11471),
            .in1(N__11650),
            .in2(N__11611),
            .in3(N__11637),
            .lcout(bluesource_is_uart),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__13803),
            .ce(),
            .sr(_gnd_net_));
    defparam \i_LEDs.i1_2_lut_LC_17_19_6 .C_ON=1'b0;
    defparam \i_LEDs.i1_2_lut_LC_17_19_6 .SEQ_MODE=4'b0000;
    defparam \i_LEDs.i1_2_lut_LC_17_19_6 .LUT_INIT=16'b1111111111001100;
    LogicCell40 \i_LEDs.i1_2_lut_LC_17_19_6  (
            .in0(_gnd_net_),
            .in1(N__11606),
            .in2(_gnd_net_),
            .in3(N__11470),
            .lcout(\i_LEDs.n2766 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam i1538_2_lut_3_lut_LC_17_19_7.C_ON=1'b0;
    defparam i1538_2_lut_3_lut_LC_17_19_7.SEQ_MODE=4'b0000;
    defparam i1538_2_lut_3_lut_LC_17_19_7.LUT_INIT=16'b1010101010001000;
    LogicCell40 i1538_2_lut_3_lut_LC_17_19_7 (
            .in0(N__13534),
            .in1(N__11794),
            .in2(_gnd_net_),
            .in3(N__11528),
            .lcout(ACK_I),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam led_ACK_O_I_0_2_lut_LC_17_20_0.C_ON=1'b0;
    defparam led_ACK_O_I_0_2_lut_LC_17_20_0.SEQ_MODE=4'b0000;
    defparam led_ACK_O_I_0_2_lut_LC_17_20_0.LUT_INIT=16'b1111111111001100;
    LogicCell40 led_ACK_O_I_0_2_lut_LC_17_20_0 (
            .in0(_gnd_net_),
            .in1(N__11802),
            .in2(_gnd_net_),
            .in3(N__11536),
            .lcout(n2345),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \i_BBUART.STB_I_I_0_2_lut_3_lut_LC_17_20_2 .C_ON=1'b0;
    defparam \i_BBUART.STB_I_I_0_2_lut_3_lut_LC_17_20_2 .SEQ_MODE=4'b0000;
    defparam \i_BBUART.STB_I_I_0_2_lut_3_lut_LC_17_20_2 .LUT_INIT=16'b1000100000000000;
    LogicCell40 \i_BBUART.STB_I_I_0_2_lut_3_lut_LC_17_20_2  (
            .in0(N__11559),
            .in1(N__13521),
            .in2(_gnd_net_),
            .in3(N__11803),
            .lcout(\i_BBUART.usartTX_N_2 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \i_LEDs.i2_3_lut_LC_17_20_4 .C_ON=1'b0;
    defparam \i_LEDs.i2_3_lut_LC_17_20_4 .SEQ_MODE=4'b0000;
    defparam \i_LEDs.i2_3_lut_LC_17_20_4 .LUT_INIT=16'b1000100000000000;
    LogicCell40 \i_LEDs.i2_3_lut_LC_17_20_4  (
            .in0(N__11558),
            .in1(N__13520),
            .in2(_gnd_net_),
            .in3(N__11535),
            .lcout(LED1_N_4),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_progressctrl.genblk3_rSTB_O_64_LC_17_21_2 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_progressctrl.genblk3_rSTB_O_64_LC_17_21_2 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_progressctrl.genblk3_rSTB_O_64_LC_17_21_2 .LUT_INIT=16'b0000110010101110;
    LogicCell40 \inst_midgetv_core.inst_progressctrl.genblk3_rSTB_O_64_LC_17_21_2  (
            .in0(N__11449),
            .in1(N__13533),
            .in2(N__11443),
            .in3(N__11426),
            .lcout(STB_O),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__13794),
            .ce(),
            .sr(N__11971));
    defparam \inst_midgetv_core.inst_progressctrl.genblk3_rsram_stb_65_LC_17_21_3 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_progressctrl.genblk3_rsram_stb_65_LC_17_21_3 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_progressctrl.genblk3_rsram_stb_65_LC_17_21_3 .LUT_INIT=16'b1100110011101100;
    LogicCell40 \inst_midgetv_core.inst_progressctrl.genblk3_rsram_stb_65_LC_17_21_3  (
            .in0(N__11425),
            .in1(N__13565),
            .in2(N__11380),
            .in3(N__11352),
            .lcout(\inst_midgetv_core.sram_stb ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__13794),
            .ce(),
            .sr(N__11971));
    defparam CONSTANT_ZERO_LUT4_LC_18_12_0.C_ON=1'b0;
    defparam CONSTANT_ZERO_LUT4_LC_18_12_0.SEQ_MODE=4'b0000;
    defparam CONSTANT_ZERO_LUT4_LC_18_12_0.LUT_INIT=16'b0000000000000000;
    LogicCell40 CONSTANT_ZERO_LUT4_LC_18_12_0 (
            .in0(_gnd_net_),
            .in1(_gnd_net_),
            .in2(_gnd_net_),
            .in3(_gnd_net_),
            .lcout(CONSTANT_ZERO_NET),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.cmb_d33_LC_18_13_0 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.cmb_d33_LC_18_13_0 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.cmb_d33_LC_18_13_0 .LUT_INIT=16'b0011100010010000;
    LogicCell40 \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.cmb_d33_LC_18_13_0  (
            .in0(N__12248),
            .in1(N__12172),
            .in2(N__12389),
            .in3(N__12304),
            .lcout(\inst_midgetv_core.sa32 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_ucodepc.sa32_I_0_2_lut_LC_18_13_1 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_ucodepc.sa32_I_0_2_lut_LC_18_13_1 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_ucodepc.sa32_I_0_2_lut_LC_18_13_1 .LUT_INIT=16'b0011001100000000;
    LogicCell40 \inst_midgetv_core.inst_ucodepc.sa32_I_0_2_lut_LC_18_13_1  (
            .in0(_gnd_net_),
            .in1(N__11901),
            .in2(_gnd_net_),
            .in3(N__11886),
            .lcout(\inst_midgetv_core.inst_ucodepc.maybranch_N_253 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.cmb_d32_LC_18_13_3 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.cmb_d32_LC_18_13_3 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.cmb_d32_LC_18_13_3 .LUT_INIT=16'b0000000001000000;
    LogicCell40 \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.cmb_d32_LC_18_13_3  (
            .in0(N__12305),
            .in1(N__12375),
            .in2(N__12198),
            .in3(N__12250),
            .lcout(\inst_midgetv_core.sa30 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.cmb_d14_LC_18_13_4 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.cmb_d14_LC_18_13_4 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.cmb_d14_LC_18_13_4 .LUT_INIT=16'b0000000000001000;
    LogicCell40 \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.cmb_d14_LC_18_13_4  (
            .in0(N__12249),
            .in1(N__12176),
            .in2(N__12390),
            .in3(N__12306),
            .lcout(\inst_midgetv_core.sa37 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.cmb_d38_LC_18_13_7 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.cmb_d38_LC_18_13_7 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.cmb_d38_LC_18_13_7 .LUT_INIT=16'b0010100000000000;
    LogicCell40 \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.cmb_d38_LC_18_13_7  (
            .in0(N__12307),
            .in1(N__12371),
            .in2(N__12199),
            .in3(N__12247),
            .lcout(\inst_midgetv_core.sa40 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_progressctrl.blka_l_usedefault_LC_18_14_0 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_progressctrl.blka_l_usedefault_LC_18_14_0 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_progressctrl.blka_l_usedefault_LC_18_14_0 .LUT_INIT=16'b1111111111101101;
    LogicCell40 \inst_midgetv_core.inst_progressctrl.blka_l_usedefault_LC_18_14_0  (
            .in0(N__11812),
            .in1(N__13299),
            .in2(N__12111),
            .in3(N__13390),
            .lcout(\inst_midgetv_core.inst_progressctrl.blka_usedefault ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.cmb_d35_LC_18_14_1 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.cmb_d35_LC_18_14_1 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.cmb_d35_LC_18_14_1 .LUT_INIT=16'b0100000000000010;
    LogicCell40 \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.cmb_d35_LC_18_14_1  (
            .in0(N__12369),
            .in1(N__12312),
            .in2(N__12200),
            .in3(N__12242),
            .lcout(\inst_midgetv_core.sa34 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_wai.genblk1_L_2320_LC_18_14_3 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_wai.genblk1_L_2320_LC_18_14_3 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_wai.genblk1_L_2320_LC_18_14_3 .LUT_INIT=16'b1101110110001000;
    LogicCell40 \inst_midgetv_core.inst_wai.genblk1_L_2320_LC_18_14_3  (
            .in0(N__13298),
            .in1(N__11811),
            .in2(_gnd_net_),
            .in3(N__11801),
            .lcout(\inst_midgetv_core.inst_wai.genblk1_preWai1 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.cmb_d09_LC_18_14_4 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.cmb_d09_LC_18_14_4 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.cmb_d09_LC_18_14_4 .LUT_INIT=16'b0000101000010000;
    LogicCell40 \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.cmb_d09_LC_18_14_4  (
            .in0(N__12241),
            .in1(N__12180),
            .in2(N__12324),
            .in3(N__12368),
            .lcout(\inst_midgetv_core.s_alu_carryin_0 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.cmb_d21_LC_18_14_5 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.cmb_d21_LC_18_14_5 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.cmb_d21_LC_18_14_5 .LUT_INIT=16'b1111101000111111;
    LogicCell40 \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.cmb_d21_LC_18_14_5  (
            .in0(N__12370),
            .in1(N__12313),
            .in2(N__12201),
            .in3(N__12243),
            .lcout(\inst_midgetv_core.s_shift_0 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.cmb_d10_LC_18_14_7 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.cmb_d10_LC_18_14_7 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.cmb_d10_LC_18_14_7 .LUT_INIT=16'b0010000000100000;
    LogicCell40 \inst_midgetv_core.inst_ucode.genblk1_inst_2ebr.cmb_d10_LC_18_14_7  (
            .in0(N__12367),
            .in1(N__12311),
            .in2(N__12261),
            .in3(N__12197),
            .lcout(\inst_midgetv_core.s_alu_carryin_1 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_progressctrl.blka_r_bsel1_LC_18_15_3 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_progressctrl.blka_r_bsel1_LC_18_15_3 .SEQ_MODE=4'b1001;
    defparam \inst_midgetv_core.inst_progressctrl.blka_r_bsel1_LC_18_15_3 .LUT_INIT=16'b0000011100000001;
    LogicCell40 \inst_midgetv_core.inst_progressctrl.blka_r_bsel1_LC_18_15_3  (
            .in0(N__12102),
            .in1(N__12495),
            .in2(N__12058),
            .in3(N__12726),
            .lcout(\inst_midgetv_core.bmask_1 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__13822),
            .ce(N__12027),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_progressctrl.blka_r_bsel2_LC_18_16_2 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_progressctrl.blka_r_bsel2_LC_18_16_2 .SEQ_MODE=4'b1001;
    defparam \inst_midgetv_core.inst_progressctrl.blka_r_bsel2_LC_18_16_2 .LUT_INIT=16'b0000010000000111;
    LogicCell40 \inst_midgetv_core.inst_progressctrl.blka_r_bsel2_LC_18_16_2  (
            .in0(N__12118),
            .in1(N__12494),
            .in2(N__12068),
            .in3(N__12725),
            .lcout(\inst_midgetv_core.bmask_2 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__13819),
            .ce(N__12026),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_shiftcounter.genblk1_cmb_d21_0.l_LC_18_17_0 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_shiftcounter.genblk1_cmb_d21_0.l_LC_18_17_0 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_shiftcounter.genblk1_cmb_d21_0.l_LC_18_17_0 .LUT_INIT=16'b0011001100000000;
    LogicCell40 \inst_midgetv_core.inst_shiftcounter.genblk1_cmb_d21_0.l_LC_18_17_0  (
            .in0(_gnd_net_),
            .in1(N__13660),
            .in2(N__13843),
            .in3(N__12729),
            .lcout(\inst_midgetv_core.inst_shiftcounter.genblk1_d_0 ),
            .ltout(),
            .carryin(bfn_18_17_0_),
            .carryout(\inst_midgetv_core.inst_shiftcounter.genblk1_shcy_0 ),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_shiftcounter.genblk1_reg_shcnt40_1_LC_18_17_1 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_shiftcounter.genblk1_reg_shcnt40_1_LC_18_17_1 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_shiftcounter.genblk1_reg_shcnt40_1_LC_18_17_1 .LUT_INIT=16'b1100101000111010;
    LogicCell40 \inst_midgetv_core.inst_shiftcounter.genblk1_reg_shcnt40_1_LC_18_17_1  (
            .in0(N__11998),
            .in1(N__11992),
            .in2(N__12539),
            .in3(N__11986),
            .lcout(\inst_midgetv_core.inst_shiftcounter.dbg_rshcnt_1 ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_shiftcounter.genblk1_shcy_0 ),
            .carryout(\inst_midgetv_core.inst_shiftcounter.genblk1_shcy_1 ),
            .clk(N__13818),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_shiftcounter.genblk1_reg_shcnt40_2_LC_18_17_2 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_shiftcounter.genblk1_reg_shcnt40_2_LC_18_17_2 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_shiftcounter.genblk1_reg_shcnt40_2_LC_18_17_2 .LUT_INIT=16'b1110001000101110;
    LogicCell40 \inst_midgetv_core.inst_shiftcounter.genblk1_reg_shcnt40_2_LC_18_17_2  (
            .in0(N__13636),
            .in1(N__12530),
            .in2(N__11983),
            .in3(N__11974),
            .lcout(\inst_midgetv_core.inst_shiftcounter.dbg_rshcnt_2 ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_shiftcounter.genblk1_shcy_1 ),
            .carryout(\inst_midgetv_core.inst_shiftcounter.genblk1_shcy_2 ),
            .clk(N__13818),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_shiftcounter.genblk1_reg_shcnt40_3_LC_18_17_3 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_shiftcounter.genblk1_reg_shcnt40_3_LC_18_17_3 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_shiftcounter.genblk1_reg_shcnt40_3_LC_18_17_3 .LUT_INIT=16'b1100101000111010;
    LogicCell40 \inst_midgetv_core.inst_shiftcounter.genblk1_reg_shcnt40_3_LC_18_17_3  (
            .in0(N__12757),
            .in1(N__13033),
            .in2(N__12540),
            .in3(N__13027),
            .lcout(\inst_midgetv_core.inst_shiftcounter.dbg_rshcnt_3 ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_shiftcounter.genblk1_shcy_2 ),
            .carryout(\inst_midgetv_core.inst_shiftcounter.genblk1_shcy_3 ),
            .clk(N__13818),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_shiftcounter.genblk1_reg_shcnt40_4_LC_18_17_4 .C_ON=1'b1;
    defparam \inst_midgetv_core.inst_shiftcounter.genblk1_reg_shcnt40_4_LC_18_17_4 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_shiftcounter.genblk1_reg_shcnt40_4_LC_18_17_4 .LUT_INIT=16'b1110001000101110;
    LogicCell40 \inst_midgetv_core.inst_shiftcounter.genblk1_reg_shcnt40_4_LC_18_17_4  (
            .in0(N__12664),
            .in1(N__12534),
            .in2(N__13024),
            .in3(N__13015),
            .lcout(\inst_midgetv_core.inst_shiftcounter.dbg_rshcnt_4 ),
            .ltout(),
            .carryin(\inst_midgetv_core.inst_shiftcounter.genblk1_shcy_3 ),
            .carryout(\inst_midgetv_core.inst_shiftcounter.genblk1_shcy_4 ),
            .clk(N__13818),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_shiftcounter.genblk1_cmb_lastshift.l_LC_18_17_5 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_shiftcounter.genblk1_cmb_lastshift.l_LC_18_17_5 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_shiftcounter.genblk1_cmb_lastshift.l_LC_18_17_5 .LUT_INIT=16'b0000000010101010;
    LogicCell40 \inst_midgetv_core.inst_shiftcounter.genblk1_cmb_lastshift.l_LC_18_17_5  (
            .in0(N__12535),
            .in1(N__12998),
            .in2(N__13010),
            .in3(N__12796),
            .lcout(\inst_midgetv_core.lastshift ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_shiftcounter.genblk1_cmb_d43_0.l_LC_18_17_6 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_shiftcounter.genblk1_cmb_d43_0.l_LC_18_17_6 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_shiftcounter.genblk1_cmb_d43_0.l_LC_18_17_6 .LUT_INIT=16'b1110111001000100;
    LogicCell40 \inst_midgetv_core.inst_shiftcounter.genblk1_cmb_d43_0.l_LC_18_17_6  (
            .in0(N__13668),
            .in1(N__14047),
            .in2(_gnd_net_),
            .in3(N__12477),
            .lcout(\inst_midgetv_core.inst_shiftcounter.genblk1_d_2 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_shiftcounter.genblk1_cmb_d43_1.l_LC_18_17_7 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_shiftcounter.genblk1_cmb_d43_1.l_LC_18_17_7 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_shiftcounter.genblk1_cmb_d43_1.l_LC_18_17_7 .LUT_INIT=16'b1011101110001000;
    LogicCell40 \inst_midgetv_core.inst_shiftcounter.genblk1_cmb_d43_1.l_LC_18_17_7  (
            .in0(N__12728),
            .in1(N__13669),
            .in2(_gnd_net_),
            .in3(N__15127),
            .lcout(\inst_midgetv_core.inst_shiftcounter.genblk1_d_3 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrb.we_I_0_2_lut_LC_18_18_1 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrb.we_I_0_2_lut_LC_18_18_1 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrb.we_I_0_2_lut_LC_18_18_1 .LUT_INIT=16'b0000000010101010;
    LogicCell40 \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrb.we_I_0_2_lut_LC_18_18_1  (
            .in0(N__12585),
            .in1(_gnd_net_),
            .in2(_gnd_net_),
            .in3(N__12658),
            .lcout(\inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrb.we ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrh.we_I_0_2_lut_LC_18_18_3 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrh.we_I_0_2_lut_LC_18_18_3 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrh.we_I_0_2_lut_LC_18_18_3 .LUT_INIT=16'b0000101000001010;
    LogicCell40 \inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrh.we_I_0_2_lut_LC_18_18_3  (
            .in0(N__12586),
            .in1(_gnd_net_),
            .in2(N__12628),
            .in3(_gnd_net_),
            .lcout(\inst_midgetv_core.inst_ebr.ebrh.genblk1_ebrh.we ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrh.we_I_0_2_lut_LC_18_18_4 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrh.we_I_0_2_lut_LC_18_18_4 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrh.we_I_0_2_lut_LC_18_18_4 .LUT_INIT=16'b0011001100000000;
    LogicCell40 \inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrh.we_I_0_2_lut_LC_18_18_4  (
            .in0(_gnd_net_),
            .in1(N__12595),
            .in2(_gnd_net_),
            .in3(N__12584),
            .lcout(\inst_midgetv_core.inst_ebr.ebrb.genblk1_ebrh.we ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_shiftcounter.genblk1_reg_shcnt40_0_LC_18_18_6 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_shiftcounter.genblk1_reg_shcnt40_0_LC_18_18_6 .SEQ_MODE=4'b1000;
    defparam \inst_midgetv_core.inst_shiftcounter.genblk1_reg_shcnt40_0_LC_18_18_6 .LUT_INIT=16'b1001001110010000;
    LogicCell40 \inst_midgetv_core.inst_shiftcounter.genblk1_reg_shcnt40_0_LC_18_18_6  (
            .in0(N__13842),
            .in1(N__13667),
            .in2(N__12541),
            .in3(N__12499),
            .lcout(\inst_midgetv_core.inst_shiftcounter.dbg_rshcnt_0 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(N__13815),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_shiftcounter.genblk1_cmb_d21_1.l_LC_18_18_7 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_shiftcounter.genblk1_cmb_d21_1.l_LC_18_18_7 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_shiftcounter.genblk1_cmb_d21_1.l_LC_18_18_7 .LUT_INIT=16'b0101010100000000;
    LogicCell40 \inst_midgetv_core.inst_shiftcounter.genblk1_cmb_d21_1.l_LC_18_18_7  (
            .in0(N__13666),
            .in1(_gnd_net_),
            .in2(_gnd_net_),
            .in3(N__14194),
            .lcout(\inst_midgetv_core.inst_shiftcounter.genblk1_d_1 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_rai.genblk1_L_sel_3_LC_18_19_3 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_rai.genblk1_L_sel_3_LC_18_19_3 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_rai.genblk1_L_sel_3_LC_18_19_3 .LUT_INIT=16'b1111000010110000;
    LogicCell40 \inst_midgetv_core.inst_rai.genblk1_L_sel_3_LC_18_19_3  (
            .in0(N__13569),
            .in1(N__13585),
            .in2(N__13630),
            .in3(N__13536),
            .lcout(\inst_midgetv_core.inst_rai.genblk1_sel_3 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_rai.genblk1_L_sel0hack_LC_18_19_4 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_rai.genblk1_L_sel0hack_LC_18_19_4 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_rai.genblk1_L_sel0hack_LC_18_19_4 .LUT_INIT=16'b0100010001000000;
    LogicCell40 \inst_midgetv_core.inst_rai.genblk1_L_sel0hack_LC_18_19_4  (
            .in0(N__13583),
            .in1(N__13596),
            .in2(_gnd_net_),
            .in3(N__13608),
            .lcout(\inst_midgetv_core.inst_rai.genblk1_sel0hack ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_rai.genblk1_L_sel0h_LC_18_19_5 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_rai.genblk1_L_sel0h_LC_18_19_5 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_rai.genblk1_L_sel0h_LC_18_19_5 .LUT_INIT=16'b1101110111011001;
    LogicCell40 \inst_midgetv_core.inst_rai.genblk1_L_sel0h_LC_18_19_5  (
            .in0(N__13597),
            .in1(N__13584),
            .in2(N__13570),
            .in3(N__13535),
            .lcout(\inst_midgetv_core.inst_rai.genblk1_sel0h ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_rai.genblk1_L_sel_0_LC_18_19_6 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_rai.genblk1_L_sel_0_LC_18_19_6 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_rai.genblk1_L_sel_0_LC_18_19_6 .LUT_INIT=16'b1010101010001000;
    LogicCell40 \inst_midgetv_core.inst_rai.genblk1_L_sel_0_LC_18_19_6  (
            .in0(N__13477),
            .in1(N__13462),
            .in2(_gnd_net_),
            .in3(N__13456),
            .lcout(\inst_midgetv_core.inst_rai.genblk1_sel_0 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_wai.genblk1_L_2326_LC_18_19_7 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_wai.genblk1_L_2326_LC_18_19_7 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_wai.genblk1_L_2326_LC_18_19_7 .LUT_INIT=16'b0000010100000000;
    LogicCell40 \inst_midgetv_core.inst_wai.genblk1_L_2326_LC_18_19_7  (
            .in0(N__13450),
            .in1(_gnd_net_),
            .in2(N__13366),
            .in3(N__13273),
            .lcout(\inst_midgetv_core.Wai_6 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_rai.genblk1_L_b1a_LC_18_27_0 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_rai.genblk1_L_b1a_LC_18_27_0 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_rai.genblk1_L_b1a_LC_18_27_0 .LUT_INIT=16'b1110101001100010;
    LogicCell40 \inst_midgetv_core.inst_rai.genblk1_L_b1a_LC_18_27_0  (
            .in0(N__14569),
            .in1(N__14652),
            .in2(N__13180),
            .in3(N__13137),
            .lcout(\inst_midgetv_core.inst_rai.genblk1_b1a ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_rai.genblk1_L_b3a_LC_18_27_2 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_rai.genblk1_L_b3a_LC_18_27_2 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_rai.genblk1_L_b3a_LC_18_27_2 .LUT_INIT=16'b1110011010100010;
    LogicCell40 \inst_midgetv_core.inst_rai.genblk1_L_b3a_LC_18_27_2  (
            .in0(N__14570),
            .in1(N__14653),
            .in2(N__13105),
            .in3(N__13060),
            .lcout(\inst_midgetv_core.inst_rai.genblk1_b3a ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_rai.genblk1_L_ss1_LC_18_27_3 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_rai.genblk1_L_ss1_LC_18_27_3 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_rai.genblk1_L_ss1_LC_18_27_3 .LUT_INIT=16'b1000100000000000;
    LogicCell40 \inst_midgetv_core.inst_rai.genblk1_L_ss1_LC_18_27_3  (
            .in0(N__15324),
            .in1(N__14007),
            .in2(_gnd_net_),
            .in3(N__15078),
            .lcout(\inst_midgetv_core.inst_rai.genblk1_ss1 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_rai.genblk1_L_b4a_LC_18_27_5 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_rai.genblk1_L_b4a_LC_18_27_5 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_rai.genblk1_L_b4a_LC_18_27_5 .LUT_INIT=16'b1110110001100100;
    LogicCell40 \inst_midgetv_core.inst_rai.genblk1_L_b4a_LC_18_27_5  (
            .in0(N__14654),
            .in1(N__14572),
            .in2(N__14472),
            .in3(N__14431),
            .lcout(\inst_midgetv_core.inst_rai.genblk1_b4a ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_rai.genblk1_L_ss0_LC_18_27_6 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_rai.genblk1_L_ss0_LC_18_27_6 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_rai.genblk1_L_ss0_LC_18_27_6 .LUT_INIT=16'b1000100000000000;
    LogicCell40 \inst_midgetv_core.inst_rai.genblk1_L_ss0_LC_18_27_6  (
            .in0(N__15077),
            .in1(N__15323),
            .in2(_gnd_net_),
            .in3(N__14136),
            .lcout(\inst_midgetv_core.inst_rai.genblk1_ss0 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_rai.genblk1_L_b0a_LC_18_27_7 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_rai.genblk1_L_b0a_LC_18_27_7 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_rai.genblk1_L_b0a_LC_18_27_7 .LUT_INIT=16'b1110110001100100;
    LogicCell40 \inst_midgetv_core.inst_rai.genblk1_L_b0a_LC_18_27_7  (
            .in0(N__14651),
            .in1(N__14571),
            .in2(N__14395),
            .in3(N__14335),
            .lcout(\inst_midgetv_core.inst_rai.genblk1_b0a ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_rai.genblk1_L_Rai4_LC_18_28_0 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_rai.genblk1_L_Rai4_LC_18_28_0 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_rai.genblk1_L_Rai4_LC_18_28_0 .LUT_INIT=16'b1110111001010000;
    LogicCell40 \inst_midgetv_core.inst_rai.genblk1_L_Rai4_LC_18_28_0  (
            .in0(N__14696),
            .in1(N__14302),
            .in2(_gnd_net_),
            .in3(N__14257),
            .lcout(\inst_midgetv_core.Rai_4 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_rai.genblk1_L_Rai0_LC_18_28_2 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_rai.genblk1_L_Rai0_LC_18_28_2 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_rai.genblk1_L_Rai0_LC_18_28_2 .LUT_INIT=16'b1111101000001100;
    LogicCell40 \inst_midgetv_core.inst_rai.genblk1_L_Rai0_LC_18_28_2  (
            .in0(N__14199),
            .in1(N__14137),
            .in2(N__14702),
            .in3(N__14119),
            .lcout(\inst_midgetv_core.Rai_0 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_rai.genblk1_L_Rai1_LC_18_28_4 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_rai.genblk1_L_Rai1_LC_18_28_4 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_rai.genblk1_L_Rai1_LC_18_28_4 .LUT_INIT=16'b1110111001010000;
    LogicCell40 \inst_midgetv_core.inst_rai.genblk1_L_Rai1_LC_18_28_4  (
            .in0(N__14692),
            .in1(N__14062),
            .in2(N__14014),
            .in3(N__13984),
            .lcout(\inst_midgetv_core.Rai_1 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_rai.genblk1_L_Rai5_LC_18_28_5 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_rai.genblk1_L_Rai5_LC_18_28_5 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_rai.genblk1_L_Rai5_LC_18_28_5 .LUT_INIT=16'b0000000011011101;
    LogicCell40 \inst_midgetv_core.inst_rai.genblk1_L_Rai5_LC_18_28_5  (
            .in0(N__14576),
            .in1(N__13926),
            .in2(_gnd_net_),
            .in3(N__14697),
            .lcout(\inst_midgetv_core.Rai_5 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_rai.genblk1_L_Rai3_LC_18_28_6 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_rai.genblk1_L_Rai3_LC_18_28_6 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_rai.genblk1_L_Rai3_LC_18_28_6 .LUT_INIT=16'b1111110000001010;
    LogicCell40 \inst_midgetv_core.inst_rai.genblk1_L_Rai3_LC_18_28_6  (
            .in0(N__15325),
            .in1(N__15307),
            .in2(N__14703),
            .in3(N__15262),
            .lcout(\inst_midgetv_core.Rai_3 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_rai.genblk1_L_b2a_LC_18_29_4 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_rai.genblk1_L_b2a_LC_18_29_4 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_rai.genblk1_L_b2a_LC_18_29_4 .LUT_INIT=16'b1110110001100100;
    LogicCell40 \inst_midgetv_core.inst_rai.genblk1_L_b2a_LC_18_29_4  (
            .in0(N__14682),
            .in1(N__14577),
            .in2(N__15205),
            .in3(N__15166),
            .lcout(\inst_midgetv_core.inst_rai.genblk1_b2a ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_rai.genblk1_L_Rai2_LC_18_29_6 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_rai.genblk1_L_Rai2_LC_18_29_6 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_rai.genblk1_L_Rai2_LC_18_29_6 .LUT_INIT=16'b1110111001010000;
    LogicCell40 \inst_midgetv_core.inst_rai.genblk1_L_Rai2_LC_18_29_6  (
            .in0(N__14683),
            .in1(N__15132),
            .in2(N__15082),
            .in3(N__15049),
            .lcout(\inst_midgetv_core.Rai_2 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_rai.genblk1_genblk1_L_Rai8_LC_18_30_2 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_rai.genblk1_genblk1_L_Rai8_LC_18_30_2 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_rai.genblk1_genblk1_L_Rai8_LC_18_30_2 .LUT_INIT=16'b0100010000000000;
    LogicCell40 \inst_midgetv_core.inst_rai.genblk1_genblk1_L_Rai8_LC_18_30_2  (
            .in0(N__14684),
            .in1(N__14578),
            .in2(_gnd_net_),
            .in3(N__14992),
            .lcout(\inst_midgetv_core.Rai_8 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_rai.genblk1_genblk1_genblk1_L_Rai9_LC_18_30_6 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_rai.genblk1_genblk1_genblk1_L_Rai9_LC_18_30_6 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_rai.genblk1_genblk1_genblk1_L_Rai9_LC_18_30_6 .LUT_INIT=16'b0100010000000000;
    LogicCell40 \inst_midgetv_core.inst_rai.genblk1_genblk1_genblk1_L_Rai9_LC_18_30_6  (
            .in0(N__14685),
            .in1(N__14579),
            .in2(_gnd_net_),
            .in3(N__14892),
            .lcout(\inst_midgetv_core.Rai_9 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_rai.genblk1_L_Rai6_LC_20_28_7 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_rai.genblk1_L_Rai6_LC_20_28_7 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_rai.genblk1_L_Rai6_LC_20_28_7 .LUT_INIT=16'b0100010000000000;
    LogicCell40 \inst_midgetv_core.inst_rai.genblk1_L_Rai6_LC_20_28_7  (
            .in0(N__14704),
            .in1(N__14797),
            .in2(_gnd_net_),
            .in3(N__14587),
            .lcout(\inst_midgetv_core.Rai_6 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
    defparam \inst_midgetv_core.inst_rai.genblk1_L_Rai7_LC_20_30_7 .C_ON=1'b0;
    defparam \inst_midgetv_core.inst_rai.genblk1_L_Rai7_LC_20_30_7 .SEQ_MODE=4'b0000;
    defparam \inst_midgetv_core.inst_rai.genblk1_L_Rai7_LC_20_30_7 .LUT_INIT=16'b0100010000000000;
    LogicCell40 \inst_midgetv_core.inst_rai.genblk1_L_Rai7_LC_20_30_7  (
            .in0(N__14701),
            .in1(N__14619),
            .in2(_gnd_net_),
            .in3(N__14586),
            .lcout(\inst_midgetv_core.Rai_7 ),
            .ltout(),
            .carryin(_gnd_net_),
            .carryout(),
            .clk(_gnd_net_),
            .ce(),
            .sr(_gnd_net_));
endmodule // top
