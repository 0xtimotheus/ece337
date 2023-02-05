/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Sun Feb  5 14:34:18 2023
/////////////////////////////////////////////////////////////


module moore ( clk, n_rst, i, o );
  input clk, n_rst, i;
  output o;
  wire   n13, n14, n15, n16, n17, n18, n19, n20;
  wire   [2:0] state;
  wire   [2:0] nstate;

  DFFSR \state_reg[0]  ( .D(nstate[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[0]) );
  DFFSR o_reg ( .D(nstate[2]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(o) );
  DFFSR \state_reg[2]  ( .D(nstate[2]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[2]) );
  DFFSR \state_reg[1]  ( .D(nstate[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[1]) );
  NOR2X1 U18 ( .A(n13), .B(n14), .Y(nstate[2]) );
  NAND2X1 U19 ( .A(state[1]), .B(state[0]), .Y(n14) );
  OR2X1 U20 ( .A(n15), .B(state[2]), .Y(n13) );
  AOI21X1 U21 ( .A(state[2]), .B(state[0]), .C(n16), .Y(nstate[1]) );
  MUX2X1 U22 ( .B(n17), .A(n18), .S(state[1]), .Y(n16) );
  NOR2X1 U23 ( .A(n18), .B(n15), .Y(n17) );
  NOR2X1 U24 ( .A(n19), .B(n20), .Y(nstate[0]) );
  INVX1 U25 ( .A(n18), .Y(n20) );
  NOR2X1 U26 ( .A(state[0]), .B(state[2]), .Y(n18) );
  XOR2X1 U27 ( .A(n15), .B(state[1]), .Y(n19) );
  INVX1 U28 ( .A(i), .Y(n15) );
endmodule

