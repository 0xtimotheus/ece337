/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Tue Jan 17 12:37:12 2023
/////////////////////////////////////////////////////////////


module sensor_s ( sensors, error );
  input [3:0] sensors;
  output error;
  wire   n1, n3;
  tri   [3:0] sensors;
  tri   error;
  tri   w3;

  OR2X1 O1 ( .A(n1), .B(1'b0), .Y(w3) );
  OR2x1 O2 ( .p1(sensors[0]), .p2(w3), .p3(error) );
  INVX1 U3 ( .A(n3), .Y(n1) );
  NAND3X1 U4 ( .A(sensors[2]), .B(sensors[1]), .C(sensors[3]), .Y(n3) );
endmodule

