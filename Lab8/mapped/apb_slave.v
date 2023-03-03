/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Tue Feb 28 13:33:07 2023
/////////////////////////////////////////////////////////////


module apb_slave ( clk, n_rst, rx_data, data_ready, overrun_error, 
        framing_error, psel, paddr, penable, pwrite, pwdata, data_read, prdata, 
        pslverr, data_size, bit_period );
  input [7:0] rx_data;
  input [2:0] paddr;
  input [7:0] pwdata;
  output [7:0] prdata;
  output [3:0] data_size;
  output [13:0] bit_period;
  input clk, n_rst, data_ready, overrun_error, framing_error, psel, penable,
         pwrite;
  output data_read, pslverr;
  wire   \reading[0] , \data_status[0] , n119, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n162, n163, n164, n165, n166, n167, n168, n169,
         n170, n171, n172, n173, n174, n175, n176, n177, n178, n179, n180,
         n181, n182, n183, n184, n185, n186, n187, n188, n189, n190, n191,
         n192, n193, n194, n195, n196, n197, n198, n199, n200, n201, n202,
         n203, n204, n205, n206, n207, n208, n209, n210, n211, n212, n213,
         n214, n215, n216, n217, n218, n219, n220, n221, n222, n223;
  wire   [15:14] bit_period_reg;
  wire   [7:0] error_status;
  wire   [7:0] data_buf;
  wire   [1:0] nerror_status;
  assign nerror_status[1] = overrun_error;

  DFFSR \reading_reg[0]  ( .D(n121), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \reading[0] ) );
  DFFSR \reading_reg[1]  ( .D(n119), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_read) );
  DFFSR \data_status_reg[0]  ( .D(data_ready), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\data_status[0] ) );
  DFFSR \error_status_reg[1]  ( .D(nerror_status[1]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(error_status[1]) );
  DFFSR \error_status_reg[0]  ( .D(nerror_status[0]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(error_status[0]) );
  DFFSR \data_size_reg_reg[3]  ( .D(n138), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_size[3]) );
  DFFSR \data_size_reg_reg[2]  ( .D(n139), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_size[2]) );
  DFFSR \data_size_reg_reg[1]  ( .D(n140), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_size[1]) );
  DFFSR \data_size_reg_reg[0]  ( .D(n141), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_size[0]) );
  DFFSR \bit_period_reg_reg[15]  ( .D(n130), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period_reg[15]) );
  DFFSR \bit_period_reg_reg[14]  ( .D(n131), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period_reg[14]) );
  DFFSR \bit_period_reg_reg[13]  ( .D(n132), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[13]) );
  DFFSR \bit_period_reg_reg[12]  ( .D(n133), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[12]) );
  DFFSR \bit_period_reg_reg[11]  ( .D(n134), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[11]) );
  DFFSR \bit_period_reg_reg[10]  ( .D(n135), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[10]) );
  DFFSR \bit_period_reg_reg[9]  ( .D(n136), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[9]) );
  DFFSR \bit_period_reg_reg[8]  ( .D(n137), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[8]) );
  DFFSR \bit_period_reg_reg[7]  ( .D(n126), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[7]) );
  DFFSR \bit_period_reg_reg[6]  ( .D(n127), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[6]) );
  DFFSR \bit_period_reg_reg[5]  ( .D(n128), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[5]) );
  DFFSR \bit_period_reg_reg[4]  ( .D(n129), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[4]) );
  DFFSR \bit_period_reg_reg[3]  ( .D(n122), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[3]) );
  DFFSR \bit_period_reg_reg[2]  ( .D(n123), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[2]) );
  DFFSR \bit_period_reg_reg[1]  ( .D(n124), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[1]) );
  DFFSR \bit_period_reg_reg[0]  ( .D(n125), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[0]) );
  DFFSR \data_buf_reg[7]  ( .D(rx_data[7]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_buf[7]) );
  DFFSR \data_buf_reg[6]  ( .D(rx_data[6]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_buf[6]) );
  DFFSR \data_buf_reg[5]  ( .D(rx_data[5]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_buf[5]) );
  DFFSR \data_buf_reg[4]  ( .D(rx_data[4]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_buf[4]) );
  DFFSR \data_buf_reg[3]  ( .D(rx_data[3]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_buf[3]) );
  DFFSR \data_buf_reg[2]  ( .D(rx_data[2]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_buf[2]) );
  DFFSR \data_buf_reg[1]  ( .D(rx_data[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_buf[1]) );
  DFFSR \data_buf_reg[0]  ( .D(rx_data[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_buf[0]) );
  NOR2X1 U154 ( .A(n142), .B(n143), .Y(pslverr) );
  NAND2X1 U155 ( .A(n144), .B(n145), .Y(n143) );
  OAI21X1 U156 ( .A(paddr[2]), .B(paddr[1]), .C(n146), .Y(n145) );
  OAI21X1 U157 ( .A(n147), .B(n148), .C(n149), .Y(prdata[7]) );
  AOI22X1 U158 ( .A(bit_period_reg[15]), .B(n150), .C(bit_period[7]), .D(n151), 
        .Y(n149) );
  INVX1 U159 ( .A(data_buf[7]), .Y(n148) );
  OAI21X1 U160 ( .A(n147), .B(n152), .C(n153), .Y(prdata[6]) );
  AOI22X1 U161 ( .A(bit_period_reg[14]), .B(n150), .C(bit_period[6]), .D(n151), 
        .Y(n153) );
  INVX1 U162 ( .A(data_buf[6]), .Y(n152) );
  OAI21X1 U163 ( .A(n147), .B(n154), .C(n155), .Y(prdata[5]) );
  AOI22X1 U164 ( .A(bit_period[13]), .B(n150), .C(bit_period[5]), .D(n151), 
        .Y(n155) );
  INVX1 U165 ( .A(data_buf[5]), .Y(n154) );
  OAI21X1 U166 ( .A(n147), .B(n156), .C(n157), .Y(prdata[4]) );
  AOI22X1 U167 ( .A(bit_period[12]), .B(n150), .C(bit_period[4]), .D(n151), 
        .Y(n157) );
  NOR2X1 U168 ( .A(n158), .B(n159), .Y(n151) );
  NOR2X1 U169 ( .A(n160), .B(n159), .Y(n150) );
  INVX1 U170 ( .A(data_buf[4]), .Y(n156) );
  OAI21X1 U171 ( .A(n161), .B(n159), .C(n162), .Y(prdata[3]) );
  NAND2X1 U172 ( .A(data_buf[3]), .B(n163), .Y(n162) );
  AOI21X1 U173 ( .A(bit_period[3]), .B(n164), .C(n165), .Y(n161) );
  OAI22X1 U174 ( .A(n160), .B(n166), .C(n167), .D(n168), .Y(n165) );
  OAI21X1 U175 ( .A(n169), .B(n159), .C(n170), .Y(prdata[2]) );
  NAND2X1 U176 ( .A(data_buf[2]), .B(n163), .Y(n170) );
  INVX1 U177 ( .A(n147), .Y(n163) );
  AOI21X1 U178 ( .A(bit_period[2]), .B(n164), .C(n171), .Y(n169) );
  OAI22X1 U179 ( .A(n160), .B(n172), .C(n167), .D(n173), .Y(n171) );
  INVX1 U180 ( .A(n158), .Y(n164) );
  OAI21X1 U181 ( .A(n147), .B(n174), .C(n175), .Y(prdata[1]) );
  OAI21X1 U182 ( .A(n176), .B(n177), .C(n144), .Y(n175) );
  OAI22X1 U183 ( .A(n158), .B(n178), .C(n160), .D(n179), .Y(n177) );
  OAI21X1 U184 ( .A(n167), .B(n180), .C(n181), .Y(n176) );
  NAND3X1 U185 ( .A(n182), .B(paddr[0]), .C(error_status[1]), .Y(n181) );
  INVX1 U186 ( .A(n183), .Y(n182) );
  INVX1 U187 ( .A(data_buf[1]), .Y(n174) );
  OAI21X1 U188 ( .A(n147), .B(n184), .C(n185), .Y(prdata[0]) );
  OAI21X1 U189 ( .A(n186), .B(n187), .C(n144), .Y(n185) );
  OAI22X1 U190 ( .A(n158), .B(n188), .C(n160), .D(n189), .Y(n187) );
  OAI22X1 U191 ( .A(n167), .B(n190), .C(n183), .D(n191), .Y(n186) );
  MUX2X1 U192 ( .B(error_status[0]), .A(\data_status[0] ), .S(n192), .Y(n191)
         );
  NAND3X1 U193 ( .A(n193), .B(n142), .C(n194), .Y(n183) );
  INVX1 U194 ( .A(paddr[2]), .Y(n193) );
  INVX1 U195 ( .A(data_buf[0]), .Y(n184) );
  NAND3X1 U196 ( .A(n144), .B(n142), .C(n195), .Y(n147) );
  INVX1 U197 ( .A(n146), .Y(n195) );
  NAND3X1 U198 ( .A(paddr[1]), .B(n192), .C(paddr[2]), .Y(n146) );
  NOR2X1 U199 ( .A(nerror_status[1]), .B(n196), .Y(nerror_status[0]) );
  INVX1 U200 ( .A(framing_error), .Y(n196) );
  MUX2X1 U201 ( .B(n197), .A(n190), .S(n198), .Y(n141) );
  INVX1 U202 ( .A(data_size[0]), .Y(n190) );
  MUX2X1 U203 ( .B(n199), .A(n180), .S(n198), .Y(n140) );
  INVX1 U204 ( .A(data_size[1]), .Y(n180) );
  MUX2X1 U205 ( .B(n200), .A(n173), .S(n198), .Y(n139) );
  INVX1 U206 ( .A(data_size[2]), .Y(n173) );
  MUX2X1 U207 ( .B(n201), .A(n168), .S(n198), .Y(n138) );
  NAND3X1 U208 ( .A(n144), .B(n167), .C(n202), .Y(n198) );
  NAND2X1 U209 ( .A(n202), .B(n142), .Y(n167) );
  INVX1 U210 ( .A(n203), .Y(n202) );
  NAND3X1 U211 ( .A(n192), .B(n194), .C(paddr[2]), .Y(n203) );
  INVX1 U212 ( .A(data_size[3]), .Y(n168) );
  MUX2X1 U213 ( .B(n197), .A(n189), .S(n204), .Y(n137) );
  INVX1 U214 ( .A(bit_period[8]), .Y(n189) );
  MUX2X1 U215 ( .B(n199), .A(n179), .S(n204), .Y(n136) );
  INVX1 U216 ( .A(bit_period[9]), .Y(n179) );
  MUX2X1 U217 ( .B(n200), .A(n172), .S(n204), .Y(n135) );
  INVX1 U218 ( .A(bit_period[10]), .Y(n172) );
  INVX1 U219 ( .A(pwdata[2]), .Y(n200) );
  MUX2X1 U220 ( .B(n201), .A(n166), .S(n204), .Y(n134) );
  INVX1 U221 ( .A(bit_period[11]), .Y(n166) );
  INVX1 U222 ( .A(pwdata[3]), .Y(n201) );
  INVX1 U223 ( .A(n205), .Y(n133) );
  MUX2X1 U224 ( .B(pwdata[4]), .A(bit_period[12]), .S(n204), .Y(n205) );
  INVX1 U225 ( .A(n206), .Y(n132) );
  MUX2X1 U226 ( .B(pwdata[5]), .A(bit_period[13]), .S(n204), .Y(n206) );
  INVX1 U227 ( .A(n207), .Y(n131) );
  MUX2X1 U228 ( .B(pwdata[6]), .A(bit_period_reg[14]), .S(n204), .Y(n207) );
  INVX1 U229 ( .A(n208), .Y(n130) );
  MUX2X1 U230 ( .B(pwdata[7]), .A(bit_period_reg[15]), .S(n204), .Y(n208) );
  NAND3X1 U231 ( .A(n144), .B(n160), .C(n209), .Y(n204) );
  NOR2X1 U232 ( .A(n210), .B(n192), .Y(n209) );
  NAND3X1 U233 ( .A(n211), .B(n142), .C(paddr[0]), .Y(n160) );
  INVX1 U234 ( .A(n212), .Y(n129) );
  MUX2X1 U235 ( .B(pwdata[4]), .A(bit_period[4]), .S(n213), .Y(n212) );
  INVX1 U236 ( .A(n214), .Y(n128) );
  MUX2X1 U237 ( .B(pwdata[5]), .A(bit_period[5]), .S(n213), .Y(n214) );
  INVX1 U238 ( .A(n215), .Y(n127) );
  MUX2X1 U239 ( .B(pwdata[6]), .A(bit_period[6]), .S(n213), .Y(n215) );
  INVX1 U240 ( .A(n216), .Y(n126) );
  MUX2X1 U241 ( .B(pwdata[7]), .A(bit_period[7]), .S(n213), .Y(n216) );
  MUX2X1 U242 ( .B(n197), .A(n188), .S(n213), .Y(n125) );
  INVX1 U243 ( .A(bit_period[0]), .Y(n188) );
  INVX1 U244 ( .A(pwdata[0]), .Y(n197) );
  MUX2X1 U245 ( .B(n199), .A(n178), .S(n213), .Y(n124) );
  INVX1 U246 ( .A(bit_period[1]), .Y(n178) );
  INVX1 U247 ( .A(pwdata[1]), .Y(n199) );
  INVX1 U248 ( .A(n217), .Y(n123) );
  MUX2X1 U249 ( .B(pwdata[2]), .A(bit_period[2]), .S(n213), .Y(n217) );
  INVX1 U250 ( .A(n218), .Y(n122) );
  MUX2X1 U251 ( .B(pwdata[3]), .A(bit_period[3]), .S(n213), .Y(n218) );
  NAND3X1 U252 ( .A(n158), .B(n192), .C(n219), .Y(n213) );
  NOR2X1 U253 ( .A(n159), .B(n210), .Y(n219) );
  INVX1 U254 ( .A(n211), .Y(n210) );
  NAND3X1 U255 ( .A(n192), .B(n142), .C(n211), .Y(n158) );
  NOR2X1 U256 ( .A(n194), .B(paddr[2]), .Y(n211) );
  INVX1 U257 ( .A(paddr[1]), .Y(n194) );
  INVX1 U258 ( .A(pwrite), .Y(n142) );
  INVX1 U259 ( .A(paddr[0]), .Y(n192) );
  MUX2X1 U260 ( .B(n220), .A(n221), .S(n159), .Y(n121) );
  INVX1 U261 ( .A(\reading[0] ), .Y(n221) );
  NAND2X1 U262 ( .A(data_ready), .B(n222), .Y(n220) );
  MUX2X1 U263 ( .B(n144), .A(n223), .S(n222), .Y(n119) );
  INVX1 U264 ( .A(data_read), .Y(n222) );
  NAND2X1 U265 ( .A(\reading[0] ), .B(n144), .Y(n223) );
  INVX1 U266 ( .A(n159), .Y(n144) );
  NAND2X1 U267 ( .A(psel), .B(penable), .Y(n159) );
endmodule

