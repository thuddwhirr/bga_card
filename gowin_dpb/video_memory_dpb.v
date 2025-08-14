//Copyright (C)2014-2023 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: IP file
//GOWIN Version: V1.9.9 Beta-4 Education
//Part Number: GW2AR-LV18QN88C8/I7
//Device: GW2AR-18
//Device Version: C
//Created Time: Mon Jul 28 22:22:46 2025

module Video_Memory_DPB (douta, doutb, clka, ocea, cea, reseta, wrea, clkb, oceb, ceb, resetb, wreb, ada, dina, adb, dinb);

output [7:0] douta;
output [7:0] doutb;
input clka;
input ocea;
input cea;
input reseta;
input wrea;
input clkb;
input oceb;
input ceb;
input resetb;
input wreb;
input [16:0] ada;
input [7:0] dina;
input [16:0] adb;
input [7:0] dinb;

wire lut_f_0;
wire lut_f_1;
wire lut_f_2;
wire lut_f_3;
wire [14:0] dpb_inst_0_douta_w;
wire [0:0] dpb_inst_0_douta;
wire [14:0] dpb_inst_0_doutb_w;
wire [0:0] dpb_inst_0_doutb;
wire [14:0] dpb_inst_1_douta_w;
wire [0:0] dpb_inst_1_douta;
wire [14:0] dpb_inst_1_doutb_w;
wire [0:0] dpb_inst_1_doutb;
wire [14:0] dpb_inst_2_douta_w;
wire [0:0] dpb_inst_2_douta;
wire [14:0] dpb_inst_2_doutb_w;
wire [0:0] dpb_inst_2_doutb;
wire [14:0] dpb_inst_3_douta_w;
wire [0:0] dpb_inst_3_douta;
wire [14:0] dpb_inst_3_doutb_w;
wire [0:0] dpb_inst_3_doutb;
wire [14:0] dpb_inst_4_douta_w;
wire [1:1] dpb_inst_4_douta;
wire [14:0] dpb_inst_4_doutb_w;
wire [1:1] dpb_inst_4_doutb;
wire [14:0] dpb_inst_5_douta_w;
wire [1:1] dpb_inst_5_douta;
wire [14:0] dpb_inst_5_doutb_w;
wire [1:1] dpb_inst_5_doutb;
wire [14:0] dpb_inst_6_douta_w;
wire [1:1] dpb_inst_6_douta;
wire [14:0] dpb_inst_6_doutb_w;
wire [1:1] dpb_inst_6_doutb;
wire [14:0] dpb_inst_7_douta_w;
wire [1:1] dpb_inst_7_douta;
wire [14:0] dpb_inst_7_doutb_w;
wire [1:1] dpb_inst_7_doutb;
wire [14:0] dpb_inst_8_douta_w;
wire [2:2] dpb_inst_8_douta;
wire [14:0] dpb_inst_8_doutb_w;
wire [2:2] dpb_inst_8_doutb;
wire [14:0] dpb_inst_9_douta_w;
wire [2:2] dpb_inst_9_douta;
wire [14:0] dpb_inst_9_doutb_w;
wire [2:2] dpb_inst_9_doutb;
wire [14:0] dpb_inst_10_douta_w;
wire [2:2] dpb_inst_10_douta;
wire [14:0] dpb_inst_10_doutb_w;
wire [2:2] dpb_inst_10_doutb;
wire [14:0] dpb_inst_11_douta_w;
wire [2:2] dpb_inst_11_douta;
wire [14:0] dpb_inst_11_doutb_w;
wire [2:2] dpb_inst_11_doutb;
wire [14:0] dpb_inst_12_douta_w;
wire [3:3] dpb_inst_12_douta;
wire [14:0] dpb_inst_12_doutb_w;
wire [3:3] dpb_inst_12_doutb;
wire [14:0] dpb_inst_13_douta_w;
wire [3:3] dpb_inst_13_douta;
wire [14:0] dpb_inst_13_doutb_w;
wire [3:3] dpb_inst_13_doutb;
wire [14:0] dpb_inst_14_douta_w;
wire [3:3] dpb_inst_14_douta;
wire [14:0] dpb_inst_14_doutb_w;
wire [3:3] dpb_inst_14_doutb;
wire [14:0] dpb_inst_15_douta_w;
wire [3:3] dpb_inst_15_douta;
wire [14:0] dpb_inst_15_doutb_w;
wire [3:3] dpb_inst_15_doutb;
wire [13:0] dpb_inst_16_douta_w;
wire [1:0] dpb_inst_16_douta;
wire [13:0] dpb_inst_16_doutb_w;
wire [1:0] dpb_inst_16_doutb;
wire [13:0] dpb_inst_17_douta_w;
wire [3:2] dpb_inst_17_douta;
wire [13:0] dpb_inst_17_doutb_w;
wire [3:2] dpb_inst_17_doutb;
wire [11:0] dpb_inst_18_douta_w;
wire [3:0] dpb_inst_18_douta;
wire [11:0] dpb_inst_18_doutb_w;
wire [3:0] dpb_inst_18_doutb;
wire [14:0] dpb_inst_19_douta_w;
wire [4:4] dpb_inst_19_douta;
wire [14:0] dpb_inst_19_doutb_w;
wire [4:4] dpb_inst_19_doutb;
wire [14:0] dpb_inst_20_douta_w;
wire [4:4] dpb_inst_20_douta;
wire [14:0] dpb_inst_20_doutb_w;
wire [4:4] dpb_inst_20_doutb;
wire [14:0] dpb_inst_21_douta_w;
wire [4:4] dpb_inst_21_douta;
wire [14:0] dpb_inst_21_doutb_w;
wire [4:4] dpb_inst_21_doutb;
wire [14:0] dpb_inst_22_douta_w;
wire [4:4] dpb_inst_22_douta;
wire [14:0] dpb_inst_22_doutb_w;
wire [4:4] dpb_inst_22_doutb;
wire [14:0] dpb_inst_23_douta_w;
wire [5:5] dpb_inst_23_douta;
wire [14:0] dpb_inst_23_doutb_w;
wire [5:5] dpb_inst_23_doutb;
wire [14:0] dpb_inst_24_douta_w;
wire [5:5] dpb_inst_24_douta;
wire [14:0] dpb_inst_24_doutb_w;
wire [5:5] dpb_inst_24_doutb;
wire [14:0] dpb_inst_25_douta_w;
wire [5:5] dpb_inst_25_douta;
wire [14:0] dpb_inst_25_doutb_w;
wire [5:5] dpb_inst_25_doutb;
wire [14:0] dpb_inst_26_douta_w;
wire [5:5] dpb_inst_26_douta;
wire [14:0] dpb_inst_26_doutb_w;
wire [5:5] dpb_inst_26_doutb;
wire [14:0] dpb_inst_27_douta_w;
wire [6:6] dpb_inst_27_douta;
wire [14:0] dpb_inst_27_doutb_w;
wire [6:6] dpb_inst_27_doutb;
wire [14:0] dpb_inst_28_douta_w;
wire [6:6] dpb_inst_28_douta;
wire [14:0] dpb_inst_28_doutb_w;
wire [6:6] dpb_inst_28_doutb;
wire [14:0] dpb_inst_29_douta_w;
wire [6:6] dpb_inst_29_douta;
wire [14:0] dpb_inst_29_doutb_w;
wire [6:6] dpb_inst_29_doutb;
wire [14:0] dpb_inst_30_douta_w;
wire [6:6] dpb_inst_30_douta;
wire [14:0] dpb_inst_30_doutb_w;
wire [6:6] dpb_inst_30_doutb;
wire [14:0] dpb_inst_31_douta_w;
wire [7:7] dpb_inst_31_douta;
wire [14:0] dpb_inst_31_doutb_w;
wire [7:7] dpb_inst_31_doutb;
wire [14:0] dpb_inst_32_douta_w;
wire [7:7] dpb_inst_32_douta;
wire [14:0] dpb_inst_32_doutb_w;
wire [7:7] dpb_inst_32_doutb;
wire [14:0] dpb_inst_33_douta_w;
wire [7:7] dpb_inst_33_douta;
wire [14:0] dpb_inst_33_doutb_w;
wire [7:7] dpb_inst_33_doutb;
wire [14:0] dpb_inst_34_douta_w;
wire [7:7] dpb_inst_34_douta;
wire [14:0] dpb_inst_34_doutb_w;
wire [7:7] dpb_inst_34_doutb;
wire [13:0] dpb_inst_35_douta_w;
wire [5:4] dpb_inst_35_douta;
wire [13:0] dpb_inst_35_doutb_w;
wire [5:4] dpb_inst_35_doutb;
wire [13:0] dpb_inst_36_douta_w;
wire [7:6] dpb_inst_36_douta;
wire [13:0] dpb_inst_36_doutb_w;
wire [7:6] dpb_inst_36_doutb;
wire [11:0] dpb_inst_37_douta_w;
wire [7:4] dpb_inst_37_douta;
wire [11:0] dpb_inst_37_doutb_w;
wire [7:4] dpb_inst_37_doutb;
wire dff_q_0;
wire dff_q_1;
wire dff_q_2;
wire dff_q_3;
wire dff_q_4;
wire dff_q_5;
wire dff_q_6;
wire dff_q_7;
wire mux_o_10;
wire mux_o_11;
wire mux_o_12;
wire mux_o_14;
wire mux_o_27;
wire mux_o_28;
wire mux_o_29;
wire mux_o_31;
wire mux_o_44;
wire mux_o_45;
wire mux_o_46;
wire mux_o_48;
wire mux_o_61;
wire mux_o_62;
wire mux_o_63;
wire mux_o_65;
wire mux_o_78;
wire mux_o_79;
wire mux_o_80;
wire mux_o_82;
wire mux_o_95;
wire mux_o_96;
wire mux_o_97;
wire mux_o_99;
wire mux_o_112;
wire mux_o_113;
wire mux_o_114;
wire mux_o_116;
wire mux_o_129;
wire mux_o_130;
wire mux_o_131;
wire mux_o_133;
wire mux_o_146;
wire mux_o_147;
wire mux_o_148;
wire mux_o_150;
wire mux_o_163;
wire mux_o_164;
wire mux_o_165;
wire mux_o_167;
wire mux_o_180;
wire mux_o_181;
wire mux_o_182;
wire mux_o_184;
wire mux_o_197;
wire mux_o_198;
wire mux_o_199;
wire mux_o_201;
wire mux_o_214;
wire mux_o_215;
wire mux_o_216;
wire mux_o_218;
wire mux_o_231;
wire mux_o_232;
wire mux_o_233;
wire mux_o_235;
wire mux_o_248;
wire mux_o_249;
wire mux_o_250;
wire mux_o_252;
wire mux_o_265;
wire mux_o_266;
wire mux_o_267;
wire mux_o_269;
wire cea_w;
wire ceb_w;
wire gw_gnd;

