/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Sat Feb  4 18:34:35 2023
/////////////////////////////////////////////////////////////


module flex_pts_sr_NUM_BITS8 ( clk, n_rst, load_enable, shift_enable, 
        parallel_in, serial_out );
  input [7:0] parallel_in;
  input clk, n_rst, load_enable, shift_enable;
  output serial_out;
  wire   n28, n29, n30, n31, n32, n33, n34, n35, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27;
  wire   [6:0] state;

  DFFSR \state_reg[0]  ( .D(n35), .CLK(clk), .R(1'b1), .S(n_rst), .Q(state[0])
         );
  DFFSR \state_reg[1]  ( .D(n34), .CLK(clk), .R(1'b1), .S(n_rst), .Q(state[1])
         );
  DFFSR \state_reg[2]  ( .D(n33), .CLK(clk), .R(1'b1), .S(n_rst), .Q(state[2])
         );
  DFFSR \state_reg[3]  ( .D(n32), .CLK(clk), .R(1'b1), .S(n_rst), .Q(state[3])
         );
  DFFSR \state_reg[4]  ( .D(n31), .CLK(clk), .R(1'b1), .S(n_rst), .Q(state[4])
         );
  DFFSR \state_reg[5]  ( .D(n30), .CLK(clk), .R(1'b1), .S(n_rst), .Q(state[5])
         );
  DFFSR \state_reg[6]  ( .D(n29), .CLK(clk), .R(1'b1), .S(n_rst), .Q(state[6])
         );
  DFFSR \state_reg[7]  ( .D(n28), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        serial_out) );
  NAND2X1 U11 ( .A(n9), .B(n10), .Y(n35) );
  INVX1 U12 ( .A(n11), .Y(n10) );
  MUX2X1 U13 ( .B(parallel_in[0]), .A(state[0]), .S(n12), .Y(n9) );
  OAI21X1 U14 ( .A(n13), .B(n14), .C(n15), .Y(n34) );
  AOI22X1 U15 ( .A(n11), .B(state[0]), .C(state[1]), .D(n12), .Y(n15) );
  INVX1 U16 ( .A(parallel_in[1]), .Y(n14) );
  OAI21X1 U17 ( .A(n13), .B(n16), .C(n17), .Y(n33) );
  AOI22X1 U18 ( .A(state[1]), .B(n11), .C(state[2]), .D(n12), .Y(n17) );
  INVX1 U19 ( .A(parallel_in[2]), .Y(n16) );
  OAI21X1 U20 ( .A(n13), .B(n18), .C(n19), .Y(n32) );
  AOI22X1 U21 ( .A(state[2]), .B(n11), .C(state[3]), .D(n12), .Y(n19) );
  INVX1 U22 ( .A(parallel_in[3]), .Y(n18) );
  OAI21X1 U23 ( .A(n13), .B(n20), .C(n21), .Y(n31) );
  AOI22X1 U24 ( .A(state[3]), .B(n11), .C(state[4]), .D(n12), .Y(n21) );
  INVX1 U25 ( .A(parallel_in[4]), .Y(n20) );
  OAI21X1 U26 ( .A(n13), .B(n22), .C(n23), .Y(n30) );
  AOI22X1 U27 ( .A(state[4]), .B(n11), .C(state[5]), .D(n12), .Y(n23) );
  INVX1 U28 ( .A(parallel_in[5]), .Y(n22) );
  OAI21X1 U29 ( .A(n13), .B(n24), .C(n25), .Y(n29) );
  AOI22X1 U30 ( .A(state[5]), .B(n11), .C(state[6]), .D(n12), .Y(n25) );
  INVX1 U31 ( .A(parallel_in[6]), .Y(n24) );
  OAI21X1 U32 ( .A(n13), .B(n26), .C(n27), .Y(n28) );
  AOI22X1 U33 ( .A(state[6]), .B(n11), .C(serial_out), .D(n12), .Y(n27) );
  NOR2X1 U34 ( .A(n12), .B(load_enable), .Y(n11) );
  NOR2X1 U35 ( .A(shift_enable), .B(load_enable), .Y(n12) );
  INVX1 U36 ( .A(parallel_in[7]), .Y(n26) );
  INVX1 U37 ( .A(load_enable), .Y(n13) );
endmodule


module pts_sr_8_msb ( clk, n_rst, shift_enable, load_enable, parallel_in, 
        serial_out );
  input [7:0] parallel_in;
  input clk, n_rst, shift_enable, load_enable;
  output serial_out;


  flex_pts_sr_NUM_BITS8 CORE ( .clk(clk), .n_rst(n_rst), .load_enable(
        load_enable), .shift_enable(shift_enable), .parallel_in(parallel_in), 
        .serial_out(serial_out) );
endmodule

