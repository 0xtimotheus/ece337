/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Wed Feb  1 18:19:10 2023
/////////////////////////////////////////////////////////////


module flex_counter ( clk, n_rst, clear, count_enable, rollover_val, count_out, 
        rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61;

  DFFSR \count_out_reg[0]  ( .D(n37), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(n36), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(n35), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR rollover_flag_reg ( .D(n33), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  DFFSR \count_out_reg[3]  ( .D(n34), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  OAI22X1 U37 ( .A(n38), .B(n39), .C(n40), .D(n41), .Y(n37) );
  OAI22X1 U38 ( .A(n39), .B(n42), .C(n41), .D(n43), .Y(n36) );
  OAI22X1 U39 ( .A(n39), .B(n44), .C(n45), .D(n41), .Y(n35) );
  OAI22X1 U40 ( .A(n39), .B(n46), .C(n47), .D(n41), .Y(n34) );
  INVX1 U41 ( .A(n48), .Y(n41) );
  INVX1 U42 ( .A(count_out[3]), .Y(n46) );
  OAI22X1 U43 ( .A(n39), .B(n49), .C(n50), .D(n51), .Y(n33) );
  NAND2X1 U44 ( .A(n52), .B(n53), .Y(n51) );
  XOR2X1 U45 ( .A(n47), .B(rollover_val[3]), .Y(n53) );
  XOR2X1 U46 ( .A(n54), .B(n55), .Y(n47) );
  NOR2X1 U47 ( .A(n44), .B(n56), .Y(n55) );
  NAND2X1 U48 ( .A(count_out[3]), .B(n49), .Y(n54) );
  XOR2X1 U49 ( .A(n45), .B(rollover_val[2]), .Y(n52) );
  XOR2X1 U50 ( .A(n56), .B(n57), .Y(n45) );
  NOR2X1 U51 ( .A(rollover_flag), .B(n44), .Y(n57) );
  INVX1 U52 ( .A(count_out[2]), .Y(n44) );
  NAND3X1 U53 ( .A(n48), .B(n58), .C(n59), .Y(n50) );
  XOR2X1 U54 ( .A(n43), .B(rollover_val[1]), .Y(n59) );
  OAI21X1 U55 ( .A(n40), .B(n60), .C(n56), .Y(n43) );
  NAND2X1 U56 ( .A(n40), .B(n60), .Y(n56) );
  NOR2X1 U57 ( .A(n42), .B(rollover_flag), .Y(n60) );
  INVX1 U58 ( .A(count_out[1]), .Y(n42) );
  XOR2X1 U59 ( .A(rollover_val[0]), .B(n40), .Y(n58) );
  NOR2X1 U60 ( .A(n38), .B(rollover_flag), .Y(n40) );
  INVX1 U61 ( .A(count_out[0]), .Y(n38) );
  NOR2X1 U62 ( .A(n61), .B(clear), .Y(n48) );
  INVX1 U63 ( .A(rollover_flag), .Y(n49) );
  INVX1 U64 ( .A(n61), .Y(n39) );
  NOR2X1 U65 ( .A(count_enable), .B(clear), .Y(n61) );
endmodule

