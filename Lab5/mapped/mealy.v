/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Sun Feb  5 14:59:02 2023
/////////////////////////////////////////////////////////////


module mealy ( clk, n_rst, i, o );
  input clk, n_rst, i;
  output o;
  wire   n5, n9, n10, n11;
  wire   [1:0] state;
  wire   [1:0] nstate;

  DFFSR \state_reg[0]  ( .D(nstate[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[0]) );
  DFFSR \state_reg[1]  ( .D(nstate[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[1]) );
  DFFSR out_reg ( .D(n5), .CLK(clk), .R(n_rst), .S(1'b1), .Q(o) );
  MUX2X1 U13 ( .B(n9), .A(state[0]), .S(state[1]), .Y(nstate[1]) );
  NAND2X1 U14 ( .A(state[0]), .B(i), .Y(n9) );
  OAI21X1 U15 ( .A(state[0]), .B(n10), .C(n11), .Y(nstate[0]) );
  XNOR2X1 U16 ( .A(i), .B(state[1]), .Y(n10) );
  INVX1 U17 ( .A(n11), .Y(n5) );
  NAND3X1 U18 ( .A(i), .B(state[1]), .C(state[0]), .Y(n11) );
endmodule