assign cea_w = ~wrea & cea;
assign ceb_w = ~wreb & ceb;
assign gw_gnd = 1'b0;

LUT4 lut_inst_0 (
  .F(lut_f_0),
  .I0(ada[13]),
  .I1(ada[14]),
  .I2(ada[15]),
  .I3(ada[16])
);
defparam lut_inst_0.INIT = 16'h0100;
LUT5 lut_inst_1 (
  .F(lut_f_1),
  .I0(ada[12]),
  .I1(ada[13]),
  .I2(ada[14]),
  .I3(ada[15]),
  .I4(ada[16])
);
defparam lut_inst_1.INIT = 32'h00040000;
LUT4 lut_inst_2 (
  .F(lut_f_2),
  .I0(adb[13]),
  .I1(adb[14]),
  .I2(adb[15]),
  .I3(adb[16])
);
defparam lut_inst_2.INIT = 16'h0100;
LUT5 lut_inst_3 (
  .F(lut_f_3),
  .I0(adb[12]),
  .I1(adb[13]),
  .I2(adb[14]),
  .I3(adb[15]),
  .I4(adb[16])
);
defparam lut_inst_3.INIT = 32'h00040000;
DPB dpb_inst_0 (
    .DOA({dpb_inst_0_douta_w[14:0],dpb_inst_0_douta[0]}),
    .DOB({dpb_inst_0_doutb_w[14:0],dpb_inst_0_doutb[0]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({ada[16],ada[15],ada[14]}),
    .BLKSELB({adb[16],adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[0]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[0]})
);

defparam dpb_inst_0.READ_MODE0 = 1'b0;
defparam dpb_inst_0.READ_MODE1 = 1'b0;
defparam dpb_inst_0.WRITE_MODE0 = 2'b00;
defparam dpb_inst_0.WRITE_MODE1 = 2'b00;
defparam dpb_inst_0.BIT_WIDTH_0 = 1;
defparam dpb_inst_0.BIT_WIDTH_1 = 1;
defparam dpb_inst_0.BLK_SEL_0 = 3'b000;
defparam dpb_inst_0.BLK_SEL_1 = 3'b000;
defparam dpb_inst_0.RESET_MODE = "SYNC";

DPB dpb_inst_1 (
    .DOA({dpb_inst_1_douta_w[14:0],dpb_inst_1_douta[0]}),
    .DOB({dpb_inst_1_doutb_w[14:0],dpb_inst_1_doutb[0]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({ada[16],ada[15],ada[14]}),
    .BLKSELB({adb[16],adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[0]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[0]})
);

defparam dpb_inst_1.READ_MODE0 = 1'b0;
defparam dpb_inst_1.READ_MODE1 = 1'b0;
defparam dpb_inst_1.WRITE_MODE0 = 2'b00;
defparam dpb_inst_1.WRITE_MODE1 = 2'b00;
defparam dpb_inst_1.BIT_WIDTH_0 = 1;
defparam dpb_inst_1.BIT_WIDTH_1 = 1;
defparam dpb_inst_1.BLK_SEL_0 = 3'b001;
defparam dpb_inst_1.BLK_SEL_1 = 3'b001;
defparam dpb_inst_1.RESET_MODE = "SYNC";

DPB dpb_inst_2 (
    .DOA({dpb_inst_2_douta_w[14:0],dpb_inst_2_douta[0]}),
    .DOB({dpb_inst_2_doutb_w[14:0],dpb_inst_2_doutb[0]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({ada[16],ada[15],ada[14]}),
    .BLKSELB({adb[16],adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[0]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[0]})
);

defparam dpb_inst_2.READ_MODE0 = 1'b0;
defparam dpb_inst_2.READ_MODE1 = 1'b0;
defparam dpb_inst_2.WRITE_MODE0 = 2'b00;
defparam dpb_inst_2.WRITE_MODE1 = 2'b00;
defparam dpb_inst_2.BIT_WIDTH_0 = 1;
defparam dpb_inst_2.BIT_WIDTH_1 = 1;
defparam dpb_inst_2.BLK_SEL_0 = 3'b010;
defparam dpb_inst_2.BLK_SEL_1 = 3'b010;
defparam dpb_inst_2.RESET_MODE = "SYNC";

DPB dpb_inst_3 (
    .DOA({dpb_inst_3_douta_w[14:0],dpb_inst_3_douta[0]}),
    .DOB({dpb_inst_3_doutb_w[14:0],dpb_inst_3_doutb[0]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({ada[16],ada[15],ada[14]}),
    .BLKSELB({adb[16],adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[0]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[0]})
);

defparam dpb_inst_3.READ_MODE0 = 1'b0;
defparam dpb_inst_3.READ_MODE1 = 1'b0;
defparam dpb_inst_3.WRITE_MODE0 = 2'b00;
defparam dpb_inst_3.WRITE_MODE1 = 2'b00;
defparam dpb_inst_3.BIT_WIDTH_0 = 1;
defparam dpb_inst_3.BIT_WIDTH_1 = 1;
defparam dpb_inst_3.BLK_SEL_0 = 3'b011;
defparam dpb_inst_3.BLK_SEL_1 = 3'b011;
defparam dpb_inst_3.RESET_MODE = "SYNC";

DPB dpb_inst_4 (
    .DOA({dpb_inst_4_douta_w[14:0],dpb_inst_4_douta[1]}),
    .DOB({dpb_inst_4_doutb_w[14:0],dpb_inst_4_doutb[1]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({ada[16],ada[15],ada[14]}),
    .BLKSELB({adb[16],adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[1]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[1]})
);

defparam dpb_inst_4.READ_MODE0 = 1'b0;
defparam dpb_inst_4.READ_MODE1 = 1'b0;
defparam dpb_inst_4.WRITE_MODE0 = 2'b00;
defparam dpb_inst_4.WRITE_MODE1 = 2'b00;
defparam dpb_inst_4.BIT_WIDTH_0 = 1;
defparam dpb_inst_4.BIT_WIDTH_1 = 1;
defparam dpb_inst_4.BLK_SEL_0 = 3'b000;
defparam dpb_inst_4.BLK_SEL_1 = 3'b000;
defparam dpb_inst_4.RESET_MODE = "SYNC";

DPB dpb_inst_5 (
    .DOA({dpb_inst_5_douta_w[14:0],dpb_inst_5_douta[1]}),
    .DOB({dpb_inst_5_doutb_w[14:0],dpb_inst_5_doutb[1]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({ada[16],ada[15],ada[14]}),
    .BLKSELB({adb[16],adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[1]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[1]})
);

defparam dpb_inst_5.READ_MODE0 = 1'b0;
defparam dpb_inst_5.READ_MODE1 = 1'b0;
defparam dpb_inst_5.WRITE_MODE0 = 2'b00;
defparam dpb_inst_5.WRITE_MODE1 = 2'b00;
defparam dpb_inst_5.BIT_WIDTH_0 = 1;
defparam dpb_inst_5.BIT_WIDTH_1 = 1;
defparam dpb_inst_5.BLK_SEL_0 = 3'b001;
defparam dpb_inst_5.BLK_SEL_1 = 3'b001;
defparam dpb_inst_5.RESET_MODE = "SYNC";

DPB dpb_inst_6 (
    .DOA({dpb_inst_6_douta_w[14:0],dpb_inst_6_douta[1]}),
    .DOB({dpb_inst_6_doutb_w[14:0],dpb_inst_6_doutb[1]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({ada[16],ada[15],ada[14]}),
    .BLKSELB({adb[16],adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[1]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[1]})
);

defparam dpb_inst_6.READ_MODE0 = 1'b0;
defparam dpb_inst_6.READ_MODE1 = 1'b0;
defparam dpb_inst_6.WRITE_MODE0 = 2'b00;
defparam dpb_inst_6.WRITE_MODE1 = 2'b00;
defparam dpb_inst_6.BIT_WIDTH_0 = 1;
defparam dpb_inst_6.BIT_WIDTH_1 = 1;
defparam dpb_inst_6.BLK_SEL_0 = 3'b010;
defparam dpb_inst_6.BLK_SEL_1 = 3'b010;
defparam dpb_inst_6.RESET_MODE = "SYNC";

DPB dpb_inst_7 (
    .DOA({dpb_inst_7_douta_w[14:0],dpb_inst_7_douta[1]}),
    .DOB({dpb_inst_7_doutb_w[14:0],dpb_inst_7_doutb[1]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({ada[16],ada[15],ada[14]}),
    .BLKSELB({adb[16],adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[1]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[1]})
);

defparam dpb_inst_7.READ_MODE0 = 1'b0;
defparam dpb_inst_7.READ_MODE1 = 1'b0;
defparam dpb_inst_7.WRITE_MODE0 = 2'b00;
defparam dpb_inst_7.WRITE_MODE1 = 2'b00;
defparam dpb_inst_7.BIT_WIDTH_0 = 1;
defparam dpb_inst_7.BIT_WIDTH_1 = 1;
defparam dpb_inst_7.BLK_SEL_0 = 3'b011;
defparam dpb_inst_7.BLK_SEL_1 = 3'b011;
defparam dpb_inst_7.RESET_MODE = "SYNC";

DPB dpb_inst_8 (
    .DOA({dpb_inst_8_douta_w[14:0],dpb_inst_8_douta[2]}),
    .DOB({dpb_inst_8_doutb_w[14:0],dpb_inst_8_doutb[2]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({ada[16],ada[15],ada[14]}),
    .BLKSELB({adb[16],adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[2]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[2]})
);

defparam dpb_inst_8.READ_MODE0 = 1'b0;
defparam dpb_inst_8.READ_MODE1 = 1'b0;
defparam dpb_inst_8.WRITE_MODE0 = 2'b00;
defparam dpb_inst_8.WRITE_MODE1 = 2'b00;
defparam dpb_inst_8.BIT_WIDTH_0 = 1;
defparam dpb_inst_8.BIT_WIDTH_1 = 1;
defparam dpb_inst_8.BLK_SEL_0 = 3'b000;
defparam dpb_inst_8.BLK_SEL_1 = 3'b000;
defparam dpb_inst_8.RESET_MODE = "SYNC";

DPB dpb_inst_9 (
    .DOA({dpb_inst_9_douta_w[14:0],dpb_inst_9_douta[2]}),
    .DOB({dpb_inst_9_doutb_w[14:0],dpb_inst_9_doutb[2]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({ada[16],ada[15],ada[14]}),
    .BLKSELB({adb[16],adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[2]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[2]})
);

defparam dpb_inst_9.READ_MODE0 = 1'b0;
defparam dpb_inst_9.READ_MODE1 = 1'b0;
defparam dpb_inst_9.WRITE_MODE0 = 2'b00;
defparam dpb_inst_9.WRITE_MODE1 = 2'b00;
defparam dpb_inst_9.BIT_WIDTH_0 = 1;
defparam dpb_inst_9.BIT_WIDTH_1 = 1;
defparam dpb_inst_9.BLK_SEL_0 = 3'b001;
defparam dpb_inst_9.BLK_SEL_1 = 3'b001;
defparam dpb_inst_9.RESET_MODE = "SYNC";

DPB dpb_inst_10 (
    .DOA({dpb_inst_10_douta_w[14:0],dpb_inst_10_douta[2]}),
    .DOB({dpb_inst_10_doutb_w[14:0],dpb_inst_10_doutb[2]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({ada[16],ada[15],ada[14]}),
    .BLKSELB({adb[16],adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[2]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[2]})
);

defparam dpb_inst_10.READ_MODE0 = 1'b0;
defparam dpb_inst_10.READ_MODE1 = 1'b0;
defparam dpb_inst_10.WRITE_MODE0 = 2'b00;
defparam dpb_inst_10.WRITE_MODE1 = 2'b00;
defparam dpb_inst_10.BIT_WIDTH_0 = 1;
defparam dpb_inst_10.BIT_WIDTH_1 = 1;
defparam dpb_inst_10.BLK_SEL_0 = 3'b010;
defparam dpb_inst_10.BLK_SEL_1 = 3'b010;
defparam dpb_inst_10.RESET_MODE = "SYNC";

DPB dpb_inst_11 (
    .DOA({dpb_inst_11_douta_w[14:0],dpb_inst_11_douta[2]}),
    .DOB({dpb_inst_11_doutb_w[14:0],dpb_inst_11_doutb[2]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({ada[16],ada[15],ada[14]}),
    .BLKSELB({adb[16],adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[2]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[2]})
);

defparam dpb_inst_11.READ_MODE0 = 1'b0;
defparam dpb_inst_11.READ_MODE1 = 1'b0;
defparam dpb_inst_11.WRITE_MODE0 = 2'b00;
defparam dpb_inst_11.WRITE_MODE1 = 2'b00;
defparam dpb_inst_11.BIT_WIDTH_0 = 1;
defparam dpb_inst_11.BIT_WIDTH_1 = 1;
defparam dpb_inst_11.BLK_SEL_0 = 3'b011;
defparam dpb_inst_11.BLK_SEL_1 = 3'b011;
defparam dpb_inst_11.RESET_MODE = "SYNC";

DPB dpb_inst_12 (
    .DOA({dpb_inst_12_douta_w[14:0],dpb_inst_12_douta[3]}),
    .DOB({dpb_inst_12_doutb_w[14:0],dpb_inst_12_doutb[3]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({ada[16],ada[15],ada[14]}),
    .BLKSELB({adb[16],adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[3]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[3]})
);

defparam dpb_inst_12.READ_MODE0 = 1'b0;
defparam dpb_inst_12.READ_MODE1 = 1'b0;
defparam dpb_inst_12.WRITE_MODE0 = 2'b00;
defparam dpb_inst_12.WRITE_MODE1 = 2'b00;
defparam dpb_inst_12.BIT_WIDTH_0 = 1;
defparam dpb_inst_12.BIT_WIDTH_1 = 1;
defparam dpb_inst_12.BLK_SEL_0 = 3'b000;
defparam dpb_inst_12.BLK_SEL_1 = 3'b000;
defparam dpb_inst_12.RESET_MODE = "SYNC";

DPB dpb_inst_13 (
    .DOA({dpb_inst_13_douta_w[14:0],dpb_inst_13_douta[3]}),
    .DOB({dpb_inst_13_doutb_w[14:0],dpb_inst_13_doutb[3]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({ada[16],ada[15],ada[14]}),
    .BLKSELB({adb[16],adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[3]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[3]})
);

defparam dpb_inst_13.READ_MODE0 = 1'b0;
defparam dpb_inst_13.READ_MODE1 = 1'b0;
defparam dpb_inst_13.WRITE_MODE0 = 2'b00;
defparam dpb_inst_13.WRITE_MODE1 = 2'b00;
defparam dpb_inst_13.BIT_WIDTH_0 = 1;
defparam dpb_inst_13.BIT_WIDTH_1 = 1;
defparam dpb_inst_13.BLK_SEL_0 = 3'b001;
defparam dpb_inst_13.BLK_SEL_1 = 3'b001;
defparam dpb_inst_13.RESET_MODE = "SYNC";

DPB dpb_inst_14 (
    .DOA({dpb_inst_14_douta_w[14:0],dpb_inst_14_douta[3]}),
    .DOB({dpb_inst_14_doutb_w[14:0],dpb_inst_14_doutb[3]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({ada[16],ada[15],ada[14]}),
    .BLKSELB({adb[16],adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[3]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[3]})
);

defparam dpb_inst_14.READ_MODE0 = 1'b0;
defparam dpb_inst_14.READ_MODE1 = 1'b0;
defparam dpb_inst_14.WRITE_MODE0 = 2'b00;
defparam dpb_inst_14.WRITE_MODE1 = 2'b00;
defparam dpb_inst_14.BIT_WIDTH_0 = 1;
defparam dpb_inst_14.BIT_WIDTH_1 = 1;
defparam dpb_inst_14.BLK_SEL_0 = 3'b010;
defparam dpb_inst_14.BLK_SEL_1 = 3'b010;
defparam dpb_inst_14.RESET_MODE = "SYNC";

DPB dpb_inst_15 (
    .DOA({dpb_inst_15_douta_w[14:0],dpb_inst_15_douta[3]}),
    .DOB({dpb_inst_15_doutb_w[14:0],dpb_inst_15_doutb[3]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({ada[16],ada[15],ada[14]}),
    .BLKSELB({adb[16],adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[3]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[3]})
);

defparam dpb_inst_15.READ_MODE0 = 1'b0;
defparam dpb_inst_15.READ_MODE1 = 1'b0;
defparam dpb_inst_15.WRITE_MODE0 = 2'b00;
defparam dpb_inst_15.WRITE_MODE1 = 2'b00;
defparam dpb_inst_15.BIT_WIDTH_0 = 1;
defparam dpb_inst_15.BIT_WIDTH_1 = 1;
defparam dpb_inst_15.BLK_SEL_0 = 3'b011;
defparam dpb_inst_15.BLK_SEL_1 = 3'b011;
defparam dpb_inst_15.RESET_MODE = "SYNC";

DPB dpb_inst_16 (
    .DOA({dpb_inst_16_douta_w[13:0],dpb_inst_16_douta[1:0]}),
    .DOB({dpb_inst_16_doutb_w[13:0],dpb_inst_16_doutb[1:0]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,gw_gnd,lut_f_0}),
    .BLKSELB({gw_gnd,gw_gnd,lut_f_2}),
    .ADA({ada[12:0],gw_gnd}),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[1:0]}),
    .ADB({adb[12:0],gw_gnd}),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[1:0]})
);

defparam dpb_inst_16.READ_MODE0 = 1'b0;
defparam dpb_inst_16.READ_MODE1 = 1'b0;
defparam dpb_inst_16.WRITE_MODE0 = 2'b00;
defparam dpb_inst_16.WRITE_MODE1 = 2'b00;
defparam dpb_inst_16.BIT_WIDTH_0 = 2;
defparam dpb_inst_16.BIT_WIDTH_1 = 2;
defparam dpb_inst_16.BLK_SEL_0 = 3'b001;
defparam dpb_inst_16.BLK_SEL_1 = 3'b001;
defparam dpb_inst_16.RESET_MODE = "SYNC";

DPB dpb_inst_17 (
    .DOA({dpb_inst_17_douta_w[13:0],dpb_inst_17_douta[3:2]}),
    .DOB({dpb_inst_17_doutb_w[13:0],dpb_inst_17_doutb[3:2]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,gw_gnd,lut_f_0}),
    .BLKSELB({gw_gnd,gw_gnd,lut_f_2}),
    .ADA({ada[12:0],gw_gnd}),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[3:2]}),
    .ADB({adb[12:0],gw_gnd}),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[3:2]})
);

defparam dpb_inst_17.READ_MODE0 = 1'b0;
defparam dpb_inst_17.READ_MODE1 = 1'b0;
defparam dpb_inst_17.WRITE_MODE0 = 2'b00;
defparam dpb_inst_17.WRITE_MODE1 = 2'b00;
defparam dpb_inst_17.BIT_WIDTH_0 = 2;
defparam dpb_inst_17.BIT_WIDTH_1 = 2;
defparam dpb_inst_17.BLK_SEL_0 = 3'b001;
defparam dpb_inst_17.BLK_SEL_1 = 3'b001;
defparam dpb_inst_17.RESET_MODE = "SYNC";

DPB dpb_inst_18 (
    .DOA({dpb_inst_18_douta_w[11:0],dpb_inst_18_douta[3:0]}),
    .DOB({dpb_inst_18_doutb_w[11:0],dpb_inst_18_doutb[3:0]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,gw_gnd,lut_f_1}),
    .BLKSELB({gw_gnd,gw_gnd,lut_f_3}),
    .ADA({ada[11:0],gw_gnd,gw_gnd}),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[3:0]}),
    .ADB({adb[11:0],gw_gnd,gw_gnd}),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[3:0]})
);

defparam dpb_inst_18.READ_MODE0 = 1'b0;
defparam dpb_inst_18.READ_MODE1 = 1'b0;
defparam dpb_inst_18.WRITE_MODE0 = 2'b00;
defparam dpb_inst_18.WRITE_MODE1 = 2'b00;
defparam dpb_inst_18.BIT_WIDTH_0 = 4;
defparam dpb_inst_18.BIT_WIDTH_1 = 4;
defparam dpb_inst_18.BLK_SEL_0 = 3'b001;
defparam dpb_inst_18.BLK_SEL_1 = 3'b001;
defparam dpb_inst_18.RESET_MODE = "SYNC";

DPB dpb_inst_19 (
    .DOA({dpb_inst_19_douta_w[14:0],dpb_inst_19_douta[4]}),
    .DOB({dpb_inst_19_doutb_w[14:0],dpb_inst_19_doutb[4]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({ada[16],ada[15],ada[14]}),
    .BLKSELB({adb[16],adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[4]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[4]})
);

defparam dpb_inst_19.READ_MODE0 = 1'b0;
defparam dpb_inst_19.READ_MODE1 = 1'b0;
defparam dpb_inst_19.WRITE_MODE0 = 2'b00;
defparam dpb_inst_19.WRITE_MODE1 = 2'b00;
defparam dpb_inst_19.BIT_WIDTH_0 = 1;
defparam dpb_inst_19.BIT_WIDTH_1 = 1;
defparam dpb_inst_19.BLK_SEL_0 = 3'b000;
defparam dpb_inst_19.BLK_SEL_1 = 3'b000;
defparam dpb_inst_19.RESET_MODE = "SYNC";

DPB dpb_inst_20 (
    .DOA({dpb_inst_20_douta_w[14:0],dpb_inst_20_douta[4]}),
    .DOB({dpb_inst_20_doutb_w[14:0],dpb_inst_20_doutb[4]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({ada[16],ada[15],ada[14]}),
    .BLKSELB({adb[16],adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[4]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[4]})
);

defparam dpb_inst_20.READ_MODE0 = 1'b0;
defparam dpb_inst_20.READ_MODE1 = 1'b0;
defparam dpb_inst_20.WRITE_MODE0 = 2'b00;
defparam dpb_inst_20.WRITE_MODE1 = 2'b00;
defparam dpb_inst_20.BIT_WIDTH_0 = 1;
defparam dpb_inst_20.BIT_WIDTH_1 = 1;
defparam dpb_inst_20.BLK_SEL_0 = 3'b001;
defparam dpb_inst_20.BLK_SEL_1 = 3'b001;
defparam dpb_inst_20.RESET_MODE = "SYNC";

DPB dpb_inst_21 (
    .DOA({dpb_inst_21_douta_w[14:0],dpb_inst_21_douta[4]}),
    .DOB({dpb_inst_21_doutb_w[14:0],dpb_inst_21_doutb[4]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({ada[16],ada[15],ada[14]}),
    .BLKSELB({adb[16],adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[4]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[4]})
);

defparam dpb_inst_21.READ_MODE0 = 1'b0;
defparam dpb_inst_21.READ_MODE1 = 1'b0;
defparam dpb_inst_21.WRITE_MODE0 = 2'b00;
defparam dpb_inst_21.WRITE_MODE1 = 2'b00;
defparam dpb_inst_21.BIT_WIDTH_0 = 1;
defparam dpb_inst_21.BIT_WIDTH_1 = 1;
defparam dpb_inst_21.BLK_SEL_0 = 3'b010;
defparam dpb_inst_21.BLK_SEL_1 = 3'b010;
defparam dpb_inst_21.RESET_MODE = "SYNC";

DPB dpb_inst_22 (
    .DOA({dpb_inst_22_douta_w[14:0],dpb_inst_22_douta[4]}),
    .DOB({dpb_inst_22_doutb_w[14:0],dpb_inst_22_doutb[4]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({ada[16],ada[15],ada[14]}),
    .BLKSELB({adb[16],adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[4]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[4]})
);

defparam dpb_inst_22.READ_MODE0 = 1'b0;
defparam dpb_inst_22.READ_MODE1 = 1'b0;
defparam dpb_inst_22.WRITE_MODE0 = 2'b00;
defparam dpb_inst_22.WRITE_MODE1 = 2'b00;
defparam dpb_inst_22.BIT_WIDTH_0 = 1;
defparam dpb_inst_22.BIT_WIDTH_1 = 1;
defparam dpb_inst_22.BLK_SEL_0 = 3'b011;
defparam dpb_inst_22.BLK_SEL_1 = 3'b011;
defparam dpb_inst_22.RESET_MODE = "SYNC";

DPB dpb_inst_23 (
    .DOA({dpb_inst_23_douta_w[14:0],dpb_inst_23_douta[5]}),
    .DOB({dpb_inst_23_doutb_w[14:0],dpb_inst_23_doutb[5]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({ada[16],ada[15],ada[14]}),
    .BLKSELB({adb[16],adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[5]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[5]})
);

defparam dpb_inst_23.READ_MODE0 = 1'b0;
defparam dpb_inst_23.READ_MODE1 = 1'b0;
defparam dpb_inst_23.WRITE_MODE0 = 2'b00;
defparam dpb_inst_23.WRITE_MODE1 = 2'b00;
defparam dpb_inst_23.BIT_WIDTH_0 = 1;
defparam dpb_inst_23.BIT_WIDTH_1 = 1;
defparam dpb_inst_23.BLK_SEL_0 = 3'b000;
defparam dpb_inst_23.BLK_SEL_1 = 3'b000;
defparam dpb_inst_23.RESET_MODE = "SYNC";

DPB dpb_inst_24 (
    .DOA({dpb_inst_24_douta_w[14:0],dpb_inst_24_douta[5]}),
    .DOB({dpb_inst_24_doutb_w[14:0],dpb_inst_24_doutb[5]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({ada[16],ada[15],ada[14]}),
    .BLKSELB({adb[16],adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[5]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[5]})
);

defparam dpb_inst_24.READ_MODE0 = 1'b0;
defparam dpb_inst_24.READ_MODE1 = 1'b0;
defparam dpb_inst_24.WRITE_MODE0 = 2'b00;
defparam dpb_inst_24.WRITE_MODE1 = 2'b00;
defparam dpb_inst_24.BIT_WIDTH_0 = 1;
defparam dpb_inst_24.BIT_WIDTH_1 = 1;
defparam dpb_inst_24.BLK_SEL_0 = 3'b001;
defparam dpb_inst_24.BLK_SEL_1 = 3'b001;
defparam dpb_inst_24.RESET_MODE = "SYNC";

DPB dpb_inst_25 (
    .DOA({dpb_inst_25_douta_w[14:0],dpb_inst_25_douta[5]}),
    .DOB({dpb_inst_25_doutb_w[14:0],dpb_inst_25_doutb[5]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({ada[16],ada[15],ada[14]}),
    .BLKSELB({adb[16],adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[5]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[5]})
);

defparam dpb_inst_25.READ_MODE0 = 1'b0;
defparam dpb_inst_25.READ_MODE1 = 1'b0;
defparam dpb_inst_25.WRITE_MODE0 = 2'b00;
defparam dpb_inst_25.WRITE_MODE1 = 2'b00;
defparam dpb_inst_25.BIT_WIDTH_0 = 1;
defparam dpb_inst_25.BIT_WIDTH_1 = 1;
defparam dpb_inst_25.BLK_SEL_0 = 3'b010;
defparam dpb_inst_25.BLK_SEL_1 = 3'b010;
defparam dpb_inst_25.RESET_MODE = "SYNC";

DPB dpb_inst_26 (
    .DOA({dpb_inst_26_douta_w[14:0],dpb_inst_26_douta[5]}),
    .DOB({dpb_inst_26_doutb_w[14:0],dpb_inst_26_doutb[5]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({ada[16],ada[15],ada[14]}),
    .BLKSELB({adb[16],adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[5]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[5]})
);

defparam dpb_inst_26.READ_MODE0 = 1'b0;
defparam dpb_inst_26.READ_MODE1 = 1'b0;
defparam dpb_inst_26.WRITE_MODE0 = 2'b00;
defparam dpb_inst_26.WRITE_MODE1 = 2'b00;
defparam dpb_inst_26.BIT_WIDTH_0 = 1;
defparam dpb_inst_26.BIT_WIDTH_1 = 1;
defparam dpb_inst_26.BLK_SEL_0 = 3'b011;
defparam dpb_inst_26.BLK_SEL_1 = 3'b011;
defparam dpb_inst_26.RESET_MODE = "SYNC";

DPB dpb_inst_27 (
    .DOA({dpb_inst_27_douta_w[14:0],dpb_inst_27_douta[6]}),
    .DOB({dpb_inst_27_doutb_w[14:0],dpb_inst_27_doutb[6]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({ada[16],ada[15],ada[14]}),
    .BLKSELB({adb[16],adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[6]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[6]})
);

defparam dpb_inst_27.READ_MODE0 = 1'b0;
defparam dpb_inst_27.READ_MODE1 = 1'b0;
defparam dpb_inst_27.WRITE_MODE0 = 2'b00;
defparam dpb_inst_27.WRITE_MODE1 = 2'b00;
defparam dpb_inst_27.BIT_WIDTH_0 = 1;
defparam dpb_inst_27.BIT_WIDTH_1 = 1;
defparam dpb_inst_27.BLK_SEL_0 = 3'b000;
defparam dpb_inst_27.BLK_SEL_1 = 3'b000;
defparam dpb_inst_27.RESET_MODE = "SYNC";

DPB dpb_inst_28 (
    .DOA({dpb_inst_28_douta_w[14:0],dpb_inst_28_douta[6]}),
    .DOB({dpb_inst_28_doutb_w[14:0],dpb_inst_28_doutb[6]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({ada[16],ada[15],ada[14]}),
    .BLKSELB({adb[16],adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[6]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[6]})
);

defparam dpb_inst_28.READ_MODE0 = 1'b0;
defparam dpb_inst_28.READ_MODE1 = 1'b0;
defparam dpb_inst_28.WRITE_MODE0 = 2'b00;
defparam dpb_inst_28.WRITE_MODE1 = 2'b00;
defparam dpb_inst_28.BIT_WIDTH_0 = 1;
defparam dpb_inst_28.BIT_WIDTH_1 = 1;
defparam dpb_inst_28.BLK_SEL_0 = 3'b001;
defparam dpb_inst_28.BLK_SEL_1 = 3'b001;
defparam dpb_inst_28.RESET_MODE = "SYNC";

DPB dpb_inst_29 (
    .DOA({dpb_inst_29_douta_w[14:0],dpb_inst_29_douta[6]}),
    .DOB({dpb_inst_29_doutb_w[14:0],dpb_inst_29_doutb[6]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({ada[16],ada[15],ada[14]}),
    .BLKSELB({adb[16],adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[6]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[6]})
);

defparam dpb_inst_29.READ_MODE0 = 1'b0;
defparam dpb_inst_29.READ_MODE1 = 1'b0;
defparam dpb_inst_29.WRITE_MODE0 = 2'b00;
defparam dpb_inst_29.WRITE_MODE1 = 2'b00;
defparam dpb_inst_29.BIT_WIDTH_0 = 1;
defparam dpb_inst_29.BIT_WIDTH_1 = 1;
defparam dpb_inst_29.BLK_SEL_0 = 3'b010;
defparam dpb_inst_29.BLK_SEL_1 = 3'b010;
defparam dpb_inst_29.RESET_MODE = "SYNC";

DPB dpb_inst_30 (
    .DOA({dpb_inst_30_douta_w[14:0],dpb_inst_30_douta[6]}),
    .DOB({dpb_inst_30_doutb_w[14:0],dpb_inst_30_doutb[6]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({ada[16],ada[15],ada[14]}),
    .BLKSELB({adb[16],adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[6]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[6]})
);

defparam dpb_inst_30.READ_MODE0 = 1'b0;
defparam dpb_inst_30.READ_MODE1 = 1'b0;
defparam dpb_inst_30.WRITE_MODE0 = 2'b00;
defparam dpb_inst_30.WRITE_MODE1 = 2'b00;
defparam dpb_inst_30.BIT_WIDTH_0 = 1;
defparam dpb_inst_30.BIT_WIDTH_1 = 1;
defparam dpb_inst_30.BLK_SEL_0 = 3'b011;
defparam dpb_inst_30.BLK_SEL_1 = 3'b011;
defparam dpb_inst_30.RESET_MODE = "SYNC";

DPB dpb_inst_31 (
    .DOA({dpb_inst_31_douta_w[14:0],dpb_inst_31_douta[7]}),
    .DOB({dpb_inst_31_doutb_w[14:0],dpb_inst_31_doutb[7]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({ada[16],ada[15],ada[14]}),
    .BLKSELB({adb[16],adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[7]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[7]})
);

defparam dpb_inst_31.READ_MODE0 = 1'b0;
defparam dpb_inst_31.READ_MODE1 = 1'b0;
defparam dpb_inst_31.WRITE_MODE0 = 2'b00;
defparam dpb_inst_31.WRITE_MODE1 = 2'b00;
defparam dpb_inst_31.BIT_WIDTH_0 = 1;
defparam dpb_inst_31.BIT_WIDTH_1 = 1;
defparam dpb_inst_31.BLK_SEL_0 = 3'b000;
defparam dpb_inst_31.BLK_SEL_1 = 3'b000;
defparam dpb_inst_31.RESET_MODE = "SYNC";

DPB dpb_inst_32 (
    .DOA({dpb_inst_32_douta_w[14:0],dpb_inst_32_douta[7]}),
    .DOB({dpb_inst_32_doutb_w[14:0],dpb_inst_32_doutb[7]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({ada[16],ada[15],ada[14]}),
    .BLKSELB({adb[16],adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[7]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[7]})
);

defparam dpb_inst_32.READ_MODE0 = 1'b0;
defparam dpb_inst_32.READ_MODE1 = 1'b0;
defparam dpb_inst_32.WRITE_MODE0 = 2'b00;
defparam dpb_inst_32.WRITE_MODE1 = 2'b00;
defparam dpb_inst_32.BIT_WIDTH_0 = 1;
defparam dpb_inst_32.BIT_WIDTH_1 = 1;
defparam dpb_inst_32.BLK_SEL_0 = 3'b001;
defparam dpb_inst_32.BLK_SEL_1 = 3'b001;
defparam dpb_inst_32.RESET_MODE = "SYNC";

DPB dpb_inst_33 (
    .DOA({dpb_inst_33_douta_w[14:0],dpb_inst_33_douta[7]}),
    .DOB({dpb_inst_33_doutb_w[14:0],dpb_inst_33_doutb[7]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({ada[16],ada[15],ada[14]}),
    .BLKSELB({adb[16],adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[7]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[7]})
);

defparam dpb_inst_33.READ_MODE0 = 1'b0;
defparam dpb_inst_33.READ_MODE1 = 1'b0;
defparam dpb_inst_33.WRITE_MODE0 = 2'b00;
defparam dpb_inst_33.WRITE_MODE1 = 2'b00;
defparam dpb_inst_33.BIT_WIDTH_0 = 1;
defparam dpb_inst_33.BIT_WIDTH_1 = 1;
defparam dpb_inst_33.BLK_SEL_0 = 3'b010;
defparam dpb_inst_33.BLK_SEL_1 = 3'b010;
defparam dpb_inst_33.RESET_MODE = "SYNC";

DPB dpb_inst_34 (
    .DOA({dpb_inst_34_douta_w[14:0],dpb_inst_34_douta[7]}),
    .DOB({dpb_inst_34_doutb_w[14:0],dpb_inst_34_doutb[7]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({ada[16],ada[15],ada[14]}),
    .BLKSELB({adb[16],adb[15],adb[14]}),
    .ADA(ada[13:0]),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[7]}),
    .ADB(adb[13:0]),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[7]})
);

defparam dpb_inst_34.READ_MODE0 = 1'b0;
defparam dpb_inst_34.READ_MODE1 = 1'b0;
defparam dpb_inst_34.WRITE_MODE0 = 2'b00;
defparam dpb_inst_34.WRITE_MODE1 = 2'b00;
defparam dpb_inst_34.BIT_WIDTH_0 = 1;
defparam dpb_inst_34.BIT_WIDTH_1 = 1;
defparam dpb_inst_34.BLK_SEL_0 = 3'b011;
defparam dpb_inst_34.BLK_SEL_1 = 3'b011;
defparam dpb_inst_34.RESET_MODE = "SYNC";

DPB dpb_inst_35 (
    .DOA({dpb_inst_35_douta_w[13:0],dpb_inst_35_douta[5:4]}),
    .DOB({dpb_inst_35_doutb_w[13:0],dpb_inst_35_doutb[5:4]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,gw_gnd,lut_f_0}),
    .BLKSELB({gw_gnd,gw_gnd,lut_f_2}),
    .ADA({ada[12:0],gw_gnd}),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[5:4]}),
    .ADB({adb[12:0],gw_gnd}),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[5:4]})
);

defparam dpb_inst_35.READ_MODE0 = 1'b0;
defparam dpb_inst_35.READ_MODE1 = 1'b0;
defparam dpb_inst_35.WRITE_MODE0 = 2'b00;
defparam dpb_inst_35.WRITE_MODE1 = 2'b00;
defparam dpb_inst_35.BIT_WIDTH_0 = 2;
defparam dpb_inst_35.BIT_WIDTH_1 = 2;
defparam dpb_inst_35.BLK_SEL_0 = 3'b001;
defparam dpb_inst_35.BLK_SEL_1 = 3'b001;
defparam dpb_inst_35.RESET_MODE = "SYNC";

DPB dpb_inst_36 (
    .DOA({dpb_inst_36_douta_w[13:0],dpb_inst_36_douta[7:6]}),
    .DOB({dpb_inst_36_doutb_w[13:0],dpb_inst_36_doutb[7:6]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,gw_gnd,lut_f_0}),
    .BLKSELB({gw_gnd,gw_gnd,lut_f_2}),
    .ADA({ada[12:0],gw_gnd}),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[7:6]}),
    .ADB({adb[12:0],gw_gnd}),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[7:6]})
);

defparam dpb_inst_36.READ_MODE0 = 1'b0;
defparam dpb_inst_36.READ_MODE1 = 1'b0;
defparam dpb_inst_36.WRITE_MODE0 = 2'b00;
defparam dpb_inst_36.WRITE_MODE1 = 2'b00;
defparam dpb_inst_36.BIT_WIDTH_0 = 2;
defparam dpb_inst_36.BIT_WIDTH_1 = 2;
defparam dpb_inst_36.BLK_SEL_0 = 3'b001;
defparam dpb_inst_36.BLK_SEL_1 = 3'b001;
defparam dpb_inst_36.RESET_MODE = "SYNC";

DPB dpb_inst_37 (
    .DOA({dpb_inst_37_douta_w[11:0],dpb_inst_37_douta[7:4]}),
    .DOB({dpb_inst_37_doutb_w[11:0],dpb_inst_37_doutb[7:4]}),
    .CLKA(clka),
    .OCEA(ocea),
    .CEA(cea),
    .RESETA(reseta),
    .WREA(wrea),
    .CLKB(clkb),
    .OCEB(oceb),
    .CEB(ceb),
    .RESETB(resetb),
    .WREB(wreb),
    .BLKSELA({gw_gnd,gw_gnd,lut_f_1}),
    .BLKSELB({gw_gnd,gw_gnd,lut_f_3}),
    .ADA({ada[11:0],gw_gnd,gw_gnd}),
    .DIA({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dina[7:4]}),
    .ADB({adb[11:0],gw_gnd,gw_gnd}),
    .DIB({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,dinb[7:4]})
);

defparam dpb_inst_37.READ_MODE0 = 1'b0;
defparam dpb_inst_37.READ_MODE1 = 1'b0;
defparam dpb_inst_37.WRITE_MODE0 = 2'b00;
defparam dpb_inst_37.WRITE_MODE1 = 2'b00;
defparam dpb_inst_37.BIT_WIDTH_0 = 4;
defparam dpb_inst_37.BIT_WIDTH_1 = 4;
defparam dpb_inst_37.BLK_SEL_0 = 3'b001;
defparam dpb_inst_37.BLK_SEL_1 = 3'b001;
defparam dpb_inst_37.RESET_MODE = "SYNC";

DFFE dff_inst_0 (
  .Q(dff_q_0),
  .D(ada[16]),
  .CLK(clka),
  .CE(cea_w)
);
DFFE dff_inst_1 (
  .Q(dff_q_1),
  .D(ada[15]),
  .CLK(clka),
  .CE(cea_w)
);
DFFE dff_inst_2 (
  .Q(dff_q_2),
  .D(ada[14]),
  .CLK(clka),
  .CE(cea_w)
);
DFFE dff_inst_3 (
  .Q(dff_q_3),
  .D(ada[13]),
  .CLK(clka),
  .CE(cea_w)
);
DFFE dff_inst_4 (
  .Q(dff_q_4),
  .D(adb[16]),
  .CLK(clkb),
  .CE(ceb_w)
);
DFFE dff_inst_5 (
  .Q(dff_q_5),
  .D(adb[15]),
  .CLK(clkb),
  .CE(ceb_w)
);
DFFE dff_inst_6 (
  .Q(dff_q_6),
  .D(adb[14]),
  .CLK(clkb),
  .CE(ceb_w)
);
DFFE dff_inst_7 (
  .Q(dff_q_7),
  .D(adb[13]),
  .CLK(clkb),
  .CE(ceb_w)
);
MUX2 mux_inst_10 (
  .O(mux_o_10),
  .I0(dpb_inst_16_douta[0]),
  .I1(dpb_inst_18_douta[0]),
  .S0(dff_q_3)
);
MUX2 mux_inst_11 (
  .O(mux_o_11),
  .I0(dpb_inst_0_douta[0]),
  .I1(dpb_inst_1_douta[0]),
  .S0(dff_q_2)
);
MUX2 mux_inst_12 (
  .O(mux_o_12),
  .I0(dpb_inst_2_douta[0]),
  .I1(dpb_inst_3_douta[0]),
  .S0(dff_q_2)
);
MUX2 mux_inst_14 (
  .O(mux_o_14),
  .I0(mux_o_11),
  .I1(mux_o_12),
  .S0(dff_q_1)
);
MUX2 mux_inst_16 (
  .O(douta[0]),
  .I0(mux_o_14),
  .I1(mux_o_10),
  .S0(dff_q_0)
);
MUX2 mux_inst_27 (
  .O(mux_o_27),
  .I0(dpb_inst_16_douta[1]),
  .I1(dpb_inst_18_douta[1]),
  .S0(dff_q_3)
);
MUX2 mux_inst_28 (
  .O(mux_o_28),
  .I0(dpb_inst_4_douta[1]),
  .I1(dpb_inst_5_douta[1]),
  .S0(dff_q_2)
);
MUX2 mux_inst_29 (
  .O(mux_o_29),
  .I0(dpb_inst_6_douta[1]),
  .I1(dpb_inst_7_douta[1]),
  .S0(dff_q_2)
);
MUX2 mux_inst_31 (
  .O(mux_o_31),
  .I0(mux_o_28),
  .I1(mux_o_29),
  .S0(dff_q_1)
);
MUX2 mux_inst_33 (
  .O(douta[1]),
  .I0(mux_o_31),
  .I1(mux_o_27),
  .S0(dff_q_0)
);
MUX2 mux_inst_44 (
  .O(mux_o_44),
  .I0(dpb_inst_17_douta[2]),
  .I1(dpb_inst_18_douta[2]),
  .S0(dff_q_3)
);
MUX2 mux_inst_45 (
  .O(mux_o_45),
  .I0(dpb_inst_8_douta[2]),
  .I1(dpb_inst_9_douta[2]),
  .S0(dff_q_2)
);
MUX2 mux_inst_46 (
  .O(mux_o_46),
  .I0(dpb_inst_10_douta[2]),
  .I1(dpb_inst_11_douta[2]),
  .S0(dff_q_2)
);
MUX2 mux_inst_48 (
  .O(mux_o_48),
  .I0(mux_o_45),
  .I1(mux_o_46),
  .S0(dff_q_1)
);
MUX2 mux_inst_50 (
  .O(douta[2]),
  .I0(mux_o_48),
  .I1(mux_o_44),
  .S0(dff_q_0)
);
MUX2 mux_inst_61 (
  .O(mux_o_61),
  .I0(dpb_inst_17_douta[3]),
  .I1(dpb_inst_18_douta[3]),
  .S0(dff_q_3)
);
MUX2 mux_inst_62 (
  .O(mux_o_62),
  .I0(dpb_inst_12_douta[3]),
  .I1(dpb_inst_13_douta[3]),
  .S0(dff_q_2)
);
MUX2 mux_inst_63 (
  .O(mux_o_63),
  .I0(dpb_inst_14_douta[3]),
  .I1(dpb_inst_15_douta[3]),
  .S0(dff_q_2)
);
MUX2 mux_inst_65 (
  .O(mux_o_65),
  .I0(mux_o_62),
  .I1(mux_o_63),
  .S0(dff_q_1)
);
MUX2 mux_inst_67 (
  .O(douta[3]),
  .I0(mux_o_65),
  .I1(mux_o_61),
  .S0(dff_q_0)
);
MUX2 mux_inst_78 (
  .O(mux_o_78),
  .I0(dpb_inst_35_douta[4]),
  .I1(dpb_inst_37_douta[4]),
  .S0(dff_q_3)
);
MUX2 mux_inst_79 (
  .O(mux_o_79),
  .I0(dpb_inst_19_douta[4]),
  .I1(dpb_inst_20_douta[4]),
  .S0(dff_q_2)
);
MUX2 mux_inst_80 (
  .O(mux_o_80),
  .I0(dpb_inst_21_douta[4]),
  .I1(dpb_inst_22_douta[4]),
  .S0(dff_q_2)
);
MUX2 mux_inst_82 (
  .O(mux_o_82),
  .I0(mux_o_79),
  .I1(mux_o_80),
  .S0(dff_q_1)
);
MUX2 mux_inst_84 (
  .O(douta[4]),
  .I0(mux_o_82),
  .I1(mux_o_78),
  .S0(dff_q_0)
);
MUX2 mux_inst_95 (
  .O(mux_o_95),
  .I0(dpb_inst_35_douta[5]),
  .I1(dpb_inst_37_douta[5]),
  .S0(dff_q_3)
);
MUX2 mux_inst_96 (
  .O(mux_o_96),
  .I0(dpb_inst_23_douta[5]),
  .I1(dpb_inst_24_douta[5]),
  .S0(dff_q_2)
);
MUX2 mux_inst_97 (
  .O(mux_o_97),
  .I0(dpb_inst_25_douta[5]),
  .I1(dpb_inst_26_douta[5]),
  .S0(dff_q_2)
);
MUX2 mux_inst_99 (
  .O(mux_o_99),
  .I0(mux_o_96),
  .I1(mux_o_97),
  .S0(dff_q_1)
);
MUX2 mux_inst_101 (
  .O(douta[5]),
  .I0(mux_o_99),
  .I1(mux_o_95),
  .S0(dff_q_0)
);
MUX2 mux_inst_112 (
  .O(mux_o_112),
  .I0(dpb_inst_36_douta[6]),
  .I1(dpb_inst_37_douta[6]),
  .S0(dff_q_3)
);
MUX2 mux_inst_113 (
  .O(mux_o_113),
  .I0(dpb_inst_27_douta[6]),
  .I1(dpb_inst_28_douta[6]),
  .S0(dff_q_2)
);
MUX2 mux_inst_114 (
  .O(mux_o_114),
  .I0(dpb_inst_29_douta[6]),
  .I1(dpb_inst_30_douta[6]),
  .S0(dff_q_2)
);
MUX2 mux_inst_116 (
  .O(mux_o_116),
  .I0(mux_o_113),
  .I1(mux_o_114),
  .S0(dff_q_1)
);
MUX2 mux_inst_118 (
  .O(douta[6]),
  .I0(mux_o_116),
  .I1(mux_o_112),
  .S0(dff_q_0)
);
MUX2 mux_inst_129 (
  .O(mux_o_129),
  .I0(dpb_inst_36_douta[7]),
  .I1(dpb_inst_37_douta[7]),
  .S0(dff_q_3)
);
MUX2 mux_inst_130 (
  .O(mux_o_130),
  .I0(dpb_inst_31_douta[7]),
  .I1(dpb_inst_32_douta[7]),
  .S0(dff_q_2)
);
MUX2 mux_inst_131 (
  .O(mux_o_131),
  .I0(dpb_inst_33_douta[7]),
  .I1(dpb_inst_34_douta[7]),
  .S0(dff_q_2)
);
MUX2 mux_inst_133 (
  .O(mux_o_133),
  .I0(mux_o_130),
  .I1(mux_o_131),
  .S0(dff_q_1)
);
MUX2 mux_inst_135 (
  .O(douta[7]),
  .I0(mux_o_133),
  .I1(mux_o_129),
  .S0(dff_q_0)
);
MUX2 mux_inst_146 (
  .O(mux_o_146),
  .I0(dpb_inst_16_doutb[0]),
  .I1(dpb_inst_18_doutb[0]),
  .S0(dff_q_7)
);
MUX2 mux_inst_147 (
  .O(mux_o_147),
  .I0(dpb_inst_0_doutb[0]),
  .I1(dpb_inst_1_doutb[0]),
  .S0(dff_q_6)
);
MUX2 mux_inst_148 (
  .O(mux_o_148),
  .I0(dpb_inst_2_doutb[0]),
  .I1(dpb_inst_3_doutb[0]),
  .S0(dff_q_6)
);
MUX2 mux_inst_150 (
  .O(mux_o_150),
  .I0(mux_o_147),
  .I1(mux_o_148),
  .S0(dff_q_5)
);
MUX2 mux_inst_152 (
  .O(doutb[0]),
  .I0(mux_o_150),
  .I1(mux_o_146),
  .S0(dff_q_4)
);
MUX2 mux_inst_163 (
  .O(mux_o_163),
  .I0(dpb_inst_16_doutb[1]),
  .I1(dpb_inst_18_doutb[1]),
  .S0(dff_q_7)
);
MUX2 mux_inst_164 (
  .O(mux_o_164),
  .I0(dpb_inst_4_doutb[1]),
  .I1(dpb_inst_5_doutb[1]),
  .S0(dff_q_6)
);
MUX2 mux_inst_165 (
  .O(mux_o_165),
  .I0(dpb_inst_6_doutb[1]),
  .I1(dpb_inst_7_doutb[1]),
  .S0(dff_q_6)
);
MUX2 mux_inst_167 (
  .O(mux_o_167),
  .I0(mux_o_164),
  .I1(mux_o_165),
  .S0(dff_q_5)
);
MUX2 mux_inst_169 (
  .O(doutb[1]),
  .I0(mux_o_167),
  .I1(mux_o_163),
  .S0(dff_q_4)
);
MUX2 mux_inst_180 (
  .O(mux_o_180),
  .I0(dpb_inst_17_doutb[2]),
  .I1(dpb_inst_18_doutb[2]),
  .S0(dff_q_7)
);
MUX2 mux_inst_181 (
  .O(mux_o_181),
  .I0(dpb_inst_8_doutb[2]),
  .I1(dpb_inst_9_doutb[2]),
  .S0(dff_q_6)
);
MUX2 mux_inst_182 (
  .O(mux_o_182),
  .I0(dpb_inst_10_doutb[2]),
  .I1(dpb_inst_11_doutb[2]),
  .S0(dff_q_6)
);
MUX2 mux_inst_184 (
  .O(mux_o_184),
  .I0(mux_o_181),
  .I1(mux_o_182),
  .S0(dff_q_5)
);
MUX2 mux_inst_186 (
  .O(doutb[2]),
  .I0(mux_o_184),
  .I1(mux_o_180),
  .S0(dff_q_4)
);
MUX2 mux_inst_197 (
  .O(mux_o_197),
  .I0(dpb_inst_17_doutb[3]),
  .I1(dpb_inst_18_doutb[3]),
  .S0(dff_q_7)
);
MUX2 mux_inst_198 (
  .O(mux_o_198),
  .I0(dpb_inst_12_doutb[3]),
  .I1(dpb_inst_13_doutb[3]),
  .S0(dff_q_6)
);
MUX2 mux_inst_199 (
  .O(mux_o_199),
  .I0(dpb_inst_14_doutb[3]),
  .I1(dpb_inst_15_doutb[3]),
  .S0(dff_q_6)
);
MUX2 mux_inst_201 (
  .O(mux_o_201),
  .I0(mux_o_198),
  .I1(mux_o_199),
  .S0(dff_q_5)
);
MUX2 mux_inst_203 (
  .O(doutb[3]),
  .I0(mux_o_201),
  .I1(mux_o_197),
  .S0(dff_q_4)
);
MUX2 mux_inst_214 (
  .O(mux_o_214),
  .I0(dpb_inst_35_doutb[4]),
  .I1(dpb_inst_37_doutb[4]),
  .S0(dff_q_7)
);
MUX2 mux_inst_215 (
  .O(mux_o_215),
  .I0(dpb_inst_19_doutb[4]),
  .I1(dpb_inst_20_doutb[4]),
  .S0(dff_q_6)
);
MUX2 mux_inst_216 (
  .O(mux_o_216),
  .I0(dpb_inst_21_doutb[4]),
  .I1(dpb_inst_22_doutb[4]),
  .S0(dff_q_6)
);
MUX2 mux_inst_218 (
  .O(mux_o_218),
  .I0(mux_o_215),
  .I1(mux_o_216),
  .S0(dff_q_5)
);
MUX2 mux_inst_220 (
  .O(doutb[4]),
  .I0(mux_o_218),
  .I1(mux_o_214),
  .S0(dff_q_4)
);
MUX2 mux_inst_231 (
  .O(mux_o_231),
  .I0(dpb_inst_35_doutb[5]),
  .I1(dpb_inst_37_doutb[5]),
  .S0(dff_q_7)
);
MUX2 mux_inst_232 (
  .O(mux_o_232),
  .I0(dpb_inst_23_doutb[5]),
  .I1(dpb_inst_24_doutb[5]),
  .S0(dff_q_6)
);
MUX2 mux_inst_233 (
  .O(mux_o_233),
  .I0(dpb_inst_25_doutb[5]),
  .I1(dpb_inst_26_doutb[5]),
  .S0(dff_q_6)
);
MUX2 mux_inst_235 (
  .O(mux_o_235),
  .I0(mux_o_232),
  .I1(mux_o_233),
  .S0(dff_q_5)
);
MUX2 mux_inst_237 (
  .O(doutb[5]),
  .I0(mux_o_235),
  .I1(mux_o_231),
  .S0(dff_q_4)
);
MUX2 mux_inst_248 (
  .O(mux_o_248),
  .I0(dpb_inst_36_doutb[6]),
  .I1(dpb_inst_37_doutb[6]),
  .S0(dff_q_7)
);
MUX2 mux_inst_249 (
  .O(mux_o_249),
  .I0(dpb_inst_27_doutb[6]),
  .I1(dpb_inst_28_doutb[6]),
  .S0(dff_q_6)
);
MUX2 mux_inst_250 (
  .O(mux_o_250),
  .I0(dpb_inst_29_doutb[6]),
  .I1(dpb_inst_30_doutb[6]),
  .S0(dff_q_6)
);
MUX2 mux_inst_252 (
  .O(mux_o_252),
  .I0(mux_o_249),
  .I1(mux_o_250),
  .S0(dff_q_5)
);
MUX2 mux_inst_254 (
  .O(doutb[6]),
  .I0(mux_o_252),
  .I1(mux_o_248),
  .S0(dff_q_4)
);
MUX2 mux_inst_265 (
  .O(mux_o_265),
  .I0(dpb_inst_36_doutb[7]),
  .I1(dpb_inst_37_doutb[7]),
  .S0(dff_q_7)
);
MUX2 mux_inst_266 (
  .O(mux_o_266),
  .I0(dpb_inst_31_doutb[7]),
  .I1(dpb_inst_32_doutb[7]),
  .S0(dff_q_6)
);
MUX2 mux_inst_267 (
  .O(mux_o_267),
  .I0(dpb_inst_33_doutb[7]),
  .I1(dpb_inst_34_doutb[7]),
  .S0(dff_q_6)
);
MUX2 mux_inst_269 (
  .O(mux_o_269),
  .I0(mux_o_266),
  .I1(mux_o_267),
  .S0(dff_q_5)
);
MUX2 mux_inst_271 (
  .O(doutb[7]),
  .I0(mux_o_269),
  .I1(mux_o_265),
  .S0(dff_q_4)
);
endmodule //Video_Memory_DPB
