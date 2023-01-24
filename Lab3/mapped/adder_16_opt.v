/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Tue Jan 24 12:14:16 2023
/////////////////////////////////////////////////////////////


module adder_16_DW01_add_1 ( A, B, CI, SUM, CO );
  input [16:0] A;
  input [16:0] B;
  output [16:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n9, n10, n11, n12, n13, n14, n15, n16,
         n18, n20, n21, n22, n24, n26, n27, n28, n29, n30, n32, n34, n35, n36,
         n37, n38, n40, n42, n43, n44, n45, n46, n47, n48, n51, n53, n55, n113,
         n114, n115, n116;

  FAX1 U2 ( .A(B[15]), .B(A[15]), .C(n9), .YC(SUM[16]), .YS(SUM[15]) );
  FAX1 U3 ( .A(B[14]), .B(A[14]), .C(n10), .YC(n9), .YS(SUM[14]) );
  FAX1 U4 ( .A(B[13]), .B(A[13]), .C(n11), .YC(n10), .YS(SUM[13]) );
  FAX1 U5 ( .A(B[12]), .B(A[12]), .C(n12), .YC(n11), .YS(SUM[12]) );
  FAX1 U6 ( .A(B[11]), .B(A[11]), .C(n13), .YC(n12), .YS(SUM[11]) );
  FAX1 U7 ( .A(B[10]), .B(A[10]), .C(n14), .YC(n13), .YS(SUM[10]) );
  FAX1 U8 ( .A(B[9]), .B(A[9]), .C(n15), .YC(n14), .YS(SUM[9]) );
  FAX1 U9 ( .A(B[8]), .B(A[8]), .C(n47), .YC(n15), .YS(SUM[8]) );
  XNOR2X1 U11 ( .A(n21), .B(n1), .Y(SUM[7]) );
  AOI21X1 U12 ( .A(n116), .B(n21), .C(n18), .Y(n16) );
  NAND2X1 U15 ( .A(n20), .B(n116), .Y(n1) );
  NAND2X1 U18 ( .A(B[7]), .B(A[7]), .Y(n20) );
  FAX1 U19 ( .A(B[6]), .B(A[6]), .C(n48), .YC(n21), .YS(SUM[6]) );
  XNOR2X1 U21 ( .A(n27), .B(n2), .Y(SUM[5]) );
  AOI21X1 U22 ( .A(n115), .B(n27), .C(n24), .Y(n22) );
  NAND2X1 U25 ( .A(n26), .B(n115), .Y(n2) );
  NAND2X1 U28 ( .A(B[5]), .B(A[5]), .Y(n26) );
  XOR2X1 U29 ( .A(n30), .B(n3), .Y(SUM[4]) );
  OAI21X1 U30 ( .A(n30), .B(n28), .C(n29), .Y(n27) );
  NAND2X1 U31 ( .A(n29), .B(n51), .Y(n3) );
  NOR2X1 U33 ( .A(B[4]), .B(A[4]), .Y(n28) );
  NAND2X1 U34 ( .A(B[4]), .B(A[4]), .Y(n29) );
  XNOR2X1 U35 ( .A(n35), .B(n4), .Y(SUM[3]) );
  AOI21X1 U36 ( .A(n114), .B(n35), .C(n32), .Y(n30) );
  NAND2X1 U39 ( .A(n34), .B(n114), .Y(n4) );
  NAND2X1 U42 ( .A(B[3]), .B(A[3]), .Y(n34) );
  XOR2X1 U43 ( .A(n38), .B(n5), .Y(SUM[2]) );
  OAI21X1 U44 ( .A(n38), .B(n36), .C(n37), .Y(n35) );
  NAND2X1 U45 ( .A(n37), .B(n53), .Y(n5) );
  NOR2X1 U47 ( .A(B[2]), .B(A[2]), .Y(n36) );
  NAND2X1 U48 ( .A(B[2]), .B(A[2]), .Y(n37) );
  XNOR2X1 U49 ( .A(n43), .B(n6), .Y(SUM[1]) );
  AOI21X1 U50 ( .A(n113), .B(n43), .C(n40), .Y(n38) );
  NAND2X1 U53 ( .A(n42), .B(n113), .Y(n6) );
  NAND2X1 U56 ( .A(B[1]), .B(A[1]), .Y(n42) );
  XNOR2X1 U57 ( .A(n7), .B(CI), .Y(SUM[0]) );
  OAI21X1 U58 ( .A(n44), .B(n46), .C(n45), .Y(n43) );
  NAND2X1 U59 ( .A(n45), .B(n55), .Y(n7) );
  NOR2X1 U61 ( .A(B[0]), .B(A[0]), .Y(n44) );
  NAND2X1 U62 ( .A(B[0]), .B(A[0]), .Y(n45) );
  OR2X2 U67 ( .A(B[1]), .B(A[1]), .Y(n113) );
  OR2X2 U68 ( .A(B[3]), .B(A[3]), .Y(n114) );
  OR2X2 U69 ( .A(B[5]), .B(A[5]), .Y(n115) );
  OR2X2 U70 ( .A(B[7]), .B(A[7]), .Y(n116) );
  INVX2 U71 ( .A(n44), .Y(n55) );
  INVX2 U72 ( .A(n36), .Y(n53) );
  INVX2 U73 ( .A(n28), .Y(n51) );
  INVX2 U74 ( .A(n22), .Y(n48) );
  INVX2 U75 ( .A(n16), .Y(n47) );
  INVX2 U76 ( .A(CI), .Y(n46) );
  INVX2 U77 ( .A(n42), .Y(n40) );
  INVX2 U78 ( .A(n34), .Y(n32) );
  INVX2 U79 ( .A(n26), .Y(n24) );
  INVX2 U80 ( .A(n20), .Y(n18) );
endmodule


module adder_16 ( a, b, carry_in, sum, overflow );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input carry_in;
  output overflow;


  adder_16_DW01_add_1 r304 ( .A({1'b0, a}), .B({1'b0, b}), .CI(carry_in), 
        .SUM({overflow, sum}) );
endmodule

