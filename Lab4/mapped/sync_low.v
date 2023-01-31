/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Tue Jan 31 12:24:40 2023
/////////////////////////////////////////////////////////////


module sync_low ( clk, n_rst, async_in, sync_out );
  input clk, n_rst, async_in;
  output sync_out;
  wire   q0;

  DFFSR q0_reg ( .D(async_in), .CLK(clk), .R(n_rst), .S(1'b1), .Q(q0) );
  DFFSR q1_reg ( .D(q0), .CLK(clk), .R(n_rst), .S(1'b1), .Q(sync_out) );
endmodule

