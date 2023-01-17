/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Tue Jan 17 18:54:09 2023
/////////////////////////////////////////////////////////////


module adder_1bit_3 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2;

  XOR2X1 U1 ( .A(carry_in), .B(n1), .Y(sum) );
  INVX1 U2 ( .A(n2), .Y(carry_out) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n1), .D(carry_in), .Y(n2) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n1) );
endmodule


module adder_1bit_0 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2;

  XOR2X1 U1 ( .A(carry_in), .B(n1), .Y(sum) );
  INVX1 U2 ( .A(n2), .Y(carry_out) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n1), .D(carry_in), .Y(n2) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n1) );
endmodule


module adder_1bit_1 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2;

  XOR2X1 U1 ( .A(carry_in), .B(n1), .Y(sum) );
  INVX1 U2 ( .A(n2), .Y(carry_out) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n1), .D(carry_in), .Y(n2) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n1) );
endmodule


module adder_1bit_2 ( a, b, carry_in, sum, carry_out );
  input a, b, carry_in;
  output sum, carry_out;
  wire   n1, n2;

  XOR2X1 U1 ( .A(carry_in), .B(n1), .Y(sum) );
  INVX1 U2 ( .A(n2), .Y(carry_out) );
  AOI22X1 U3 ( .A(b), .B(a), .C(n1), .D(carry_in), .Y(n2) );
  XOR2X1 U4 ( .A(a), .B(b), .Y(n1) );
endmodule


module adder_4bit ( a, b, carry_in, sum, carry_out );
  input [3:0] a;
  input [3:0] b;
  output [3:0] sum;
  input carry_in;
  output carry_out;

  wire   [2:0] carry;

  adder_1bit_3 a0 ( .a(a[0]), .b(b[0]), .carry_in(carry_in), .sum(sum[0]), 
        .carry_out(carry[0]) );
  adder_1bit_2 a1 ( .a(a[1]), .b(b[1]), .carry_in(carry[0]), .sum(sum[1]), 
        .carry_out(carry[1]) );
  adder_1bit_1 a2 ( .a(a[2]), .b(b[2]), .carry_in(carry[1]), .sum(sum[2]), 
        .carry_out(carry[2]) );
  adder_1bit_0 a3 ( .a(a[3]), .b(b[3]), .carry_in(carry[2]), .sum(sum[3]), 
        .carry_out(carry_out) );
endmodule

