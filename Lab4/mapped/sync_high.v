/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Tue Jan 31 12:16:20 2023
/////////////////////////////////////////////////////////////


module sync_high ( clk, n_rst, async_in, sync_out );
  input clk, n_rst, async_in;
  output sync_out;
  wire   q0;

  DFFSR q0_reg ( .D(async_in), .CLK(clk), .R(1'b1), .S(n_rst), .Q(q0) );
  DFFSR q1_reg ( .D(q0), .CLK(clk), .R(1'b1), .S(n_rst), .Q(sync_out) );
endmodule

