/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Sun Feb 19 17:41:20 2023
/////////////////////////////////////////////////////////////


module sync_low_1 ( clk, n_rst, async_in, sync_out );
  input clk, n_rst, async_in;
  output sync_out;
  wire   q0;

  DFFSR q0_reg ( .D(async_in), .CLK(clk), .R(n_rst), .S(1'b1), .Q(q0) );
  DFFSR q1_reg ( .D(q0), .CLK(clk), .R(n_rst), .S(1'b1), .Q(sync_out) );
endmodule


module sync_low_0 ( clk, n_rst, async_in, sync_out );
  input clk, n_rst, async_in;
  output sync_out;
  wire   q0;

  DFFSR q0_reg ( .D(async_in), .CLK(clk), .R(n_rst), .S(1'b1), .Q(q0) );
  DFFSR q1_reg ( .D(q0), .CLK(clk), .R(n_rst), .S(1'b1), .Q(sync_out) );
endmodule


module controller ( clk, n_rst, dr, lc, overflow, cnt_up, clear, modwait, op, 
        src1, src2, dest, err );
  output [2:0] op;
  output [3:0] src1;
  output [3:0] src2;
  output [3:0] dest;
  input clk, n_rst, dr, lc, overflow;
  output cnt_up, clear, modwait, err;
  wire   n23, n24, n27, n44, n45, n48, n49, n52, n56, n57, n58, n59, n60, n61,
         n65, n70, n81, n89, n90, n92, n94, n95, n96, n98, n99, n100, n101,
         n102, n103, n104, n105, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n20,
         n21, n22, n25, n26, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37,
         n38, n39, n40, n41, n42, n43, n46, n47, n50, n51, n53, n54, n55, n62,
         n63, n64, n66, n67, n68, n69, n71, n72, n73, n74, n75, n76, n77, n78,
         n79, n80, n82, n83, n84, n87;
  wire   [3:0] s;
  wire   [1:0] i;
  wire   [1:0] d;
  wire   [1:0] j;
  assign clear = 1'b0;

  DFFSR \d_reg[0]  ( .D(n27), .CLK(clk), .R(n_rst), .S(1'b1), .Q(d[0]) );
  DFFSR \d_reg[1]  ( .D(n105), .CLK(clk), .R(n_rst), .S(1'b1), .Q(d[1]) );
  DFFSR \s_reg[1]  ( .D(n103), .CLK(clk), .R(n_rst), .S(1'b1), .Q(s[1]) );
  DFFSR \s_reg[2]  ( .D(n104), .CLK(clk), .R(n_rst), .S(1'b1), .Q(s[2]) );
  DFFSR \j_reg[0]  ( .D(n101), .CLK(clk), .R(n_rst), .S(1'b1), .Q(j[0]) );
  DFFSR \j_reg[1]  ( .D(n100), .CLK(clk), .R(n_rst), .S(1'b1), .Q(j[1]) );
  DFFSR \s_reg[0]  ( .D(n102), .CLK(clk), .R(n_rst), .S(1'b1), .Q(s[0]) );
  DFFSR \i_reg[0]  ( .D(n99), .CLK(clk), .R(n_rst), .S(1'b1), .Q(i[0]) );
  DFFSR \i_reg[1]  ( .D(n98), .CLK(clk), .R(n_rst), .S(1'b1), .Q(i[1]) );
  INVX2 U20 ( .A(n58), .Y(cnt_up) );
  INVX2 U21 ( .A(n59), .Y(n23) );
  INVX2 U22 ( .A(n44), .Y(n24) );
  OAI21X1 U46 ( .A(overflow), .B(n48), .C(n49), .Y(src1[2]) );
  OAI22X1 U48 ( .A(overflow), .B(n48), .C(n52), .D(n80), .Y(src1[1]) );
  OAI21X1 U55 ( .A(overflow), .B(n56), .C(n44), .Y(src1[3]) );
  AOI21X1 U58 ( .A(n60), .B(n61), .C(overflow), .Y(op[0]) );
  XOR2X1 U63 ( .A(j[1]), .B(n65), .Y(n100) );
  NOR2X1 U64 ( .A(n59), .B(n87), .Y(n65) );
  XOR2X1 U65 ( .A(n87), .B(n59), .Y(n101) );
  OAI21X1 U91 ( .A(n59), .B(n89), .C(n57), .Y(dest[3]) );
  NAND2X1 U92 ( .A(n82), .B(n81), .Y(n57) );
  NAND2X1 U94 ( .A(j[1]), .B(j[0]), .Y(n89) );
  OAI21X1 U95 ( .A(j[1]), .B(n59), .C(n90), .Y(dest[2]) );
  AOI21X1 U98 ( .A(n23), .B(n95), .C(n25), .Y(n94) );
  NOR2X1 U99 ( .A(overflow), .B(n70), .Y(n45) );
  XOR2X1 U101 ( .A(j[1]), .B(j[0]), .Y(n95) );
  NOR2X1 U104 ( .A(n92), .B(n24), .Y(n96) );
  NAND2X1 U105 ( .A(n79), .B(n82), .Y(n44) );
  NOR2X1 U107 ( .A(n59), .B(j[0]), .Y(n92) );
  NAND2X1 U108 ( .A(n83), .B(n82), .Y(n59) );
  NAND2X1 U110 ( .A(n84), .B(n82), .Y(n58) );
  INVX2 U12 ( .A(i[1]), .Y(n3) );
  BUFX2 U13 ( .A(s[0]), .Y(n26) );
  BUFX2 U14 ( .A(d[0]), .Y(n22) );
  INVX4 U15 ( .A(n25), .Y(n80) );
  BUFX2 U16 ( .A(d[1]), .Y(n1) );
  INVX2 U17 ( .A(n9), .Y(n10) );
  AND2X2 U18 ( .A(n37), .B(n36), .Y(n2) );
  OR2X1 U19 ( .A(overflow), .B(n10), .Y(n20) );
  INVX4 U23 ( .A(overflow), .Y(n82) );
  XNOR2X1 U24 ( .A(n63), .B(n3), .Y(n98) );
  INVX2 U25 ( .A(n3), .Y(n4) );
  AND2X2 U26 ( .A(n25), .B(n67), .Y(src2[2]) );
  INVX1 U27 ( .A(n38), .Y(n5) );
  INVX2 U28 ( .A(s[1]), .Y(n38) );
  BUFX2 U29 ( .A(s[2]), .Y(n6) );
  INVX1 U30 ( .A(s[0]), .Y(n7) );
  INVX1 U31 ( .A(src1[3]), .Y(n68) );
  INVX1 U32 ( .A(n26), .Y(n8) );
  INVX2 U33 ( .A(i[0]), .Y(n9) );
  INVX1 U34 ( .A(n1), .Y(n74) );
  INVX1 U35 ( .A(n4), .Y(n69) );
  NOR2X1 U36 ( .A(n56), .B(n20), .Y(n63) );
  INVX1 U37 ( .A(n57), .Y(op[2]) );
  INVX2 U38 ( .A(n42), .Y(n79) );
  XNOR2X1 U39 ( .A(n73), .B(n10), .Y(n21) );
  XNOR2X1 U40 ( .A(n10), .B(n62), .Y(n99) );
  INVX1 U41 ( .A(n6), .Y(n50) );
  BUFX4 U42 ( .A(n45), .Y(n25) );
  BUFX2 U43 ( .A(n42), .Y(n28) );
  BUFX2 U44 ( .A(n38), .Y(n29) );
  NAND3X1 U45 ( .A(n8), .B(n29), .C(n50), .Y(modwait) );
  NAND3X1 U47 ( .A(n5), .B(n6), .C(n8), .Y(n56) );
  NAND3X1 U49 ( .A(n38), .B(s[2]), .C(n26), .Y(n42) );
  NAND2X1 U50 ( .A(n79), .B(n82), .Y(n32) );
  NAND3X1 U51 ( .A(n5), .B(n26), .C(n50), .Y(n37) );
  INVX2 U52 ( .A(n37), .Y(n84) );
  NAND2X1 U53 ( .A(n56), .B(n28), .Y(n30) );
  OAI21X1 U54 ( .A(n84), .B(n30), .C(n82), .Y(n31) );
  INVX2 U56 ( .A(n31), .Y(n34) );
  MUX2X1 U57 ( .B(n32), .A(n34), .S(n22), .Y(n27) );
  NOR2X1 U59 ( .A(n1), .B(overflow), .Y(n33) );
  MUX2X1 U60 ( .B(n1), .A(n33), .S(n22), .Y(n35) );
  OAI22X1 U61 ( .A(n35), .B(n28), .C(n34), .D(n74), .Y(n105) );
  NAND3X1 U62 ( .A(n5), .B(n8), .C(n50), .Y(n61) );
  NAND3X1 U66 ( .A(n38), .B(n7), .C(s[2]), .Y(n70) );
  NAND2X1 U67 ( .A(n70), .B(n28), .Y(n81) );
  INVX2 U68 ( .A(n81), .Y(n36) );
  INVX2 U69 ( .A(n61), .Y(n83) );
  NAND3X1 U70 ( .A(n26), .B(n29), .C(n50), .Y(n39) );
  INVX2 U71 ( .A(n39), .Y(err) );
  NOR2X1 U72 ( .A(n83), .B(err), .Y(n40) );
  NAND3X1 U73 ( .A(n2), .B(n56), .C(n40), .Y(n47) );
  INVX2 U74 ( .A(n47), .Y(n54) );
  NAND2X1 U75 ( .A(n1), .B(n22), .Y(n67) );
  INVX2 U76 ( .A(modwait), .Y(n53) );
  OAI21X1 U77 ( .A(lc), .B(dr), .C(n53), .Y(n41) );
  OAI21X1 U78 ( .A(n28), .B(n67), .C(n41), .Y(n43) );
  AOI21X1 U79 ( .A(n54), .B(n5), .C(n43), .Y(n46) );
  NOR2X1 U80 ( .A(overflow), .B(n46), .Y(n103) );
  OAI21X1 U81 ( .A(n50), .B(n47), .C(n2), .Y(n51) );
  AND2X2 U82 ( .A(n51), .B(n82), .Y(n104) );
  AOI22X1 U83 ( .A(n54), .B(n26), .C(dr), .D(n53), .Y(n55) );
  NAND3X1 U84 ( .A(n70), .B(n82), .C(n55), .Y(n102) );
  INVX2 U85 ( .A(n56), .Y(n72) );
  NAND2X1 U86 ( .A(n72), .B(n82), .Y(n62) );
  OAI21X1 U87 ( .A(n58), .B(n10), .C(n96), .Y(dest[0]) );
  XOR2X1 U88 ( .A(n9), .B(n4), .Y(n64) );
  OAI21X1 U89 ( .A(n58), .B(n64), .C(n94), .Y(dest[1]) );
  NOR2X1 U90 ( .A(n22), .B(n80), .Y(src2[0]) );
  OAI21X1 U93 ( .A(n1), .B(n22), .C(n67), .Y(n66) );
  OAI21X1 U96 ( .A(n80), .B(n66), .C(n44), .Y(src2[1]) );
  OAI21X1 U97 ( .A(n80), .B(n67), .C(n44), .Y(src2[3]) );
  INVX2 U100 ( .A(n22), .Y(n73) );
  OAI21X1 U102 ( .A(n80), .B(n21), .C(n68), .Y(src1[0]) );
  NAND3X1 U103 ( .A(n59), .B(n58), .C(n80), .Y(op[1]) );
  NOR2X1 U106 ( .A(n9), .B(n69), .Y(n71) );
  AOI21X1 U109 ( .A(cnt_up), .B(n71), .C(n92), .Y(n90) );
  AOI21X1 U111 ( .A(n79), .B(n22), .C(n72), .Y(n60) );
  NAND3X1 U112 ( .A(n79), .B(n74), .C(n73), .Y(n48) );
  NAND2X1 U113 ( .A(n10), .B(n22), .Y(n76) );
  XOR2X1 U114 ( .A(n4), .B(n1), .Y(n75) );
  XOR2X1 U115 ( .A(n76), .B(n75), .Y(n77) );
  XOR2X1 U116 ( .A(n77), .B(n21), .Y(n52) );
  INVX2 U117 ( .A(n77), .Y(n78) );
  NAND3X1 U118 ( .A(n21), .B(n25), .C(n78), .Y(n49) );
  INVX2 U119 ( .A(j[0]), .Y(n87) );
endmodule


module datapath_decode ( op, w_en, w_data_sel, alu_op );
  input [2:0] op;
  output [1:0] w_data_sel;
  output [1:0] alu_op;
  output w_en;
  wire   n1, n2, n3, n4, n5;

  INVX2 U3 ( .A(op[2]), .Y(n1) );
  INVX2 U4 ( .A(op[1]), .Y(n2) );
  INVX2 U5 ( .A(op[0]), .Y(n3) );
  NAND3X1 U6 ( .A(n2), .B(n1), .C(n3), .Y(w_en) );
  NOR2X1 U7 ( .A(n3), .B(w_data_sel[1]), .Y(w_data_sel[0]) );
  NAND2X1 U8 ( .A(op[1]), .B(n1), .Y(w_data_sel[1]) );
  OAI21X1 U9 ( .A(n1), .B(n4), .C(n5), .Y(alu_op[1]) );
  NAND3X1 U10 ( .A(op[0]), .B(n2), .C(op[2]), .Y(n5) );
  NAND2X1 U11 ( .A(op[1]), .B(n3), .Y(n4) );
  NOR2X1 U12 ( .A(op[0]), .B(n1), .Y(alu_op[0]) );
endmodule


module alu_DW01_sub_1 ( A, B, CI, DIFF, CO );
  input [17:0] A;
  input [17:0] B;
  output [17:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n22, n24, n25, n26, n27, n28, n30, n32, n33, n34,
         n35, n36, n38, n40, n41, n42, n43, n44, n46, n48, n49, n50, n51, n52,
         n54, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n70, n71, n72, n73, n75, n77, n79, n81, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n162, n163, n164, n165, n166, n167, n168, n169,
         n170, n171, n172, n173, n174, n175, n176, n177, n178, n179, n180,
         n181;

  FAX1 U3 ( .A(n87), .B(A[15]), .C(n17), .YC(n16), .YS(DIFF[15]) );
  XOR2X1 U4 ( .A(n171), .B(n1), .Y(DIFF[14]) );
  OAI21X1 U5 ( .A(n20), .B(n18), .C(n19), .Y(n17) );
  NAND2X1 U6 ( .A(n19), .B(n73), .Y(n1) );
  NOR2X1 U8 ( .A(n88), .B(A[14]), .Y(n18) );
  NAND2X1 U9 ( .A(n88), .B(A[14]), .Y(n19) );
  XNOR2X1 U10 ( .A(n163), .B(n2), .Y(DIFF[13]) );
  AOI21X1 U11 ( .A(n25), .B(n177), .C(n22), .Y(n20) );
  NAND2X1 U14 ( .A(n24), .B(n177), .Y(n2) );
  NAND2X1 U17 ( .A(n89), .B(A[13]), .Y(n24) );
  XOR2X1 U18 ( .A(n166), .B(n3), .Y(DIFF[12]) );
  OAI21X1 U19 ( .A(n28), .B(n26), .C(n27), .Y(n25) );
  NAND2X1 U20 ( .A(n27), .B(n75), .Y(n3) );
  NOR2X1 U22 ( .A(n90), .B(A[12]), .Y(n26) );
  NAND2X1 U23 ( .A(n90), .B(A[12]), .Y(n27) );
  XNOR2X1 U24 ( .A(n33), .B(n4), .Y(DIFF[11]) );
  AOI21X1 U25 ( .A(n176), .B(n33), .C(n30), .Y(n28) );
  NAND2X1 U28 ( .A(n32), .B(n176), .Y(n4) );
  NAND2X1 U31 ( .A(n91), .B(A[11]), .Y(n32) );
  XOR2X1 U32 ( .A(n165), .B(n5), .Y(DIFF[10]) );
  OAI21X1 U33 ( .A(n36), .B(n34), .C(n35), .Y(n33) );
  NAND2X1 U34 ( .A(n35), .B(n77), .Y(n5) );
  NOR2X1 U36 ( .A(n92), .B(A[10]), .Y(n34) );
  NAND2X1 U37 ( .A(n92), .B(A[10]), .Y(n35) );
  XNOR2X1 U38 ( .A(n178), .B(n6), .Y(DIFF[9]) );
  AOI21X1 U39 ( .A(n41), .B(n174), .C(n38), .Y(n36) );
  NAND2X1 U42 ( .A(n40), .B(n174), .Y(n6) );
  NAND2X1 U45 ( .A(n93), .B(A[9]), .Y(n40) );
  XOR2X1 U46 ( .A(n44), .B(n7), .Y(DIFF[8]) );
  OAI21X1 U47 ( .A(n44), .B(n42), .C(n43), .Y(n41) );
  NAND2X1 U48 ( .A(n43), .B(n79), .Y(n7) );
  NOR2X1 U50 ( .A(n94), .B(A[8]), .Y(n42) );
  NAND2X1 U51 ( .A(n94), .B(A[8]), .Y(n43) );
  XNOR2X1 U52 ( .A(n49), .B(n8), .Y(DIFF[7]) );
  AOI21X1 U53 ( .A(n173), .B(n49), .C(n46), .Y(n44) );
  NAND2X1 U56 ( .A(n48), .B(n173), .Y(n8) );
  NAND2X1 U59 ( .A(n95), .B(A[7]), .Y(n48) );
  XOR2X1 U60 ( .A(n52), .B(n9), .Y(DIFF[6]) );
  OAI21X1 U61 ( .A(n52), .B(n50), .C(n51), .Y(n49) );
  NAND2X1 U62 ( .A(n51), .B(n81), .Y(n9) );
  NOR2X1 U64 ( .A(n96), .B(A[6]), .Y(n50) );
  NAND2X1 U65 ( .A(n96), .B(A[6]), .Y(n51) );
  XNOR2X1 U66 ( .A(n57), .B(n10), .Y(DIFF[5]) );
  AOI21X1 U67 ( .A(n175), .B(n57), .C(n54), .Y(n52) );
  NAND2X1 U70 ( .A(n56), .B(n175), .Y(n10) );
  NAND2X1 U73 ( .A(n97), .B(A[5]), .Y(n56) );
  XOR2X1 U74 ( .A(n60), .B(n11), .Y(DIFF[4]) );
  OAI21X1 U75 ( .A(n60), .B(n58), .C(n59), .Y(n57) );
  NAND2X1 U76 ( .A(n59), .B(n83), .Y(n11) );
  NOR2X1 U78 ( .A(n98), .B(A[4]), .Y(n58) );
  NAND2X1 U79 ( .A(n98), .B(A[4]), .Y(n59) );
  XNOR2X1 U80 ( .A(n65), .B(n12), .Y(DIFF[3]) );
  AOI21X1 U81 ( .A(n69), .B(n61), .C(n62), .Y(n60) );
  NOR2X1 U82 ( .A(n172), .B(n66), .Y(n61) );
  OAI21X1 U83 ( .A(n63), .B(n67), .C(n64), .Y(n62) );
  NAND2X1 U84 ( .A(n64), .B(n84), .Y(n12) );
  NOR2X1 U86 ( .A(n99), .B(A[3]), .Y(n63) );
  NAND2X1 U87 ( .A(n99), .B(A[3]), .Y(n64) );
  XOR2X1 U88 ( .A(n68), .B(n13), .Y(DIFF[2]) );
  OAI21X1 U89 ( .A(n68), .B(n66), .C(n67), .Y(n65) );
  NAND2X1 U90 ( .A(n67), .B(n85), .Y(n13) );
  NOR2X1 U92 ( .A(n100), .B(A[2]), .Y(n66) );
  NAND2X1 U93 ( .A(n100), .B(A[2]), .Y(n67) );
  XOR2X1 U94 ( .A(n14), .B(n72), .Y(DIFF[1]) );
  OAI21X1 U96 ( .A(n70), .B(n72), .C(n71), .Y(n69) );
  NAND2X1 U97 ( .A(n71), .B(n86), .Y(n14) );
  NOR2X1 U99 ( .A(n101), .B(A[1]), .Y(n70) );
  NAND2X1 U100 ( .A(n101), .B(A[1]), .Y(n71) );
  XNOR2X1 U101 ( .A(n168), .B(n102), .Y(DIFF[0]) );
  NOR2X1 U102 ( .A(n102), .B(A[0]), .Y(n72) );
  INVX1 U123 ( .A(B[10]), .Y(n92) );
  INVX1 U124 ( .A(B[2]), .Y(n100) );
  INVX1 U125 ( .A(n25), .Y(n162) );
  INVX2 U126 ( .A(n162), .Y(n163) );
  INVX1 U127 ( .A(n36), .Y(n164) );
  INVX2 U128 ( .A(n164), .Y(n165) );
  BUFX2 U129 ( .A(n28), .Y(n166) );
  INVX1 U130 ( .A(A[0]), .Y(n167) );
  INVX2 U131 ( .A(n167), .Y(n168) );
  XOR2X1 U132 ( .A(n16), .B(n169), .Y(DIFF[16]) );
  XOR2X1 U133 ( .A(n103), .B(B[16]), .Y(n169) );
  INVX1 U134 ( .A(n20), .Y(n170) );
  INVX2 U135 ( .A(n170), .Y(n171) );
  NOR2X1 U136 ( .A(n99), .B(A[3]), .Y(n172) );
  INVX1 U137 ( .A(n69), .Y(n68) );
  INVX1 U138 ( .A(B[15]), .Y(n87) );
  INVX1 U139 ( .A(B[4]), .Y(n98) );
  INVX1 U140 ( .A(B[6]), .Y(n96) );
  INVX2 U141 ( .A(B[0]), .Y(n102) );
  INVX1 U142 ( .A(B[8]), .Y(n94) );
  INVX1 U143 ( .A(B[12]), .Y(n90) );
  OR2X1 U144 ( .A(n95), .B(A[7]), .Y(n173) );
  OR2X1 U145 ( .A(n93), .B(A[9]), .Y(n174) );
  OR2X1 U146 ( .A(n97), .B(A[5]), .Y(n175) );
  OR2X1 U147 ( .A(n91), .B(A[11]), .Y(n176) );
  OR2X1 U148 ( .A(n89), .B(A[13]), .Y(n177) );
  INVX1 U149 ( .A(B[14]), .Y(n88) );
  BUFX2 U150 ( .A(n41), .Y(n178) );
  NAND2X1 U151 ( .A(n16), .B(n103), .Y(n179) );
  NAND2X1 U152 ( .A(n16), .B(B[16]), .Y(n180) );
  NAND2X1 U153 ( .A(n103), .B(B[16]), .Y(n181) );
  NAND3X1 U154 ( .A(n181), .B(n179), .C(n180), .Y(n15) );
  INVX1 U155 ( .A(n172), .Y(n84) );
  INVX1 U156 ( .A(B[9]), .Y(n93) );
  INVX1 U157 ( .A(B[11]), .Y(n91) );
  INVX1 U158 ( .A(B[13]), .Y(n89) );
  INVX1 U159 ( .A(B[5]), .Y(n97) );
  INVX1 U160 ( .A(B[1]), .Y(n101) );
  INVX1 U161 ( .A(B[7]), .Y(n95) );
  INVX1 U162 ( .A(B[3]), .Y(n99) );
  INVX2 U163 ( .A(n70), .Y(n86) );
  INVX2 U164 ( .A(n66), .Y(n85) );
  INVX2 U165 ( .A(n58), .Y(n83) );
  INVX2 U166 ( .A(n50), .Y(n81) );
  INVX2 U167 ( .A(n42), .Y(n79) );
  INVX2 U168 ( .A(n34), .Y(n77) );
  INVX2 U169 ( .A(n26), .Y(n75) );
  INVX2 U170 ( .A(n18), .Y(n73) );
  INVX2 U171 ( .A(n56), .Y(n54) );
  INVX2 U172 ( .A(n48), .Y(n46) );
  INVX2 U173 ( .A(n40), .Y(n38) );
  INVX2 U174 ( .A(n32), .Y(n30) );
  INVX2 U175 ( .A(n24), .Y(n22) );
  INVX2 U176 ( .A(A[17]), .Y(n103) );
  INVX2 U177 ( .A(n15), .Y(DIFF[17]) );
endmodule


module alu_DW01_add_1 ( A, B, CI, SUM, CO );
  input [17:0] A;
  input [17:0] B;
  output [17:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n16, n17,
         n18, n19, n20, n21, n23, n25, n26, n27, n28, n29, n31, n33, n34, n35,
         n36, n37, n39, n41, n42, n43, n44, n45, n47, n49, n50, n51, n52, n53,
         n55, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70, n71, n72, n74, n75, n77, n79, n81, n83, n85, n86, n87, n88, n90,
         n91, n150, n152, n153, n154, n155, n156, n157, n158, n159, n160, n161,
         n162, n163, n164, n165, n166, n167, n168, n169, n170, n171;

  XOR2X1 U4 ( .A(n152), .B(n1), .Y(SUM[14]) );
  OAI21X1 U5 ( .A(n21), .B(n19), .C(n20), .Y(n18) );
  NAND2X1 U6 ( .A(n20), .B(n75), .Y(n1) );
  NOR2X1 U8 ( .A(B[14]), .B(A[14]), .Y(n19) );
  NAND2X1 U9 ( .A(B[14]), .B(A[14]), .Y(n20) );
  XNOR2X1 U10 ( .A(n171), .B(n2), .Y(SUM[13]) );
  AOI21X1 U11 ( .A(n162), .B(n26), .C(n23), .Y(n21) );
  NAND2X1 U14 ( .A(n25), .B(n162), .Y(n2) );
  NAND2X1 U17 ( .A(B[13]), .B(A[13]), .Y(n25) );
  XOR2X1 U18 ( .A(n29), .B(n3), .Y(SUM[12]) );
  OAI21X1 U19 ( .A(n29), .B(n27), .C(n28), .Y(n26) );
  NAND2X1 U20 ( .A(n28), .B(n77), .Y(n3) );
  NOR2X1 U22 ( .A(B[12]), .B(A[12]), .Y(n27) );
  NAND2X1 U23 ( .A(B[12]), .B(A[12]), .Y(n28) );
  XNOR2X1 U24 ( .A(n153), .B(n4), .Y(SUM[11]) );
  AOI21X1 U25 ( .A(n161), .B(n34), .C(n31), .Y(n29) );
  NAND2X1 U28 ( .A(n33), .B(n161), .Y(n4) );
  NAND2X1 U31 ( .A(B[11]), .B(A[11]), .Y(n33) );
  XOR2X1 U32 ( .A(n37), .B(n5), .Y(SUM[10]) );
  OAI21X1 U33 ( .A(n37), .B(n35), .C(n36), .Y(n34) );
  NAND2X1 U34 ( .A(n36), .B(n79), .Y(n5) );
  NOR2X1 U36 ( .A(B[10]), .B(A[10]), .Y(n35) );
  NAND2X1 U37 ( .A(B[10]), .B(A[10]), .Y(n36) );
  XNOR2X1 U38 ( .A(n42), .B(n6), .Y(SUM[9]) );
  AOI21X1 U39 ( .A(n160), .B(n42), .C(n39), .Y(n37) );
  NAND2X1 U42 ( .A(n41), .B(n160), .Y(n6) );
  NAND2X1 U45 ( .A(B[9]), .B(A[9]), .Y(n41) );
  XOR2X1 U46 ( .A(n45), .B(n7), .Y(SUM[8]) );
  OAI21X1 U47 ( .A(n45), .B(n43), .C(n44), .Y(n42) );
  NAND2X1 U48 ( .A(n44), .B(n81), .Y(n7) );
  NOR2X1 U50 ( .A(B[8]), .B(A[8]), .Y(n43) );
  NAND2X1 U51 ( .A(B[8]), .B(A[8]), .Y(n44) );
  XNOR2X1 U52 ( .A(n50), .B(n8), .Y(SUM[7]) );
  AOI21X1 U53 ( .A(n159), .B(n50), .C(n47), .Y(n45) );
  NAND2X1 U56 ( .A(n49), .B(n159), .Y(n8) );
  NAND2X1 U59 ( .A(B[7]), .B(A[7]), .Y(n49) );
  XOR2X1 U60 ( .A(n53), .B(n9), .Y(SUM[6]) );
  OAI21X1 U61 ( .A(n53), .B(n51), .C(n52), .Y(n50) );
  NAND2X1 U62 ( .A(n52), .B(n83), .Y(n9) );
  NOR2X1 U64 ( .A(B[6]), .B(A[6]), .Y(n51) );
  NAND2X1 U65 ( .A(B[6]), .B(A[6]), .Y(n52) );
  XNOR2X1 U66 ( .A(n154), .B(n10), .Y(SUM[5]) );
  AOI21X1 U67 ( .A(n150), .B(n58), .C(n55), .Y(n53) );
  NAND2X1 U70 ( .A(n57), .B(n150), .Y(n10) );
  NAND2X1 U73 ( .A(B[5]), .B(A[5]), .Y(n57) );
  OAI21X1 U75 ( .A(n61), .B(n59), .C(n60), .Y(n58) );
  NAND2X1 U76 ( .A(n60), .B(n85), .Y(n11) );
  NOR2X1 U78 ( .A(B[4]), .B(A[4]), .Y(n59) );
  NAND2X1 U79 ( .A(B[4]), .B(A[4]), .Y(n60) );
  XNOR2X1 U80 ( .A(n66), .B(n12), .Y(SUM[3]) );
  AOI21X1 U81 ( .A(n70), .B(n62), .C(n63), .Y(n61) );
  NOR2X1 U82 ( .A(n64), .B(n67), .Y(n62) );
  OAI21X1 U83 ( .A(n64), .B(n68), .C(n65), .Y(n63) );
  NAND2X1 U84 ( .A(n65), .B(n86), .Y(n12) );
  NOR2X1 U86 ( .A(B[3]), .B(A[3]), .Y(n64) );
  NAND2X1 U87 ( .A(B[3]), .B(A[3]), .Y(n65) );
  XOR2X1 U88 ( .A(n69), .B(n13), .Y(SUM[2]) );
  OAI21X1 U89 ( .A(n69), .B(n67), .C(n68), .Y(n66) );
  NAND2X1 U90 ( .A(n68), .B(n87), .Y(n13) );
  NOR2X1 U92 ( .A(B[2]), .B(A[2]), .Y(n67) );
  NAND2X1 U93 ( .A(B[2]), .B(A[2]), .Y(n68) );
  XOR2X1 U94 ( .A(n74), .B(n14), .Y(SUM[1]) );
  OAI21X1 U96 ( .A(n71), .B(n74), .C(n72), .Y(n70) );
  NAND2X1 U97 ( .A(n72), .B(n88), .Y(n14) );
  NOR2X1 U99 ( .A(B[1]), .B(A[1]), .Y(n71) );
  NAND2X1 U100 ( .A(B[1]), .B(A[1]), .Y(n72) );
  NAND2X1 U105 ( .A(B[0]), .B(A[0]), .Y(n74) );
  OR2X2 U111 ( .A(B[5]), .B(A[5]), .Y(n150) );
  AND2X2 U112 ( .A(n74), .B(n163), .Y(SUM[0]) );
  INVX1 U113 ( .A(n71), .Y(n88) );
  BUFX2 U114 ( .A(n21), .Y(n152) );
  BUFX2 U115 ( .A(n34), .Y(n153) );
  BUFX2 U116 ( .A(n58), .Y(n154) );
  NAND3X1 U117 ( .A(n165), .B(n166), .C(n167), .Y(n155) );
  OR2X1 U118 ( .A(B[13]), .B(A[13]), .Y(n162) );
  INVX1 U119 ( .A(n18), .Y(n156) );
  INVX2 U120 ( .A(n156), .Y(n157) );
  INVX1 U121 ( .A(n67), .Y(n87) );
  INVX1 U122 ( .A(n59), .Y(n85) );
  OR2X1 U123 ( .A(B[9]), .B(A[9]), .Y(n160) );
  XOR2X1 U124 ( .A(n61), .B(n11), .Y(SUM[4]) );
  OR2X2 U125 ( .A(B[7]), .B(A[7]), .Y(n159) );
  XNOR2X1 U126 ( .A(n158), .B(n155), .Y(SUM[16]) );
  XNOR2X1 U127 ( .A(n90), .B(n91), .Y(n158) );
  OR2X1 U128 ( .A(B[11]), .B(A[11]), .Y(n161) );
  OR2X1 U129 ( .A(B[0]), .B(A[0]), .Y(n163) );
  XOR2X1 U130 ( .A(B[15]), .B(A[15]), .Y(n164) );
  XOR2X1 U131 ( .A(n164), .B(n157), .Y(SUM[15]) );
  NAND2X1 U132 ( .A(B[15]), .B(A[15]), .Y(n165) );
  NAND2X1 U133 ( .A(B[15]), .B(n18), .Y(n166) );
  NAND2X1 U134 ( .A(A[15]), .B(n18), .Y(n167) );
  NAND3X1 U135 ( .A(n165), .B(n166), .C(n167), .Y(n17) );
  NAND2X1 U136 ( .A(n90), .B(n91), .Y(n168) );
  NAND2X1 U137 ( .A(n90), .B(n17), .Y(n169) );
  NAND2X1 U138 ( .A(n91), .B(n17), .Y(n170) );
  NAND3X1 U139 ( .A(n168), .B(n169), .C(n170), .Y(n16) );
  BUFX2 U140 ( .A(n26), .Y(n171) );
  INVX1 U141 ( .A(n64), .Y(n86) );
  INVX2 U142 ( .A(A[17]), .Y(n91) );
  INVX2 U143 ( .A(B[17]), .Y(n90) );
  INVX2 U144 ( .A(n51), .Y(n83) );
  INVX2 U145 ( .A(n43), .Y(n81) );
  INVX2 U146 ( .A(n35), .Y(n79) );
  INVX2 U147 ( .A(n27), .Y(n77) );
  INVX2 U148 ( .A(n19), .Y(n75) );
  INVX2 U149 ( .A(n70), .Y(n69) );
  INVX2 U150 ( .A(n57), .Y(n55) );
  INVX2 U151 ( .A(n49), .Y(n47) );
  INVX2 U152 ( .A(n41), .Y(n39) );
  INVX2 U153 ( .A(n33), .Y(n31) );
  INVX2 U154 ( .A(n25), .Y(n23) );
  INVX2 U155 ( .A(n16), .Y(SUM[17]) );
endmodule


module alu_DW_mult_uns_2 ( a, b, product );
  input [30:0] a;
  input [15:0] b;
  output [46:0] product;
  wire   n1, n6, n7, n9, n13, n19, n24, n25, n28, n31, n36, n37, n46, n49, n51,
         n52, n53, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n72, n73, n74, n75, n77, n79, n80, n81, n82, n83, n84,
         n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98,
         n99, n100, n101, n102, n103, n104, n105, n106, n107, n109, n111, n112,
         n113, n114, n115, n116, n120, n122, n123, n124, n125, n126, n127,
         n128, n129, n130, n133, n134, n135, n136, n137, n140, n142, n144,
         n145, n146, n147, n148, n149, n151, n154, n155, n159, n160, n161,
         n162, n163, n164, n165, n166, n169, n170, n171, n172, n173, n174,
         n177, n178, n179, n181, n182, n183, n185, n186, n187, n188, n189,
         n190, n191, n192, n193, n194, n197, n198, n199, n200, n201, n202,
         n205, n206, n207, n209, n210, n211, n212, n213, n214, n215, n216,
         n217, n218, n219, n220, n221, n222, n223, n224, n233, n234, n235,
         n236, n237, n238, n239, n240, n241, n242, n243, n248, n249, n250,
         n251, n256, n257, n258, n259, n264, n265, n266, n267, n275, n279,
         n281, n282, n283, n284, n285, n286, n287, n288, n289, n290, n291,
         n292, n293, n294, n295, n296, n297, n298, n299, n300, n301, n302,
         n303, n304, n305, n306, n307, n308, n309, n310, n311, n312, n313,
         n314, n315, n316, n317, n318, n319, n320, n321, n322, n323, n324,
         n325, n326, n327, n328, n329, n330, n331, n332, n333, n334, n335,
         n336, n337, n338, n339, n340, n341, n342, n343, n344, n345, n346,
         n347, n348, n349, n350, n351, n352, n353, n354, n355, n356, n357,
         n358, n359, n360, n361, n362, n363, n364, n365, n366, n367, n368,
         n369, n370, n371, n372, n373, n374, n375, n376, n377, n378, n379,
         n380, n381, n382, n383, n384, n385, n386, n387, n388, n389, n390,
         n391, n392, n393, n394, n395, n396, n397, n398, n399, n400, n401,
         n402, n403, n404, n405, n406, n407, n408, n409, n410, n411, n412,
         n413, n414, n415, n416, n417, n418, n419, n420, n421, n422, n423,
         n424, n425, n426, n427, n428, n429, n430, n431, n432, n433, n434,
         n435, n436, n437, n438, n439, n440, n441, n442, n443, n444, n445,
         n446, n447, n448, n449, n450, n451, n452, n453, n454, n455, n456,
         n457, n458, n459, n460, n461, n462, n463, n464, n465, n466, n467,
         n468, n469, n470, n471, n472, n473, n474, n475, n476, n477, n478,
         n479, n480, n481, n482, n483, n484, n485, n486, n487, n488, n489,
         n490, n491, n492, n493, n494, n495, n496, n497, n498, n499, n500,
         n501, n502, n503, n504, n505, n506, n507, n508, n509, n510, n511,
         n512, n513, n514, n515, n516, n517, n518, n519, n520, n521, n522,
         n523, n524, n525, n526, n527, n528, n529, n530, n531, n532, n533,
         n534, n535, n536, n537, n538, n539, n540, n541, n542, n545, n548,
         n549, n551, n552, n554, n557, n560, n563, n565, n566, n567, n568,
         n569, n570, n571, n572, n573, n574, n575, n576, n577, n578, n579,
         n580, n581, n582, n584, n585, n586, n587, n588, n589, n590, n591,
         n592, n593, n594, n595, n596, n597, n598, n599, n600, n601, n602,
         n603, n604, n605, n606, n607, n608, n609, n610, n611, n612, n613,
         n614, n615, n616, n617, n618, n619, n620, n621, n622, n623, n624,
         n625, n626, n627, n628, n629, n630, n631, n632, n633, n634, n635,
         n636, n637, n638, n639, n640, n641, n642, n643, n644, n645, n646,
         n647, n648, n649, n650, n651, n652, n653, n654, n655, n656, n657,
         n658, n659, n660, n661, n662, n663, n664, n665, n666, n667, n668,
         n669, n670, n671, n672, n673, n674, n675, n676, n677, n678, n679,
         n680, n681, n682, n683, n684, n685, n686, n687, n688, n689, n690,
         n691, n692, n693, n694, n695, n696, n697, n698, n699, n700, n701,
         n702, n703, n704, n705, n706, n707, n708, n709, n710, n711, n712,
         n713, n714, n715, n716, n717, n718, n719, n720, n721, n722, n723,
         n724, n725, n727, n728, n729, n731, n736, n739, n741, n742, n743,
         n744, n745, n746, n747, n748, n749, n750, n751, n752, n753, n754,
         n755, n756, n757, n758, n759, n760, n761, n762, n763, n764, n765,
         n766, n767, n768, n769, n770, n771, n772, n773, n774, n775, n776,
         n777, n778, n779, n780, n781, n782, n783, n784, n785, n786, n787,
         n788, n789, n790, n791, n792, n793, n794, n795, n796, n797, n798,
         n799, n800, n801, n802, n803, n804, n805, n806, n807, n808, n809,
         n810, n811, n812, n813, n814, n815, n816, n817, n818, n819, n820,
         n821, n822, n823, n824, n825, n826, n827, n828, n829, n830, n831,
         n832, n833, n834, n835, n836, n837, n838, n839, n840, n841, n842,
         n843, n844, n845, n846, n847, n848, n849, n850, n851, n852, n853,
         n854, n855, n856, n857, n858, n859, n860, n861, n862, n863, n864,
         n865, n866, n867, n868, n869, n870, n871, n872, n873, n874, n875,
         n876, n877, n878, n879, n880, n881, n882, n883, n884, n885, n886,
         n887, n888, n889, n890, n891, n893, n894, n896, n898, n899, n900,
         n917, n918, n919, n920, n921, n922, n923, n924, n925, n995, n996,
         n997, n998, n999, n1000, n1001, n1002, n1003, n1004, n1005, n1006,
         n1007, n1008, n1009, n1010, n1011, n1012, n1013, n1014, n1015, n1016,
         n1017, n1018, n1019, n1020, n1021, n1022, n1023, n1024, n1025, n1026,
         n1027, n1028, n1029, n1030, n1031, n1032, n1033, n1034, n1035, n1036,
         n1037, n1038, n1039, n1040, n1041, n1042, n1043, n1044, n1045, n1046,
         n1047, n1048, n1049, n1050, n1051, n1052, n1053, n1054, n1055, n1056,
         n1057, n1058, n1059, n1060, n1061, n1062, n1063, n1064, n1065, n1066,
         n1067, n1068, n1069, n1070, n1071, n1072, n1073, n1074, n1075, n1076,
         n1077, n1078, n1079, n1080, n1081, n1082, n1083, n1084, n1085, n1086,
         n1087, n1088, n1089, n1090, n1091, n1092, n1093, n1094, n1095, n1096,
         n1097, n1098, n1099, n1100, n1101, n1102, n1103, n1104, n1105, n1106,
         n1107, n1108, n1109, n1110, n1111, n1112, n1113, n1114, n1115, n1116,
         n1117, n1118, n1119, n1120, n1121, n1122, n1123, n1124, n1125, n1126,
         n1127, n1128, n1129, n1130, n1131, n1132, n1133, n1134, n1135, n1136,
         n1137, n1138, n1139, n1140, n1141, n1142, n1143, n1144, n1145, n1146,
         n1147, n1148, n1149, n1150, n1151, n1152, n1153, n1154, n1155, n1156,
         n1157, n1158, n1159, n1160, n1161, n1162, n1163, n1164, n1165, n1166,
         n1167, n1168, n1169, n1170, n1171, n1172, n1173, n1174, n1175, n1176,
         n1177, n1178, n1179, n1180, n1181, n1182, n1183, n1184, n1185, n1186,
         n1187, n1188, n1189, n1190, n1191, n1192, n1193, n1194, n1195, n1196,
         n1197, n1198, n1199, n1200, n1201, n1202, n1203, n1204, n1205, n1206,
         n1207, n1208, n1209, n1210, n1211, n1212, n1213, n1214, n1215, n1216,
         n1217, n1218, n1219, n1220, n1221, n1222, n1223, n1224, n1225, n1226,
         n1227, n1228, n1229, n1230, n1231, n1232, n1233, n1234, n1235, n1236,
         n1237, n1238, n1239, n1240, n1241, n1242, n1243, n1244, n1245, n1246,
         n1247, n1248, n1249, n1250, n1251, n1252, n1253, n1254, n1255, n1256,
         n1257, n1258, n1259, n1260, n1261, n1262, n1263, n1264, n1265, n1266,
         n1267, n1268, n1269, n1270, n1271, n1272, n1273, n1274, n1275, n1276,
         n1277, n1278, n1279, n1280, n1281, n1282, n1283, n1284, n1285, n1286,
         n1287, n1288, n1289, n1290, n1291, n1292, n1293, n1294, n1295, n1296,
         n1297, n1298, n1299, n1300, n1301, n1302, n1303, n1304, n1305, n1306,
         n1307, n1308, n1309, n1310, n1311, n1312, n1313, n1314, n1315;
  assign n1 = b[1];
  assign n7 = b[3];
  assign n13 = b[5];
  assign n19 = b[7];
  assign n25 = b[9];
  assign n31 = b[11];
  assign n37 = b[13];
  assign n49 = a[15];
  assign n541 = b[15];
  assign n877 = a[30];
  assign n878 = a[29];
  assign n879 = a[28];
  assign n880 = a[27];
  assign n881 = a[26];
  assign n882 = a[25];
  assign n883 = a[24];
  assign n884 = a[23];
  assign n885 = a[22];
  assign n886 = a[21];
  assign n887 = a[20];
  assign n888 = a[19];
  assign n889 = a[18];
  assign n890 = a[17];
  assign n891 = a[16];

  NAND2X1 U58 ( .A(n292), .B(n293), .Y(n72) );
  AOI21X1 U60 ( .A(n1277), .B(n74), .C(n75), .Y(n73) );
  NOR2X1 U61 ( .A(n1163), .B(n1198), .Y(n74) );
  OAI21X1 U62 ( .A(n1200), .B(n1163), .C(n77), .Y(n75) );
  OAI21X1 U66 ( .A(n80), .B(n140), .C(n81), .Y(n79) );
  NAND2X1 U67 ( .A(n82), .B(n104), .Y(n80) );
  AOI21X1 U68 ( .A(n82), .B(n105), .C(n83), .Y(n81) );
  NOR2X1 U69 ( .A(n84), .B(n93), .Y(n82) );
  OAI21X1 U70 ( .A(n94), .B(n84), .C(n85), .Y(n83) );
  NOR2X1 U73 ( .A(n294), .B(n297), .Y(n84) );
  NAND2X1 U74 ( .A(n294), .B(n297), .Y(n85) );
  XOR2X1 U75 ( .A(n95), .B(n56), .Y(product[44]) );
  AOI21X1 U76 ( .A(n1277), .B(n87), .C(n88), .Y(n86) );
  NOR2X1 U77 ( .A(n89), .B(n1039), .Y(n87) );
  OAI21X1 U78 ( .A(n89), .B(n1200), .C(n90), .Y(n88) );
  NAND2X1 U79 ( .A(n91), .B(n100), .Y(n89) );
  AOI21X1 U80 ( .A(n91), .B(n101), .C(n92), .Y(n90) );
  NAND2X1 U83 ( .A(n94), .B(n91), .Y(n56) );
  NOR2X1 U85 ( .A(n298), .B(n301), .Y(n93) );
  NAND2X1 U86 ( .A(n298), .B(n301), .Y(n94) );
  XOR2X1 U87 ( .A(n112), .B(n57), .Y(product[43]) );
  AOI21X1 U88 ( .A(n1018), .B(n96), .C(n97), .Y(n95) );
  NOR2X1 U89 ( .A(n98), .B(n1039), .Y(n96) );
  OAI21X1 U90 ( .A(n1200), .B(n98), .C(n99), .Y(n97) );
  NOR2X1 U93 ( .A(n102), .B(n137), .Y(n100) );
  OAI21X1 U94 ( .A(n140), .B(n102), .C(n103), .Y(n101) );
  NOR2X1 U97 ( .A(n106), .B(n130), .Y(n104) );
  OAI21X1 U98 ( .A(n106), .B(n133), .C(n107), .Y(n105) );
  NAND2X1 U99 ( .A(n1169), .B(n1015), .Y(n106) );
  AOI21X1 U100 ( .A(n120), .B(n1169), .C(n109), .Y(n107) );
  NAND2X1 U103 ( .A(n111), .B(n1169), .Y(n57) );
  NAND2X1 U106 ( .A(n302), .B(n307), .Y(n111) );
  XOR2X1 U107 ( .A(n123), .B(n58), .Y(product[42]) );
  AOI21X1 U108 ( .A(n1018), .B(n113), .C(n114), .Y(n112) );
  NOR2X1 U109 ( .A(n115), .B(n1039), .Y(n113) );
  OAI21X1 U110 ( .A(n115), .B(n1200), .C(n116), .Y(n114) );
  NAND2X1 U111 ( .A(n1015), .B(n128), .Y(n115) );
  AOI21X1 U112 ( .A(n1015), .B(n129), .C(n120), .Y(n116) );
  NAND2X1 U117 ( .A(n122), .B(n1015), .Y(n58) );
  NAND2X1 U120 ( .A(n308), .B(n313), .Y(n122) );
  XOR2X1 U121 ( .A(n134), .B(n59), .Y(product[41]) );
  AOI21X1 U122 ( .A(n1018), .B(n124), .C(n125), .Y(n123) );
  NOR2X1 U123 ( .A(n126), .B(n1039), .Y(n124) );
  OAI21X1 U124 ( .A(n1200), .B(n126), .C(n127), .Y(n125) );
  NOR2X1 U127 ( .A(n130), .B(n137), .Y(n128) );
  OAI21X1 U128 ( .A(n140), .B(n130), .C(n133), .Y(n129) );
  NAND2X1 U131 ( .A(n133), .B(n279), .Y(n59) );
  NOR2X1 U133 ( .A(n314), .B(n321), .Y(n130) );
  NAND2X1 U134 ( .A(n314), .B(n321), .Y(n133) );
  XOR2X1 U135 ( .A(n145), .B(n60), .Y(product[40]) );
  AOI21X1 U136 ( .A(n1018), .B(n135), .C(n136), .Y(n134) );
  NOR2X1 U137 ( .A(n1197), .B(n1039), .Y(n135) );
  OAI21X1 U138 ( .A(n1200), .B(n1197), .C(n140), .Y(n136) );
  NAND2X1 U141 ( .A(n1164), .B(n281), .Y(n137) );
  AOI21X1 U142 ( .A(n151), .B(n1164), .C(n142), .Y(n140) );
  NAND2X1 U145 ( .A(n144), .B(n1164), .Y(n60) );
  NAND2X1 U148 ( .A(n322), .B(n329), .Y(n144) );
  XOR2X1 U149 ( .A(n154), .B(n61), .Y(product[39]) );
  AOI21X1 U150 ( .A(n1018), .B(n146), .C(n147), .Y(n145) );
  NOR2X1 U151 ( .A(n148), .B(n1039), .Y(n146) );
  OAI21X1 U152 ( .A(n1200), .B(n148), .C(n149), .Y(n147) );
  NAND2X1 U157 ( .A(n149), .B(n281), .Y(n61) );
  NOR2X1 U159 ( .A(n339), .B(n330), .Y(n148) );
  NAND2X1 U160 ( .A(n339), .B(n330), .Y(n149) );
  XOR2X1 U161 ( .A(n163), .B(n62), .Y(product[38]) );
  AOI21X1 U162 ( .A(n155), .B(n1018), .C(n1199), .Y(n154) );
  NAND2X1 U165 ( .A(n159), .B(n171), .Y(n53) );
  AOI21X1 U166 ( .A(n172), .B(n159), .C(n160), .Y(n52) );
  NOR2X1 U167 ( .A(n161), .B(n166), .Y(n159) );
  OAI21X1 U168 ( .A(n161), .B(n169), .C(n162), .Y(n160) );
  NAND2X1 U169 ( .A(n162), .B(n282), .Y(n62) );
  NOR2X1 U171 ( .A(n340), .B(n349), .Y(n161) );
  NAND2X1 U172 ( .A(n340), .B(n349), .Y(n162) );
  XOR2X1 U173 ( .A(n170), .B(n63), .Y(product[37]) );
  AOI21X1 U174 ( .A(n164), .B(n1018), .C(n165), .Y(n163) );
  NOR2X1 U175 ( .A(n1155), .B(n173), .Y(n164) );
  OAI21X1 U176 ( .A(n174), .B(n1155), .C(n169), .Y(n165) );
  NAND2X1 U179 ( .A(n169), .B(n283), .Y(n63) );
  NOR2X1 U181 ( .A(n350), .B(n361), .Y(n166) );
  NAND2X1 U182 ( .A(n350), .B(n361), .Y(n169) );
  XOR2X1 U183 ( .A(n179), .B(n64), .Y(product[36]) );
  AOI21X1 U184 ( .A(n171), .B(n1018), .C(n1052), .Y(n170) );
  NOR2X1 U189 ( .A(n177), .B(n182), .Y(n171) );
  OAI21X1 U190 ( .A(n177), .B(n183), .C(n178), .Y(n172) );
  NAND2X1 U191 ( .A(n178), .B(n284), .Y(n64) );
  NOR2X1 U193 ( .A(n373), .B(n362), .Y(n177) );
  NAND2X1 U194 ( .A(n373), .B(n362), .Y(n178) );
  XNOR2X1 U195 ( .A(n1018), .B(n65), .Y(product[35]) );
  AOI21X1 U196 ( .A(n285), .B(n1018), .C(n181), .Y(n179) );
  NAND2X1 U199 ( .A(n183), .B(n285), .Y(n65) );
  NOR2X1 U201 ( .A(n387), .B(n374), .Y(n182) );
  NAND2X1 U202 ( .A(n374), .B(n387), .Y(n183) );
  XOR2X1 U203 ( .A(n191), .B(n66), .Y(product[34]) );
  OAI21X1 U204 ( .A(n213), .B(n185), .C(n186), .Y(n51) );
  NAND2X1 U205 ( .A(n187), .B(n199), .Y(n185) );
  AOI21X1 U206 ( .A(n200), .B(n187), .C(n188), .Y(n186) );
  NOR2X1 U207 ( .A(n189), .B(n194), .Y(n187) );
  OAI21X1 U208 ( .A(n1046), .B(n197), .C(n190), .Y(n188) );
  NAND2X1 U209 ( .A(n190), .B(n286), .Y(n66) );
  NOR2X1 U211 ( .A(n401), .B(n388), .Y(n189) );
  NAND2X1 U212 ( .A(n401), .B(n388), .Y(n190) );
  XOR2X1 U213 ( .A(n198), .B(n67), .Y(product[33]) );
  AOI21X1 U214 ( .A(n212), .B(n192), .C(n193), .Y(n191) );
  NOR2X1 U215 ( .A(n1161), .B(n201), .Y(n192) );
  OAI21X1 U216 ( .A(n202), .B(n1161), .C(n197), .Y(n193) );
  NAND2X1 U219 ( .A(n197), .B(n287), .Y(n67) );
  NOR2X1 U221 ( .A(n415), .B(n402), .Y(n194) );
  NAND2X1 U222 ( .A(n415), .B(n402), .Y(n197) );
  XOR2X1 U223 ( .A(n207), .B(n68), .Y(product[32]) );
  AOI21X1 U224 ( .A(n199), .B(n212), .C(n200), .Y(n198) );
  NOR2X1 U229 ( .A(n205), .B(n210), .Y(n199) );
  OAI21X1 U230 ( .A(n1150), .B(n211), .C(n206), .Y(n200) );
  NAND2X1 U231 ( .A(n206), .B(n288), .Y(n68) );
  NOR2X1 U233 ( .A(n416), .B(n429), .Y(n205) );
  NAND2X1 U234 ( .A(n416), .B(n429), .Y(n206) );
  XNOR2X1 U235 ( .A(n212), .B(n69), .Y(product[31]) );
  AOI21X1 U236 ( .A(n289), .B(n212), .C(n209), .Y(n207) );
  NAND2X1 U239 ( .A(n211), .B(n289), .Y(n69) );
  NOR2X1 U241 ( .A(n443), .B(n430), .Y(n210) );
  NAND2X1 U242 ( .A(n443), .B(n430), .Y(n211) );
  XNOR2X1 U243 ( .A(n218), .B(n70), .Y(product[30]) );
  AOI21X1 U245 ( .A(n222), .B(n214), .C(n215), .Y(n213) );
  NOR2X1 U246 ( .A(n219), .B(n1041), .Y(n214) );
  OAI21X1 U247 ( .A(n216), .B(n220), .C(n217), .Y(n215) );
  NAND2X1 U248 ( .A(n217), .B(n290), .Y(n70) );
  NOR2X1 U250 ( .A(n457), .B(n444), .Y(n216) );
  NAND2X1 U251 ( .A(n457), .B(n444), .Y(n217) );
  OAI21X1 U252 ( .A(n221), .B(n219), .C(n220), .Y(n218) );
  NOR2X1 U253 ( .A(n469), .B(n458), .Y(n219) );
  NAND2X1 U254 ( .A(n469), .B(n458), .Y(n220) );
  OAI21X1 U256 ( .A(n223), .B(n233), .C(n224), .Y(n222) );
  NAND2X1 U257 ( .A(n1167), .B(n1165), .Y(n223) );
  AOI21X1 U258 ( .A(n1166), .B(n1165), .C(n1168), .Y(n224) );
  AOI21X1 U267 ( .A(n240), .B(n234), .C(n235), .Y(n233) );
  NOR2X1 U268 ( .A(n238), .B(n236), .Y(n234) );
  OAI21X1 U269 ( .A(n236), .B(n239), .C(n237), .Y(n235) );
  NOR2X1 U270 ( .A(n501), .B(n492), .Y(n236) );
  NAND2X1 U271 ( .A(n501), .B(n492), .Y(n237) );
  NOR2X1 U272 ( .A(n509), .B(n502), .Y(n238) );
  NAND2X1 U273 ( .A(n509), .B(n502), .Y(n239) );
  OAI21X1 U274 ( .A(n243), .B(n241), .C(n242), .Y(n240) );
  NOR2X1 U275 ( .A(n517), .B(n510), .Y(n241) );
  NAND2X1 U276 ( .A(n517), .B(n510), .Y(n242) );
  AOI21X1 U277 ( .A(n1171), .B(n248), .C(n1172), .Y(n243) );
  OAI21X1 U282 ( .A(n251), .B(n249), .C(n250), .Y(n248) );
  NOR2X1 U283 ( .A(n529), .B(n524), .Y(n249) );
  NAND2X1 U284 ( .A(n529), .B(n524), .Y(n250) );
  AOI21X1 U285 ( .A(n256), .B(n1170), .C(n1173), .Y(n251) );
  OAI21X1 U290 ( .A(n257), .B(n259), .C(n258), .Y(n256) );
  NOR2X1 U291 ( .A(n537), .B(n534), .Y(n257) );
  NAND2X1 U292 ( .A(n537), .B(n534), .Y(n258) );
  AOI21X1 U293 ( .A(n264), .B(n1174), .C(n1175), .Y(n259) );
  OAI21X1 U298 ( .A(n265), .B(n267), .C(n266), .Y(n264) );
  NOR2X1 U299 ( .A(n707), .B(n540), .Y(n265) );
  NAND2X1 U300 ( .A(n707), .B(n540), .Y(n266) );
  AOI21X1 U301 ( .A(n1178), .B(n1013), .C(n1016), .Y(n267) );
  XOR2X1 U308 ( .A(n295), .B(n291), .Y(n292) );
  FAX1 U310 ( .A(n296), .B(n584), .C(n299), .YC(n293), .YS(n294) );
  FAX1 U312 ( .A(n585), .B(n300), .C(n303), .YC(n297), .YS(n298) );
  FAX1 U313 ( .A(n305), .B(n574), .C(n601), .YC(n299), .YS(n300) );
  FAX1 U314 ( .A(n311), .B(n304), .C(n309), .YC(n301), .YS(n302) );
  FAX1 U315 ( .A(n306), .B(n586), .C(n602), .YC(n303), .YS(n304) );
  FAX1 U317 ( .A(n317), .B(n315), .C(n310), .YC(n307), .YS(n308) );
  FAX1 U318 ( .A(n619), .B(n603), .C(n312), .YC(n309), .YS(n310) );
  FAX1 U319 ( .A(n319), .B(n575), .C(n587), .YC(n311), .YS(n312) );
  FAX1 U320 ( .A(n318), .B(n316), .C(n323), .YC(n313), .YS(n314) );
  FAX1 U321 ( .A(n588), .B(n327), .C(n325), .YC(n315), .YS(n316) );
  FAX1 U322 ( .A(n320), .B(n604), .C(n620), .YC(n317), .YS(n318) );
  FAX1 U324 ( .A(n333), .B(n324), .C(n331), .YC(n321), .YS(n322) );
  FAX1 U325 ( .A(n328), .B(n335), .C(n326), .YC(n323), .YS(n324) );
  FAX1 U326 ( .A(n589), .B(n637), .C(n621), .YC(n325), .YS(n326) );
  FAX1 U327 ( .A(n337), .B(n576), .C(n605), .YC(n327), .YS(n328) );
  FAX1 U328 ( .A(n343), .B(n332), .C(n341), .YC(n329), .YS(n330) );
  FAX1 U329 ( .A(n345), .B(n336), .C(n334), .YC(n331), .YS(n332) );
  FAX1 U331 ( .A(n338), .B(n622), .C(n638), .YC(n335), .YS(n336) );
  FAX1 U333 ( .A(n344), .B(n351), .C(n342), .YC(n339), .YS(n340) );
  FAX1 U335 ( .A(n591), .B(n348), .C(n357), .YC(n343), .YS(n344) );
  FAX1 U336 ( .A(n607), .B(n655), .C(n639), .YC(n345), .YS(n346) );
  FAX1 U338 ( .A(n354), .B(n352), .C(n363), .YC(n349), .YS(n350) );
  FAX1 U341 ( .A(n592), .B(n608), .C(n640), .YC(n355), .YS(n356) );
  FAX1 U342 ( .A(n360), .B(n624), .C(n656), .YC(n357), .YS(n358) );
  FAX1 U344 ( .A(n366), .B(n375), .C(n364), .YC(n361), .YS(n362) );
  FAX1 U350 ( .A(n378), .B(n1066), .C(n376), .YC(n373), .YS(n374) );
  FAX1 U354 ( .A(n626), .B(n594), .C(n658), .YC(n381), .YS(n382) );
  FAX1 U355 ( .A(n386), .B(n642), .C(n674), .YC(n383), .YS(n384) );
  FAX1 U358 ( .A(n407), .B(n394), .C(n405), .YC(n389), .YS(n390) );
  FAX1 U361 ( .A(n659), .B(n611), .C(n595), .YC(n395), .YS(n396) );
  FAX1 U362 ( .A(n627), .B(n675), .C(n691), .YC(n397), .YS(n398) );
  FAX1 U363 ( .A(n579), .B(n643), .C(n709), .YC(n399), .YS(n400) );
  FAX1 U364 ( .A(n406), .B(n417), .C(n404), .YC(n401), .YS(n402) );
  FAX1 U366 ( .A(n999), .B(n410), .C(n412), .YC(n405), .YS(n406) );
  FAX1 U369 ( .A(n628), .B(n692), .C(n596), .YC(n411), .YS(n412) );
  FAX1 U370 ( .A(n563), .B(n580), .C(n644), .YC(n413), .YS(n414) );
  FAX1 U375 ( .A(n677), .B(n661), .C(n613), .YC(n423), .YS(n424) );
  FAX1 U377 ( .A(n563), .B(n581), .C(n645), .YC(n427), .YS(n428) );
  FAX1 U380 ( .A(n442), .B(n438), .C(n440), .YC(n433), .YS(n434) );
  FAX1 U381 ( .A(n455), .B(n453), .C(n451), .YC(n435), .YS(n436) );
  FAX1 U382 ( .A(n694), .B(n678), .C(n598), .YC(n437), .YS(n438) );
  FAX1 U383 ( .A(n646), .B(n630), .C(n710), .YC(n439), .YS(n440) );
  FAX1 U386 ( .A(n463), .B(n450), .C(n461), .YC(n445), .YS(n446) );
  FAX1 U387 ( .A(n1003), .B(n452), .C(n454), .YC(n447), .YS(n448) );
  FAX1 U389 ( .A(n615), .B(n679), .C(n565), .YC(n451), .YS(n452) );
  HAX1 U391 ( .A(n663), .B(n711), .YC(n455), .YS(n456) );
  FAX1 U392 ( .A(n462), .B(n471), .C(n460), .YC(n457), .YS(n458) );
  FAX1 U394 ( .A(n477), .B(n475), .C(n466), .YC(n461), .YS(n462) );
  FAX1 U395 ( .A(n696), .B(n680), .C(n479), .YC(n463), .YS(n464) );
  FAX1 U396 ( .A(n712), .B(n648), .C(n664), .YC(n465), .YS(n466) );
  FAX1 U397 ( .A(n600), .B(n632), .C(n616), .YC(n467), .YS(n468) );
  FAX1 U400 ( .A(n480), .B(n1004), .C(n487), .YC(n473), .YS(n474) );
  FAX1 U401 ( .A(n566), .B(n649), .C(n665), .YC(n475), .YS(n476) );
  FAX1 U402 ( .A(n633), .B(n681), .C(n617), .YC(n477), .YS(n478) );
  HAX1 U403 ( .A(n713), .B(n697), .YC(n479), .YS(n480) );
  FAX1 U404 ( .A(n486), .B(n493), .C(n484), .YC(n481), .YS(n482) );
  FAX1 U405 ( .A(n490), .B(n488), .C(n495), .YC(n483), .YS(n484) );
  FAX1 U406 ( .A(n698), .B(n499), .C(n497), .YC(n485), .YS(n486) );
  FAX1 U407 ( .A(n714), .B(n666), .C(n682), .YC(n487), .YS(n488) );
  FAX1 U408 ( .A(n618), .B(n650), .C(n634), .YC(n489), .YS(n490) );
  FAX1 U409 ( .A(n496), .B(n503), .C(n494), .YC(n491), .YS(n492) );
  FAX1 U410 ( .A(n507), .B(n505), .C(n498), .YC(n493), .YS(n494) );
  FAX1 U411 ( .A(n699), .B(n567), .C(n500), .YC(n495), .YS(n496) );
  FAX1 U412 ( .A(n667), .B(n635), .C(n683), .YC(n497), .YS(n498) );
  HAX1 U413 ( .A(n715), .B(n651), .YC(n499), .YS(n500) );
  FAX1 U414 ( .A(n506), .B(n511), .C(n504), .YC(n501), .YS(n502) );
  FAX1 U415 ( .A(n515), .B(n513), .C(n508), .YC(n503), .YS(n504) );
  FAX1 U416 ( .A(n716), .B(n684), .C(n700), .YC(n505), .YS(n506) );
  FAX1 U417 ( .A(n636), .B(n668), .C(n652), .YC(n507), .YS(n508) );
  FAX1 U418 ( .A(n514), .B(n519), .C(n512), .YC(n509), .YS(n510) );
  FAX1 U419 ( .A(n568), .B(n516), .C(n521), .YC(n511), .YS(n512) );
  FAX1 U420 ( .A(n685), .B(n669), .C(n653), .YC(n513), .YS(n514) );
  HAX1 U421 ( .A(n717), .B(n701), .YC(n515), .YS(n516) );
  FAX1 U422 ( .A(n525), .B(n522), .C(n520), .YC(n517), .YS(n518) );
  FAX1 U423 ( .A(n718), .B(n702), .C(n527), .YC(n519), .YS(n520) );
  FAX1 U424 ( .A(n654), .B(n686), .C(n670), .YC(n521), .YS(n522) );
  FAX1 U425 ( .A(n528), .B(n531), .C(n526), .YC(n523), .YS(n524) );
  FAX1 U426 ( .A(n719), .B(n569), .C(n671), .YC(n525), .YS(n526) );
  HAX1 U427 ( .A(n703), .B(n687), .YC(n527), .YS(n528) );
  FAX1 U428 ( .A(n704), .B(n535), .C(n532), .YC(n529), .YS(n530) );
  FAX1 U429 ( .A(n672), .B(n720), .C(n688), .YC(n531), .YS(n532) );
  FAX1 U430 ( .A(n570), .B(n689), .C(n536), .YC(n533), .YS(n534) );
  HAX1 U431 ( .A(n705), .B(n721), .YC(n535), .YS(n536) );
  FAX1 U432 ( .A(n690), .B(n722), .C(n706), .YC(n537), .YS(n538) );
  HAX1 U433 ( .A(n723), .B(n571), .YC(n539), .YS(n540) );
  NOR2X1 U434 ( .A(n918), .B(n1312), .Y(n573) );
  NOR2X1 U435 ( .A(n918), .B(n727), .Y(n295) );
  NOR2X1 U436 ( .A(n918), .B(n728), .Y(n574) );
  NOR2X1 U437 ( .A(n918), .B(n729), .Y(n305) );
  NOR2X1 U438 ( .A(n918), .B(n1304), .Y(n575) );
  NOR2X1 U439 ( .A(n918), .B(n731), .Y(n319) );
  NOR2X1 U440 ( .A(n918), .B(n1302), .Y(n576) );
  NOR2X1 U441 ( .A(n918), .B(n1300), .Y(n337) );
  NOR2X1 U442 ( .A(n918), .B(n1298), .Y(n577) );
  NOR2X1 U444 ( .A(n918), .B(n736), .Y(n578) );
  NOR2X1 U446 ( .A(n918), .B(n1292), .Y(n579) );
  NOR2X1 U447 ( .A(n918), .B(n739), .Y(n580) );
  NOR2X1 U448 ( .A(n918), .B(n1290), .Y(n581) );
  OAI22X1 U466 ( .A(n918), .B(n1275), .C(n1273), .D(n757), .Y(n565) );
  OAI22X1 U469 ( .A(n918), .B(n1114), .C(n1067), .D(n741), .Y(n584) );
  OAI22X1 U470 ( .A(n1067), .B(n742), .C(n1114), .D(n741), .Y(n585) );
  OAI22X1 U471 ( .A(n1023), .B(n743), .C(n1114), .D(n742), .Y(n586) );
  OAI22X1 U472 ( .A(n1274), .B(n744), .C(n1114), .D(n743), .Y(n587) );
  OAI22X1 U473 ( .A(n1067), .B(n745), .C(n1114), .D(n744), .Y(n588) );
  OAI22X1 U474 ( .A(n1274), .B(n746), .C(n1114), .D(n745), .Y(n589) );
  OAI22X1 U475 ( .A(n1023), .B(n747), .C(n1114), .D(n746), .Y(n590) );
  OAI22X1 U476 ( .A(n1067), .B(n748), .C(n1114), .D(n747), .Y(n591) );
  OAI22X1 U477 ( .A(n1023), .B(n749), .C(n1114), .D(n748), .Y(n592) );
  OAI22X1 U478 ( .A(n1023), .B(n750), .C(n1114), .D(n749), .Y(n593) );
  OAI22X1 U479 ( .A(n1274), .B(n751), .C(n1114), .D(n750), .Y(n594) );
  OAI22X1 U480 ( .A(n1274), .B(n752), .C(n1114), .D(n751), .Y(n595) );
  OAI22X1 U481 ( .A(n1275), .B(n753), .C(n1273), .D(n752), .Y(n596) );
  OAI22X1 U482 ( .A(n1275), .B(n754), .C(n1114), .D(n753), .Y(n597) );
  OAI22X1 U483 ( .A(n1274), .B(n755), .C(n1114), .D(n754), .Y(n598) );
  OAI22X1 U484 ( .A(n1114), .B(n755), .C(n1275), .D(n756), .Y(n599) );
  AND2X1 U485 ( .A(n1314), .B(n1113), .Y(n600) );
  XNOR2X1 U487 ( .A(n877), .B(n1289), .Y(n741) );
  XNOR2X1 U488 ( .A(n1311), .B(n1289), .Y(n742) );
  XNOR2X1 U489 ( .A(n1309), .B(n1289), .Y(n743) );
  XNOR2X1 U490 ( .A(n1307), .B(n1289), .Y(n744) );
  XNOR2X1 U491 ( .A(n1305), .B(n1289), .Y(n745) );
  XNOR2X1 U492 ( .A(n882), .B(n1289), .Y(n746) );
  XNOR2X1 U493 ( .A(n883), .B(n1289), .Y(n747) );
  XNOR2X1 U494 ( .A(n1301), .B(n1289), .Y(n748) );
  XNOR2X1 U495 ( .A(n1299), .B(n1289), .Y(n749) );
  XNOR2X1 U496 ( .A(n1297), .B(n1289), .Y(n750) );
  XNOR2X1 U497 ( .A(n887), .B(n1289), .Y(n751) );
  XNOR2X1 U498 ( .A(n1295), .B(n1289), .Y(n752) );
  XNOR2X1 U499 ( .A(n1293), .B(n541), .Y(n753) );
  XNOR2X1 U500 ( .A(n890), .B(n541), .Y(n754) );
  XNOR2X1 U501 ( .A(n1291), .B(n541), .Y(n755) );
  XNOR2X1 U502 ( .A(n1314), .B(n1289), .Y(n756) );
  OAI22X1 U505 ( .A(n919), .B(n1269), .C(n1077), .D(n774), .Y(n566) );
  OAI22X1 U508 ( .A(n919), .B(n1077), .C(n1270), .D(n758), .Y(n602) );
  OAI22X1 U509 ( .A(n1270), .B(n759), .C(n1077), .D(n758), .Y(n603) );
  OAI22X1 U510 ( .A(n1269), .B(n760), .C(n1077), .D(n759), .Y(n604) );
  OAI22X1 U511 ( .A(n1270), .B(n761), .C(n1077), .D(n760), .Y(n605) );
  OAI22X1 U512 ( .A(n1269), .B(n762), .C(n1077), .D(n761), .Y(n606) );
  OAI22X1 U513 ( .A(n1270), .B(n763), .C(n1077), .D(n762), .Y(n607) );
  OAI22X1 U514 ( .A(n1269), .B(n764), .C(n1077), .D(n763), .Y(n608) );
  OAI22X1 U515 ( .A(n1269), .B(n765), .C(n1077), .D(n764), .Y(n609) );
  OAI22X1 U516 ( .A(n1270), .B(n766), .C(n1077), .D(n765), .Y(n610) );
  OAI22X1 U517 ( .A(n1269), .B(n767), .C(n1077), .D(n766), .Y(n611) );
  OAI22X1 U518 ( .A(n1270), .B(n768), .C(n1077), .D(n767), .Y(n612) );
  OAI22X1 U519 ( .A(n1269), .B(n769), .C(n1077), .D(n768), .Y(n613) );
  OAI22X1 U520 ( .A(n1270), .B(n770), .C(n1077), .D(n769), .Y(n614) );
  OAI22X1 U521 ( .A(n1269), .B(n771), .C(n1268), .D(n770), .Y(n615) );
  OAI22X1 U522 ( .A(n1270), .B(n772), .C(n1077), .D(n771), .Y(n616) );
  OAI22X1 U523 ( .A(n1077), .B(n772), .C(n1270), .D(n773), .Y(n617) );
  AND2X1 U524 ( .A(n1314), .B(n1076), .Y(n618) );
  XNOR2X1 U526 ( .A(n877), .B(n998), .Y(n758) );
  XNOR2X1 U527 ( .A(n1311), .B(n998), .Y(n759) );
  XNOR2X1 U528 ( .A(n1309), .B(n998), .Y(n760) );
  XNOR2X1 U529 ( .A(n1307), .B(n998), .Y(n761) );
  XNOR2X1 U530 ( .A(n1305), .B(n998), .Y(n762) );
  XNOR2X1 U531 ( .A(n882), .B(n998), .Y(n763) );
  XNOR2X1 U532 ( .A(n883), .B(n998), .Y(n764) );
  XNOR2X1 U533 ( .A(n1301), .B(n998), .Y(n765) );
  XNOR2X1 U534 ( .A(n1299), .B(n998), .Y(n766) );
  XNOR2X1 U535 ( .A(n1297), .B(n997), .Y(n767) );
  XNOR2X1 U536 ( .A(n887), .B(n997), .Y(n768) );
  XNOR2X1 U537 ( .A(n1295), .B(n998), .Y(n769) );
  XNOR2X1 U539 ( .A(n890), .B(n997), .Y(n771) );
  XNOR2X1 U540 ( .A(n1291), .B(n998), .Y(n772) );
  XNOR2X1 U541 ( .A(n1313), .B(n998), .Y(n773) );
  OR2X1 U542 ( .A(n1313), .B(n919), .Y(n774) );
  OAI22X1 U544 ( .A(n920), .B(n1201), .C(n1190), .D(n791), .Y(n567) );
  OAI22X1 U547 ( .A(n920), .B(n1191), .C(n1267), .D(n775), .Y(n620) );
  OAI22X1 U548 ( .A(n1201), .B(n776), .C(n1191), .D(n775), .Y(n621) );
  OAI22X1 U549 ( .A(n1201), .B(n777), .C(n1191), .D(n776), .Y(n622) );
  OAI22X1 U550 ( .A(n1267), .B(n778), .C(n1190), .D(n777), .Y(n623) );
  OAI22X1 U551 ( .A(n1160), .B(n779), .C(n1191), .D(n778), .Y(n624) );
  OAI22X1 U552 ( .A(n1160), .B(n780), .C(n1191), .D(n779), .Y(n625) );
  OAI22X1 U553 ( .A(n1160), .B(n781), .C(n1191), .D(n780), .Y(n626) );
  OAI22X1 U554 ( .A(n1267), .B(n782), .C(n1190), .D(n781), .Y(n627) );
  OAI22X1 U555 ( .A(n1201), .B(n783), .C(n1191), .D(n782), .Y(n628) );
  OAI22X1 U556 ( .A(n1160), .B(n784), .C(n1190), .D(n783), .Y(n629) );
  OAI22X1 U557 ( .A(n1267), .B(n1040), .C(n1191), .D(n784), .Y(n630) );
  OAI22X1 U558 ( .A(n1267), .B(n786), .C(n1190), .D(n785), .Y(n631) );
  OAI22X1 U559 ( .A(n1160), .B(n787), .C(n1190), .D(n786), .Y(n632) );
  OAI22X1 U560 ( .A(n1201), .B(n788), .C(n1191), .D(n787), .Y(n633) );
  OAI22X1 U561 ( .A(n1160), .B(n789), .C(n1191), .D(n788), .Y(n634) );
  OAI22X1 U562 ( .A(n1191), .B(n789), .C(n1160), .D(n790), .Y(n635) );
  XNOR2X1 U565 ( .A(n877), .B(n1285), .Y(n775) );
  XNOR2X1 U566 ( .A(n1311), .B(n1285), .Y(n776) );
  XNOR2X1 U567 ( .A(n1309), .B(n1285), .Y(n777) );
  XNOR2X1 U568 ( .A(n1307), .B(n1285), .Y(n778) );
  XNOR2X1 U569 ( .A(n1305), .B(n1285), .Y(n779) );
  XNOR2X1 U570 ( .A(n882), .B(n1285), .Y(n780) );
  XNOR2X1 U571 ( .A(n883), .B(n1285), .Y(n781) );
  XNOR2X1 U572 ( .A(n1301), .B(n1285), .Y(n782) );
  XNOR2X1 U573 ( .A(n1299), .B(n1285), .Y(n783) );
  XNOR2X1 U574 ( .A(n1297), .B(n1185), .Y(n784) );
  XNOR2X1 U575 ( .A(n887), .B(n1185), .Y(n785) );
  XNOR2X1 U576 ( .A(n1295), .B(n1285), .Y(n786) );
  XNOR2X1 U577 ( .A(n1293), .B(n1185), .Y(n787) );
  XNOR2X1 U578 ( .A(n890), .B(n1185), .Y(n788) );
  XNOR2X1 U579 ( .A(n1291), .B(n1185), .Y(n789) );
  XNOR2X1 U580 ( .A(n1313), .B(n1285), .Y(n790) );
  OAI22X1 U583 ( .A(n921), .B(n1265), .C(n1009), .D(n808), .Y(n568) );
  OAI22X1 U586 ( .A(n921), .B(n1264), .C(n1011), .D(n792), .Y(n638) );
  OAI22X1 U587 ( .A(n1011), .B(n793), .C(n1264), .D(n792), .Y(n639) );
  OAI22X1 U588 ( .A(n1265), .B(n794), .C(n1009), .D(n793), .Y(n640) );
  OAI22X1 U589 ( .A(n1011), .B(n795), .C(n1264), .D(n794), .Y(n641) );
  OAI22X1 U590 ( .A(n1265), .B(n796), .C(n1009), .D(n795), .Y(n642) );
  OAI22X1 U591 ( .A(n1010), .B(n797), .C(n1264), .D(n796), .Y(n643) );
  OAI22X1 U592 ( .A(n1265), .B(n798), .C(n1008), .D(n797), .Y(n644) );
  OAI22X1 U593 ( .A(n1265), .B(n799), .C(n1264), .D(n798), .Y(n645) );
  OAI22X1 U594 ( .A(n1011), .B(n800), .C(n1009), .D(n799), .Y(n646) );
  OAI22X1 U595 ( .A(n1265), .B(n801), .C(n1264), .D(n800), .Y(n647) );
  OAI22X1 U596 ( .A(n1010), .B(n802), .C(n1008), .D(n801), .Y(n648) );
  OAI22X1 U597 ( .A(n1265), .B(n803), .C(n1264), .D(n802), .Y(n649) );
  OAI22X1 U598 ( .A(n1011), .B(n804), .C(n1009), .D(n803), .Y(n650) );
  OAI22X1 U599 ( .A(n1265), .B(n805), .C(n1264), .D(n804), .Y(n651) );
  OAI22X1 U600 ( .A(n1011), .B(n806), .C(n1009), .D(n805), .Y(n652) );
  OAI22X1 U601 ( .A(n1264), .B(n806), .C(n1011), .D(n807), .Y(n653) );
  AND2X1 U602 ( .A(n1314), .B(n552), .Y(n654) );
  XNOR2X1 U604 ( .A(n877), .B(n1001), .Y(n792) );
  XNOR2X1 U605 ( .A(n1311), .B(n1001), .Y(n793) );
  XNOR2X1 U606 ( .A(n1309), .B(n1002), .Y(n794) );
  XNOR2X1 U607 ( .A(n1307), .B(n1002), .Y(n795) );
  XNOR2X1 U608 ( .A(n1305), .B(n1001), .Y(n796) );
  XNOR2X1 U609 ( .A(n882), .B(n1188), .Y(n797) );
  XNOR2X1 U610 ( .A(n883), .B(n1188), .Y(n798) );
  XNOR2X1 U611 ( .A(n1301), .B(n1188), .Y(n799) );
  XNOR2X1 U612 ( .A(n1299), .B(n1001), .Y(n800) );
  XNOR2X1 U613 ( .A(n1297), .B(n1188), .Y(n801) );
  XNOR2X1 U614 ( .A(n887), .B(n1000), .Y(n802) );
  XNOR2X1 U615 ( .A(n1295), .B(n1001), .Y(n803) );
  XNOR2X1 U616 ( .A(n1293), .B(n1188), .Y(n804) );
  XNOR2X1 U617 ( .A(n890), .B(n1000), .Y(n805) );
  XNOR2X1 U618 ( .A(n1291), .B(n1002), .Y(n806) );
  XNOR2X1 U619 ( .A(n1313), .B(n1002), .Y(n807) );
  OAI22X1 U622 ( .A(n922), .B(n1261), .C(n1257), .D(n825), .Y(n569) );
  OAI22X1 U625 ( .A(n922), .B(n1258), .C(n1260), .D(n809), .Y(n656) );
  OAI22X1 U626 ( .A(n1261), .B(n810), .C(n1258), .D(n809), .Y(n657) );
  OAI22X1 U627 ( .A(n1261), .B(n811), .C(n1257), .D(n810), .Y(n658) );
  OAI22X1 U628 ( .A(n1260), .B(n812), .C(n1258), .D(n811), .Y(n659) );
  OAI22X1 U629 ( .A(n1260), .B(n813), .C(n1257), .D(n812), .Y(n660) );
  OAI22X1 U630 ( .A(n1260), .B(n814), .C(n1258), .D(n813), .Y(n661) );
  OAI22X1 U631 ( .A(n1260), .B(n815), .C(n1257), .D(n814), .Y(n662) );
  OAI22X1 U632 ( .A(n1260), .B(n816), .C(n1258), .D(n815), .Y(n663) );
  OAI22X1 U633 ( .A(n1260), .B(n817), .C(n1257), .D(n816), .Y(n664) );
  OAI22X1 U634 ( .A(n1261), .B(n818), .C(n1258), .D(n817), .Y(n665) );
  OAI22X1 U635 ( .A(n1261), .B(n819), .C(n1257), .D(n818), .Y(n666) );
  OAI22X1 U636 ( .A(n1261), .B(n820), .C(n1258), .D(n819), .Y(n667) );
  OAI22X1 U637 ( .A(n1261), .B(n821), .C(n1257), .D(n820), .Y(n668) );
  OAI22X1 U638 ( .A(n1261), .B(n822), .C(n1258), .D(n821), .Y(n669) );
  OAI22X1 U639 ( .A(n1261), .B(n823), .C(n1257), .D(n822), .Y(n670) );
  OAI22X1 U640 ( .A(n1258), .B(n823), .C(n1261), .D(n824), .Y(n671) );
  AND2X1 U641 ( .A(n1314), .B(n1068), .Y(n672) );
  XNOR2X1 U643 ( .A(n877), .B(n1006), .Y(n809) );
  XNOR2X1 U644 ( .A(n1311), .B(n1007), .Y(n810) );
  XNOR2X1 U645 ( .A(n1309), .B(n1149), .Y(n811) );
  XNOR2X1 U646 ( .A(n1307), .B(n1006), .Y(n812) );
  XNOR2X1 U647 ( .A(n1305), .B(n1149), .Y(n813) );
  XNOR2X1 U649 ( .A(n883), .B(n1149), .Y(n815) );
  XNOR2X1 U650 ( .A(n1301), .B(n1006), .Y(n816) );
  XNOR2X1 U651 ( .A(n1299), .B(n1007), .Y(n817) );
  XNOR2X1 U652 ( .A(n1297), .B(n1007), .Y(n818) );
  XNOR2X1 U653 ( .A(n887), .B(n1149), .Y(n819) );
  XNOR2X1 U654 ( .A(n1295), .B(n1149), .Y(n820) );
  XNOR2X1 U655 ( .A(n1293), .B(n1006), .Y(n821) );
  XNOR2X1 U656 ( .A(n890), .B(n1007), .Y(n822) );
  XNOR2X1 U657 ( .A(n1291), .B(n1007), .Y(n823) );
  XNOR2X1 U658 ( .A(n1313), .B(n1007), .Y(n824) );
  OR2X1 U659 ( .A(n1313), .B(n922), .Y(n825) );
  OAI22X1 U661 ( .A(n923), .B(n1255), .C(n1126), .D(n842), .Y(n570) );
  OAI22X1 U664 ( .A(n923), .B(n1126), .C(n1256), .D(n826), .Y(n674) );
  OAI22X1 U665 ( .A(n1256), .B(n827), .C(n1126), .D(n826), .Y(n675) );
  OAI22X1 U666 ( .A(n1255), .B(n828), .C(n1126), .D(n827), .Y(n676) );
  OAI22X1 U667 ( .A(n1256), .B(n829), .C(n1126), .D(n828), .Y(n677) );
  OAI22X1 U668 ( .A(n1255), .B(n830), .C(n1126), .D(n829), .Y(n678) );
  OAI22X1 U669 ( .A(n1256), .B(n831), .C(n1126), .D(n830), .Y(n679) );
  OAI22X1 U670 ( .A(n1255), .B(n832), .C(n1126), .D(n831), .Y(n680) );
  OAI22X1 U671 ( .A(n1255), .B(n833), .C(n1126), .D(n832), .Y(n681) );
  OAI22X1 U672 ( .A(n1256), .B(n834), .C(n1126), .D(n833), .Y(n682) );
  OAI22X1 U673 ( .A(n1255), .B(n835), .C(n1126), .D(n834), .Y(n683) );
  OAI22X1 U674 ( .A(n1256), .B(n836), .C(n1126), .D(n835), .Y(n684) );
  OAI22X1 U675 ( .A(n1255), .B(n837), .C(n1126), .D(n836), .Y(n685) );
  OAI22X1 U676 ( .A(n1256), .B(n838), .C(n1126), .D(n837), .Y(n686) );
  OAI22X1 U677 ( .A(n1255), .B(n839), .C(n1126), .D(n838), .Y(n687) );
  OAI22X1 U678 ( .A(n1256), .B(n840), .C(n1126), .D(n839), .Y(n688) );
  OAI22X1 U679 ( .A(n1126), .B(n840), .C(n1256), .D(n841), .Y(n689) );
  AND2X1 U680 ( .A(n1314), .B(n1125), .Y(n690) );
  XNOR2X1 U682 ( .A(n877), .B(n1187), .Y(n826) );
  XNOR2X1 U683 ( .A(n1311), .B(n1187), .Y(n827) );
  XNOR2X1 U684 ( .A(n1309), .B(n1186), .Y(n828) );
  XNOR2X1 U685 ( .A(n1307), .B(n1186), .Y(n829) );
  XNOR2X1 U687 ( .A(n882), .B(n1186), .Y(n831) );
  XNOR2X1 U688 ( .A(n883), .B(n1187), .Y(n832) );
  XNOR2X1 U689 ( .A(n1301), .B(n1187), .Y(n833) );
  XNOR2X1 U690 ( .A(n1299), .B(n1187), .Y(n834) );
  XNOR2X1 U691 ( .A(n1297), .B(n1060), .Y(n835) );
  XNOR2X1 U692 ( .A(n887), .B(n1060), .Y(n836) );
  XNOR2X1 U693 ( .A(n1295), .B(n1060), .Y(n837) );
  XNOR2X1 U694 ( .A(n1293), .B(n1060), .Y(n838) );
  XNOR2X1 U695 ( .A(n890), .B(n1060), .Y(n839) );
  XNOR2X1 U696 ( .A(n1291), .B(n1060), .Y(n840) );
  XNOR2X1 U697 ( .A(n1313), .B(n1060), .Y(n841) );
  OR2X1 U698 ( .A(n1313), .B(n923), .Y(n842) );
  OAI22X1 U700 ( .A(n924), .B(n1252), .C(n1251), .D(n859), .Y(n571) );
  OAI22X1 U703 ( .A(n924), .B(n1251), .C(n1253), .D(n843), .Y(n692) );
  OAI22X1 U704 ( .A(n1253), .B(n844), .C(n1251), .D(n843), .Y(n693) );
  OAI22X1 U705 ( .A(n1252), .B(n845), .C(n1251), .D(n844), .Y(n694) );
  OAI22X1 U706 ( .A(n1253), .B(n846), .C(n1251), .D(n845), .Y(n695) );
  OAI22X1 U707 ( .A(n1252), .B(n847), .C(n1251), .D(n846), .Y(n696) );
  OAI22X1 U708 ( .A(n1253), .B(n848), .C(n1251), .D(n847), .Y(n697) );
  OAI22X1 U709 ( .A(n1252), .B(n849), .C(n1251), .D(n848), .Y(n698) );
  OAI22X1 U710 ( .A(n1252), .B(n850), .C(n1251), .D(n849), .Y(n699) );
  OAI22X1 U711 ( .A(n1253), .B(n851), .C(n1251), .D(n850), .Y(n700) );
  OAI22X1 U712 ( .A(n1252), .B(n852), .C(n1251), .D(n851), .Y(n701) );
  OAI22X1 U713 ( .A(n1116), .B(n853), .C(n1251), .D(n852), .Y(n702) );
  OAI22X1 U714 ( .A(n1252), .B(n854), .C(n1251), .D(n853), .Y(n703) );
  OAI22X1 U715 ( .A(n1116), .B(n855), .C(n1251), .D(n854), .Y(n704) );
  OAI22X1 U716 ( .A(n1252), .B(n856), .C(n1251), .D(n855), .Y(n705) );
  OAI22X1 U717 ( .A(n1116), .B(n857), .C(n1251), .D(n856), .Y(n706) );
  OAI22X1 U718 ( .A(n1251), .B(n857), .C(n1116), .D(n858), .Y(n707) );
  AND2X1 U719 ( .A(n1314), .B(n1250), .Y(n708) );
  XNOR2X1 U721 ( .A(n877), .B(n1281), .Y(n843) );
  XNOR2X1 U722 ( .A(n1311), .B(n1281), .Y(n844) );
  XNOR2X1 U723 ( .A(n1309), .B(n1281), .Y(n845) );
  XNOR2X1 U724 ( .A(n1307), .B(n1281), .Y(n846) );
  XNOR2X1 U725 ( .A(n1305), .B(n1281), .Y(n847) );
  XNOR2X1 U726 ( .A(n882), .B(n1281), .Y(n848) );
  XNOR2X1 U727 ( .A(n883), .B(n1281), .Y(n849) );
  XNOR2X1 U728 ( .A(n1301), .B(n1281), .Y(n850) );
  XNOR2X1 U729 ( .A(n1299), .B(n1281), .Y(n851) );
  XNOR2X1 U730 ( .A(n1297), .B(n1224), .Y(n852) );
  XNOR2X1 U731 ( .A(n887), .B(n1224), .Y(n853) );
  XNOR2X1 U732 ( .A(n1295), .B(n1224), .Y(n854) );
  XNOR2X1 U733 ( .A(n1293), .B(n1224), .Y(n855) );
  XNOR2X1 U734 ( .A(n890), .B(n1224), .Y(n856) );
  XNOR2X1 U735 ( .A(n1291), .B(n1224), .Y(n857) );
  XNOR2X1 U736 ( .A(n1313), .B(n1224), .Y(n858) );
  OR2X1 U737 ( .A(n1313), .B(n924), .Y(n859) );
  OAI22X1 U739 ( .A(n925), .B(n1249), .C(n917), .D(n876), .Y(n572) );
  OAI22X1 U742 ( .A(n917), .B(n925), .C(n1249), .D(n860), .Y(n710) );
  OAI22X1 U743 ( .A(n1249), .B(n861), .C(n917), .D(n860), .Y(n711) );
  OAI22X1 U744 ( .A(n1249), .B(n862), .C(n917), .D(n861), .Y(n712) );
  OAI22X1 U745 ( .A(n1249), .B(n863), .C(n917), .D(n862), .Y(n713) );
  OAI22X1 U746 ( .A(n1249), .B(n864), .C(n917), .D(n863), .Y(n714) );
  OAI22X1 U747 ( .A(n1249), .B(n865), .C(n917), .D(n864), .Y(n715) );
  OAI22X1 U748 ( .A(n1249), .B(n866), .C(n917), .D(n865), .Y(n716) );
  OAI22X1 U749 ( .A(n1249), .B(n867), .C(n917), .D(n866), .Y(n717) );
  OAI22X1 U750 ( .A(n1249), .B(n868), .C(n917), .D(n867), .Y(n718) );
  OAI22X1 U751 ( .A(n1249), .B(n869), .C(n917), .D(n868), .Y(n719) );
  OAI22X1 U752 ( .A(n1249), .B(n870), .C(n917), .D(n869), .Y(n720) );
  OAI22X1 U753 ( .A(n1249), .B(n871), .C(n917), .D(n870), .Y(n721) );
  OAI22X1 U754 ( .A(n1249), .B(n872), .C(n917), .D(n871), .Y(n722) );
  OAI22X1 U755 ( .A(n1249), .B(n873), .C(n917), .D(n872), .Y(n723) );
  OAI22X1 U756 ( .A(n1249), .B(n874), .C(n917), .D(n873), .Y(n724) );
  OAI22X1 U757 ( .A(n917), .B(n874), .C(n1249), .D(n875), .Y(n725) );
  XNOR2X1 U758 ( .A(n877), .B(n1279), .Y(n860) );
  XNOR2X1 U759 ( .A(n1311), .B(n1279), .Y(n861) );
  XNOR2X1 U760 ( .A(n1309), .B(n1279), .Y(n862) );
  XNOR2X1 U761 ( .A(n1307), .B(n1279), .Y(n863) );
  XNOR2X1 U762 ( .A(n1305), .B(n1279), .Y(n864) );
  XNOR2X1 U763 ( .A(n882), .B(n1279), .Y(n865) );
  XNOR2X1 U764 ( .A(n883), .B(n1279), .Y(n866) );
  XNOR2X1 U765 ( .A(n1301), .B(n1279), .Y(n867) );
  XNOR2X1 U766 ( .A(n1299), .B(n1279), .Y(n868) );
  XNOR2X1 U767 ( .A(n1297), .B(n1183), .Y(n869) );
  XNOR2X1 U768 ( .A(n887), .B(n1183), .Y(n870) );
  XNOR2X1 U769 ( .A(n1295), .B(n1183), .Y(n871) );
  XNOR2X1 U770 ( .A(n1293), .B(n1183), .Y(n872) );
  XNOR2X1 U771 ( .A(n890), .B(n1183), .Y(n873) );
  XNOR2X1 U772 ( .A(n1291), .B(n1183), .Y(n874) );
  XNOR2X1 U773 ( .A(n1313), .B(n1183), .Y(n875) );
  OR2X1 U774 ( .A(n1313), .B(n925), .Y(n876) );
  XOR2X1 U802 ( .A(n541), .B(b[14]), .Y(n893) );
  XOR2X1 U811 ( .A(n1184), .B(b[8]), .Y(n896) );
  XNOR2X1 U812 ( .A(b[8]), .B(n19), .Y(n28) );
  XOR2X1 U817 ( .A(n1193), .B(b[4]), .Y(n898) );
  XOR2X1 U820 ( .A(n7), .B(b[2]), .Y(n899) );
  XNOR2X1 U821 ( .A(n1059), .B(b[2]), .Y(n9) );
  NAND2X1 U822 ( .A(n917), .B(n900), .Y(n6) );
  INVX2 U828 ( .A(n1149), .Y(n922) );
  BUFX4 U829 ( .A(n447), .Y(n995) );
  INVX8 U830 ( .A(n1287), .Y(n996) );
  INVX8 U831 ( .A(n996), .Y(n997) );
  INVX8 U832 ( .A(n996), .Y(n998) );
  INVX4 U833 ( .A(n878), .Y(n1310) );
  INVX4 U834 ( .A(n880), .Y(n1306) );
  BUFX2 U835 ( .A(n423), .Y(n999) );
  INVX4 U836 ( .A(n9), .Y(n1250) );
  AND2X2 U837 ( .A(n894), .B(n1268), .Y(n1082) );
  BUFX4 U838 ( .A(n1), .Y(n1059) );
  BUFX2 U839 ( .A(n1189), .Y(n1000) );
  BUFX4 U840 ( .A(n1189), .Y(n1001) );
  BUFX4 U841 ( .A(n1189), .Y(n1002) );
  BUFX2 U842 ( .A(n1184), .Y(n1189) );
  BUFX4 U843 ( .A(n465), .Y(n1003) );
  BUFX4 U844 ( .A(n489), .Y(n1004) );
  INVX4 U845 ( .A(n1148), .Y(n1005) );
  INVX8 U846 ( .A(n1005), .Y(n1006) );
  INVX8 U847 ( .A(n1005), .Y(n1007) );
  INVX1 U848 ( .A(n37), .Y(n1140) );
  INVX2 U849 ( .A(n37), .Y(n1286) );
  BUFX4 U850 ( .A(n1263), .Y(n1008) );
  BUFX4 U851 ( .A(n1263), .Y(n1009) );
  INVX1 U852 ( .A(n1262), .Y(n1263) );
  INVX4 U853 ( .A(n1214), .Y(n1255) );
  INVX4 U854 ( .A(n49), .Y(n1315) );
  INVX2 U855 ( .A(n610), .Y(n1019) );
  INVX2 U856 ( .A(n1280), .Y(n1224) );
  INVX2 U857 ( .A(n1060), .Y(n923) );
  BUFX2 U858 ( .A(n437), .Y(n1196) );
  INVX2 U859 ( .A(n1075), .Y(n1275) );
  INVX4 U860 ( .A(n1294), .Y(n1295) );
  INVX4 U861 ( .A(n1296), .Y(n1297) );
  INVX2 U862 ( .A(n886), .Y(n1296) );
  INVX2 U863 ( .A(n24), .Y(n1259) );
  INVX2 U864 ( .A(n1315), .Y(n1314) );
  INVX2 U865 ( .A(n1074), .Y(n1274) );
  INVX2 U866 ( .A(n563), .Y(n709) );
  BUFX2 U867 ( .A(n424), .Y(n1194) );
  INVX2 U868 ( .A(n1215), .Y(n1265) );
  INVX4 U869 ( .A(n1076), .Y(n1077) );
  INVX2 U870 ( .A(n420), .Y(n1127) );
  INVX2 U871 ( .A(n879), .Y(n1308) );
  INVX4 U872 ( .A(n1113), .Y(n1114) );
  INVX4 U873 ( .A(n541), .Y(n918) );
  BUFX2 U874 ( .A(n1210), .Y(n1010) );
  BUFX4 U875 ( .A(n1210), .Y(n1011) );
  INVX1 U876 ( .A(n890), .Y(n739) );
  INVX2 U877 ( .A(n1254), .Y(n1125) );
  INVX2 U878 ( .A(n36), .Y(n1266) );
  INVX2 U879 ( .A(n883), .Y(n1302) );
  INVX2 U880 ( .A(n877), .Y(n1312) );
  INVX2 U881 ( .A(n882), .Y(n1303) );
  INVX2 U882 ( .A(n1185), .Y(n920) );
  XOR2X1 U883 ( .A(n7), .B(b[4]), .Y(n1012) );
  OR2X2 U884 ( .A(n708), .B(n724), .Y(n1013) );
  INVX4 U885 ( .A(n1290), .Y(n1291) );
  AND2X2 U886 ( .A(n917), .B(n900), .Y(n1014) );
  INVX2 U887 ( .A(n13), .Y(n1192) );
  OR2X2 U888 ( .A(n308), .B(n313), .Y(n1015) );
  INVX2 U889 ( .A(n541), .Y(n1288) );
  INVX4 U890 ( .A(n881), .Y(n1304) );
  INVX4 U891 ( .A(n1199), .Y(n1200) );
  INVX2 U892 ( .A(n52), .Y(n1199) );
  INVX1 U893 ( .A(n28), .Y(n1262) );
  INVX2 U894 ( .A(n25), .Y(n1283) );
  INVX2 U895 ( .A(n7), .Y(n1280) );
  INVX4 U896 ( .A(n1298), .Y(n1299) );
  INVX2 U897 ( .A(n885), .Y(n1298) );
  INVX4 U898 ( .A(n1300), .Y(n1301) );
  INVX2 U899 ( .A(n884), .Y(n1300) );
  INVX4 U900 ( .A(n1292), .Y(n1293) );
  INVX2 U901 ( .A(n889), .Y(n1292) );
  AND2X2 U902 ( .A(n708), .B(n724), .Y(n1016) );
  INVX2 U903 ( .A(n1271), .Y(n1273) );
  INVX2 U904 ( .A(n1272), .Y(n1113) );
  OR2X2 U905 ( .A(n292), .B(n293), .Y(n1017) );
  INVX4 U906 ( .A(n1276), .Y(n1018) );
  INVX2 U907 ( .A(n1276), .Y(n1277) );
  INVX2 U908 ( .A(n51), .Y(n1276) );
  XOR2X1 U909 ( .A(n1286), .B(n1020), .Y(n894) );
  XNOR2X1 U910 ( .A(n397), .B(n1019), .Y(n1078) );
  INVX1 U911 ( .A(n161), .Y(n282) );
  XNOR2X1 U912 ( .A(n474), .B(n1021), .Y(n1085) );
  INVX2 U913 ( .A(n1021), .Y(n1022) );
  INVX2 U914 ( .A(b[12]), .Y(n1020) );
  INVX2 U915 ( .A(n483), .Y(n1021) );
  OR2X2 U916 ( .A(n1313), .B(n918), .Y(n757) );
  XOR2X1 U917 ( .A(n1304), .B(n1186), .Y(n830) );
  XOR2X1 U918 ( .A(n1292), .B(n997), .Y(n770) );
  INVX2 U919 ( .A(n1074), .Y(n1023) );
  XOR2X1 U920 ( .A(n1024), .B(n408), .Y(n404) );
  XNOR2X1 U921 ( .A(n419), .B(n1097), .Y(n1024) );
  XNOR2X1 U922 ( .A(n434), .B(n1037), .Y(n1106) );
  INVX2 U923 ( .A(n1037), .Y(n1038) );
  XOR2X1 U924 ( .A(n695), .B(n631), .Y(n1025) );
  XOR2X1 U925 ( .A(n599), .B(n1025), .Y(n454) );
  NAND2X1 U926 ( .A(n599), .B(n695), .Y(n1026) );
  NAND2X1 U927 ( .A(n599), .B(n631), .Y(n1027) );
  NAND2X1 U928 ( .A(n695), .B(n631), .Y(n1028) );
  NAND3X1 U929 ( .A(n1027), .B(n1026), .C(n1028), .Y(n453) );
  INVX1 U930 ( .A(n104), .Y(n102) );
  OR2X2 U931 ( .A(n1313), .B(n921), .Y(n808) );
  INVX2 U932 ( .A(n1188), .Y(n921) );
  INVX1 U933 ( .A(n211), .Y(n209) );
  XOR2X1 U934 ( .A(n629), .B(n693), .Y(n1029) );
  XOR2X1 U935 ( .A(n1029), .B(n597), .Y(n426) );
  XOR2X1 U936 ( .A(n1194), .B(n439), .Y(n1030) );
  XOR2X1 U937 ( .A(n1030), .B(n426), .Y(n420) );
  NAND2X1 U938 ( .A(n629), .B(n693), .Y(n1031) );
  NAND2X1 U939 ( .A(n629), .B(n597), .Y(n1032) );
  NAND2X1 U940 ( .A(n693), .B(n597), .Y(n1033) );
  NAND3X1 U941 ( .A(n1031), .B(n1032), .C(n1033), .Y(n425) );
  NAND2X1 U942 ( .A(n1194), .B(n439), .Y(n1034) );
  NAND2X1 U943 ( .A(n1194), .B(n426), .Y(n1035) );
  NAND2X1 U944 ( .A(n439), .B(n426), .Y(n1036) );
  NAND3X1 U945 ( .A(n1034), .B(n1035), .C(n1036), .Y(n419) );
  INVX2 U946 ( .A(n445), .Y(n1037) );
  INVX1 U947 ( .A(n183), .Y(n181) );
  INVX8 U948 ( .A(n1315), .Y(n1313) );
  XOR2X1 U949 ( .A(n1303), .B(n1149), .Y(n814) );
  BUFX4 U950 ( .A(n53), .Y(n1039) );
  BUFX2 U951 ( .A(n53), .Y(n1198) );
  XNOR2X1 U952 ( .A(n887), .B(n1185), .Y(n1040) );
  INVX4 U953 ( .A(n1082), .Y(n1270) );
  INVX8 U954 ( .A(n1288), .Y(n1289) );
  NOR2X1 U955 ( .A(n457), .B(n444), .Y(n1041) );
  XOR2X1 U956 ( .A(n464), .B(n468), .Y(n1042) );
  XOR2X1 U957 ( .A(n473), .B(n1042), .Y(n460) );
  NAND2X1 U958 ( .A(n473), .B(n464), .Y(n1043) );
  NAND2X1 U959 ( .A(n473), .B(n468), .Y(n1044) );
  NAND2X1 U960 ( .A(n464), .B(n468), .Y(n1045) );
  NAND3X1 U961 ( .A(n1044), .B(n1043), .C(n1045), .Y(n459) );
  OR2X2 U962 ( .A(n1313), .B(n920), .Y(n791) );
  INVX2 U963 ( .A(n1271), .Y(n1272) );
  INVX2 U964 ( .A(n46), .Y(n1271) );
  AND2X2 U965 ( .A(n1314), .B(n549), .Y(n636) );
  XOR2X1 U966 ( .A(n1284), .B(b[10]), .Y(n1115) );
  NOR2X1 U967 ( .A(n401), .B(n388), .Y(n1046) );
  XOR2X1 U968 ( .A(n427), .B(n425), .Y(n1047) );
  XOR2X1 U969 ( .A(n414), .B(n1047), .Y(n408) );
  NAND2X1 U970 ( .A(n414), .B(n427), .Y(n1048) );
  NAND2X1 U971 ( .A(n414), .B(n425), .Y(n1049) );
  NAND2X1 U972 ( .A(n427), .B(n425), .Y(n1050) );
  NAND3X1 U973 ( .A(n1049), .B(n1048), .C(n1050), .Y(n407) );
  INVX2 U974 ( .A(n1268), .Y(n1076) );
  INVX2 U975 ( .A(n1180), .Y(n1268) );
  XNOR2X1 U976 ( .A(n1051), .B(n995), .Y(n432) );
  XNOR2X1 U977 ( .A(n436), .B(n449), .Y(n1051) );
  INVX4 U978 ( .A(n1083), .Y(n1269) );
  INVX2 U979 ( .A(n174), .Y(n1052) );
  XOR2X1 U980 ( .A(n396), .B(n398), .Y(n1053) );
  XOR2X1 U981 ( .A(n400), .B(n1053), .Y(n392) );
  NAND2X1 U982 ( .A(n400), .B(n396), .Y(n1054) );
  NAND2X1 U983 ( .A(n400), .B(n398), .Y(n1055) );
  NAND2X1 U984 ( .A(n396), .B(n398), .Y(n1056) );
  NAND3X1 U985 ( .A(n1055), .B(n1054), .C(n1056), .Y(n391) );
  XNOR2X1 U986 ( .A(n73), .B(n1057), .Y(product[46]) );
  AND2X2 U987 ( .A(n72), .B(n1017), .Y(n1057) );
  INVX2 U988 ( .A(n1012), .Y(n1254) );
  INVX1 U989 ( .A(n28), .Y(n1058) );
  INVX2 U990 ( .A(n1), .Y(n1278) );
  INVX2 U991 ( .A(n560), .Y(n691) );
  BUFX4 U992 ( .A(n1193), .Y(n1060) );
  INVX2 U993 ( .A(n1192), .Y(n1193) );
  INVX1 U994 ( .A(n182), .Y(n285) );
  XOR2X1 U995 ( .A(n459), .B(n448), .Y(n1061) );
  XOR2X1 U996 ( .A(n446), .B(n1061), .Y(n444) );
  NAND2X1 U997 ( .A(n446), .B(n459), .Y(n1062) );
  NAND2X1 U998 ( .A(n446), .B(n448), .Y(n1063) );
  NAND2X1 U999 ( .A(n459), .B(n448), .Y(n1064) );
  NAND3X1 U1000 ( .A(n1063), .B(n1062), .C(n1064), .Y(n443) );
  BUFX2 U1001 ( .A(n137), .Y(n1197) );
  INVX2 U1002 ( .A(n389), .Y(n1065) );
  INVX4 U1003 ( .A(n1065), .Y(n1066) );
  BUFX2 U1004 ( .A(n1023), .Y(n1067) );
  BUFX2 U1005 ( .A(n1179), .Y(n1068) );
  NAND2X1 U1006 ( .A(n86), .B(n1073), .Y(n1071) );
  NAND2X1 U1007 ( .A(n1069), .B(n1070), .Y(n1072) );
  NAND2X1 U1008 ( .A(n1071), .B(n1072), .Y(product[45]) );
  INVX1 U1009 ( .A(n86), .Y(n1069) );
  INVX2 U1010 ( .A(n1073), .Y(n1070) );
  AND2X2 U1011 ( .A(n85), .B(n275), .Y(n1073) );
  AND2X2 U1012 ( .A(n1273), .B(n893), .Y(n1074) );
  AND2X2 U1013 ( .A(n1273), .B(n893), .Y(n1075) );
  INVX2 U1014 ( .A(n19), .Y(n1282) );
  BUFX4 U1015 ( .A(n36), .Y(n1201) );
  XOR2X1 U1016 ( .A(n399), .B(n1078), .Y(n380) );
  NAND2X1 U1017 ( .A(n397), .B(n399), .Y(n1079) );
  NAND2X1 U1018 ( .A(n399), .B(n610), .Y(n1080) );
  NAND2X1 U1019 ( .A(n397), .B(n610), .Y(n1081) );
  NAND3X1 U1020 ( .A(n1080), .B(n1079), .C(n1081), .Y(n379) );
  AND2X2 U1021 ( .A(n894), .B(n1268), .Y(n1083) );
  XOR2X1 U1022 ( .A(n476), .B(n478), .Y(n1084) );
  XOR2X1 U1023 ( .A(n1084), .B(n485), .Y(n472) );
  XOR2X1 U1024 ( .A(n1085), .B(n472), .Y(n470) );
  NAND2X1 U1025 ( .A(n476), .B(n478), .Y(n1086) );
  NAND2X1 U1026 ( .A(n476), .B(n485), .Y(n1087) );
  NAND2X1 U1027 ( .A(n478), .B(n485), .Y(n1088) );
  NAND3X1 U1028 ( .A(n1086), .B(n1087), .C(n1088), .Y(n471) );
  NAND2X1 U1029 ( .A(n474), .B(n1022), .Y(n1089) );
  NAND2X1 U1030 ( .A(n474), .B(n472), .Y(n1090) );
  NAND2X1 U1031 ( .A(n1022), .B(n472), .Y(n1091) );
  NAND3X1 U1032 ( .A(n1089), .B(n1090), .C(n1091), .Y(n469) );
  INVX2 U1033 ( .A(n891), .Y(n1290) );
  XOR2X1 U1034 ( .A(n403), .B(n392), .Y(n1092) );
  XOR2X1 U1035 ( .A(n390), .B(n1092), .Y(n388) );
  NAND2X1 U1036 ( .A(n390), .B(n403), .Y(n1093) );
  NAND2X1 U1037 ( .A(n390), .B(n392), .Y(n1094) );
  NAND2X1 U1038 ( .A(n403), .B(n392), .Y(n1095) );
  NAND3X1 U1039 ( .A(n1094), .B(n1093), .C(n1095), .Y(n387) );
  AND2X2 U1040 ( .A(n9), .B(n899), .Y(n1096) );
  INVX4 U1041 ( .A(n1014), .Y(n1249) );
  INVX4 U1042 ( .A(n1259), .Y(n1260) );
  INVX4 U1043 ( .A(n1259), .Y(n1261) );
  INVX2 U1044 ( .A(n421), .Y(n1097) );
  XOR2X1 U1045 ( .A(n359), .B(n577), .Y(n1098) );
  XOR2X1 U1046 ( .A(n1098), .B(n623), .Y(n348) );
  NAND2X1 U1047 ( .A(n359), .B(n577), .Y(n1099) );
  NAND2X1 U1048 ( .A(n623), .B(n359), .Y(n1100) );
  NAND2X1 U1049 ( .A(n577), .B(n623), .Y(n1101) );
  NAND3X1 U1050 ( .A(n1099), .B(n1100), .C(n1101), .Y(n347) );
  XOR2X1 U1051 ( .A(n606), .B(n590), .Y(n1102) );
  XOR2X1 U1052 ( .A(n1102), .B(n347), .Y(n334) );
  NAND2X1 U1053 ( .A(n606), .B(n590), .Y(n1103) );
  NAND2X1 U1054 ( .A(n606), .B(n347), .Y(n1104) );
  NAND2X1 U1055 ( .A(n590), .B(n347), .Y(n1105) );
  NAND3X1 U1056 ( .A(n1103), .B(n1104), .C(n1105), .Y(n333) );
  XOR2X1 U1057 ( .A(n1106), .B(n432), .Y(n430) );
  NAND2X1 U1058 ( .A(n436), .B(n449), .Y(n1107) );
  NAND2X1 U1059 ( .A(n436), .B(n995), .Y(n1108) );
  NAND2X1 U1060 ( .A(n449), .B(n995), .Y(n1109) );
  NAND3X1 U1061 ( .A(n1109), .B(n1108), .C(n1107), .Y(n431) );
  NAND2X1 U1062 ( .A(n434), .B(n1038), .Y(n1110) );
  NAND2X1 U1063 ( .A(n434), .B(n432), .Y(n1111) );
  NAND2X1 U1064 ( .A(n1038), .B(n432), .Y(n1112) );
  NAND3X1 U1065 ( .A(n1110), .B(n1111), .C(n1112), .Y(n429) );
  INVX4 U1066 ( .A(n1284), .Y(n1285) );
  INVX2 U1067 ( .A(n1284), .Y(n1185) );
  INVX4 U1068 ( .A(n31), .Y(n1284) );
  OR2X2 U1069 ( .A(n1182), .B(n1115), .Y(n36) );
  BUFX2 U1070 ( .A(n1253), .Y(n1116) );
  XOR2X1 U1071 ( .A(n395), .B(n384), .Y(n1117) );
  XOR2X1 U1072 ( .A(n1117), .B(n382), .Y(n378) );
  NAND2X1 U1073 ( .A(n395), .B(n384), .Y(n1118) );
  NAND2X1 U1074 ( .A(n395), .B(n382), .Y(n1119) );
  NAND2X1 U1075 ( .A(n384), .B(n382), .Y(n1120) );
  NAND3X1 U1076 ( .A(n1118), .B(n1119), .C(n1120), .Y(n377) );
  XOR2X1 U1077 ( .A(n368), .B(n379), .Y(n1121) );
  XOR2X1 U1078 ( .A(n1121), .B(n377), .Y(n364) );
  NAND2X1 U1079 ( .A(n368), .B(n379), .Y(n1122) );
  NAND2X1 U1080 ( .A(n368), .B(n377), .Y(n1123) );
  NAND2X1 U1081 ( .A(n379), .B(n377), .Y(n1124) );
  NAND3X1 U1082 ( .A(n1122), .B(n1123), .C(n1124), .Y(n363) );
  INVX8 U1083 ( .A(n1125), .Y(n1126) );
  INVX1 U1084 ( .A(n128), .Y(n126) );
  AND2X2 U1085 ( .A(n1314), .B(n1289), .Y(n582) );
  INVX2 U1086 ( .A(n1262), .Y(n1264) );
  INVX4 U1087 ( .A(n1278), .Y(n1279) );
  INVX1 U1088 ( .A(n1008), .Y(n552) );
  XNOR2X1 U1089 ( .A(n1127), .B(n431), .Y(n1129) );
  XOR2X1 U1090 ( .A(n435), .B(n422), .Y(n1128) );
  XOR2X1 U1091 ( .A(n1128), .B(n433), .Y(n418) );
  XOR2X1 U1092 ( .A(n1129), .B(n418), .Y(n416) );
  NAND2X1 U1093 ( .A(n435), .B(n422), .Y(n1130) );
  NAND2X1 U1094 ( .A(n435), .B(n433), .Y(n1131) );
  NAND2X1 U1095 ( .A(n422), .B(n433), .Y(n1132) );
  NAND3X1 U1096 ( .A(n1130), .B(n1131), .C(n1132), .Y(n417) );
  NAND2X1 U1097 ( .A(n420), .B(n431), .Y(n1133) );
  NAND2X1 U1098 ( .A(n420), .B(n418), .Y(n1134) );
  NAND2X1 U1099 ( .A(n431), .B(n418), .Y(n1135) );
  NAND3X1 U1100 ( .A(n1133), .B(n1134), .C(n1135), .Y(n415) );
  OR2X2 U1101 ( .A(n1136), .B(n1179), .Y(n24) );
  XNOR2X1 U1102 ( .A(n19), .B(b[6]), .Y(n1136) );
  INVX2 U1103 ( .A(n1179), .Y(n1258) );
  INVX4 U1104 ( .A(n1181), .Y(n1253) );
  INVX4 U1105 ( .A(n1280), .Y(n1281) );
  INVX4 U1106 ( .A(n1096), .Y(n1252) );
  INVX1 U1107 ( .A(n222), .Y(n221) );
  NAND2X1 U1108 ( .A(n408), .B(n419), .Y(n1137) );
  NAND2X1 U1109 ( .A(n408), .B(n421), .Y(n1138) );
  NAND2X1 U1110 ( .A(n419), .B(n421), .Y(n1139) );
  NAND3X1 U1111 ( .A(n1138), .B(n1137), .C(n1139), .Y(n403) );
  NAND2X1 U1112 ( .A(n37), .B(b[14]), .Y(n1142) );
  NAND2X1 U1113 ( .A(n1140), .B(n1141), .Y(n1143) );
  NAND2X1 U1114 ( .A(n1142), .B(n1143), .Y(n46) );
  INVX1 U1115 ( .A(b[14]), .Y(n1141) );
  XOR2X1 U1116 ( .A(n380), .B(n393), .Y(n1144) );
  XOR2X1 U1117 ( .A(n391), .B(n1144), .Y(n376) );
  NAND2X1 U1118 ( .A(n391), .B(n380), .Y(n1145) );
  NAND2X1 U1119 ( .A(n391), .B(n393), .Y(n1146) );
  NAND2X1 U1120 ( .A(n380), .B(n393), .Y(n1147) );
  NAND3X1 U1121 ( .A(n1146), .B(n1145), .C(n1147), .Y(n375) );
  INVX4 U1122 ( .A(n1282), .Y(n1148) );
  INVX4 U1123 ( .A(n1282), .Y(n1149) );
  NOR2X1 U1124 ( .A(n429), .B(n416), .Y(n1150) );
  XOR2X1 U1125 ( .A(n367), .B(n356), .Y(n1151) );
  XOR2X1 U1126 ( .A(n365), .B(n1151), .Y(n352) );
  NAND2X1 U1127 ( .A(n365), .B(n367), .Y(n1152) );
  NAND2X1 U1128 ( .A(n365), .B(n356), .Y(n1153) );
  NAND2X1 U1129 ( .A(n367), .B(n356), .Y(n1154) );
  NAND3X1 U1130 ( .A(n1153), .B(n1152), .C(n1154), .Y(n351) );
  INVX2 U1131 ( .A(n283), .Y(n1155) );
  XOR2X1 U1132 ( .A(n456), .B(n647), .Y(n1156) );
  XOR2X1 U1133 ( .A(n467), .B(n1156), .Y(n450) );
  NAND2X1 U1134 ( .A(n467), .B(n456), .Y(n1157) );
  NAND2X1 U1135 ( .A(n467), .B(n647), .Y(n1158) );
  NAND2X1 U1136 ( .A(n456), .B(n647), .Y(n1159) );
  NAND3X1 U1137 ( .A(n1158), .B(n1157), .C(n1159), .Y(n449) );
  INVX2 U1138 ( .A(n1266), .Y(n1160) );
  INVX2 U1139 ( .A(n287), .Y(n1161) );
  OR2X2 U1140 ( .A(n137), .B(n80), .Y(n1163) );
  OR2X2 U1141 ( .A(n481), .B(n470), .Y(n1165) );
  OR2X2 U1142 ( .A(n322), .B(n329), .Y(n1164) );
  XOR2X1 U1143 ( .A(n1162), .B(n370), .Y(n366) );
  XOR2X1 U1144 ( .A(n383), .B(n381), .Y(n1162) );
  OR2X2 U1145 ( .A(n302), .B(n307), .Y(n1169) );
  INVX1 U1146 ( .A(n1309), .Y(n728) );
  INVX1 U1147 ( .A(n918), .Y(n1176) );
  AND2X1 U1148 ( .A(n572), .B(n725), .Y(n1178) );
  INVX4 U1149 ( .A(n1283), .Y(n1184) );
  INVX1 U1150 ( .A(n918), .Y(n1177) );
  AND2X2 U1151 ( .A(n491), .B(n482), .Y(n1166) );
  OR2X1 U1152 ( .A(n491), .B(n482), .Y(n1167) );
  AND2X2 U1153 ( .A(n481), .B(n470), .Y(n1168) );
  OR2X1 U1154 ( .A(n533), .B(n530), .Y(n1170) );
  OR2X1 U1155 ( .A(n523), .B(n518), .Y(n1171) );
  AND2X2 U1156 ( .A(n523), .B(n518), .Y(n1172) );
  AND2X2 U1157 ( .A(n533), .B(n530), .Y(n1173) );
  INVX2 U1158 ( .A(n554), .Y(n655) );
  INVX2 U1159 ( .A(n551), .Y(n637) );
  INVX2 U1160 ( .A(n548), .Y(n619) );
  OR2X1 U1161 ( .A(n539), .B(n538), .Y(n1174) );
  AND2X2 U1162 ( .A(n539), .B(n538), .Y(n1175) );
  XNOR2X1 U1163 ( .A(n542), .B(n573), .Y(n291) );
  AND2X2 U1164 ( .A(n1176), .B(n1297), .Y(n359) );
  AND2X2 U1165 ( .A(n1177), .B(n1295), .Y(n385) );
  INVX2 U1166 ( .A(n545), .Y(n601) );
  INVX2 U1167 ( .A(n1266), .Y(n1267) );
  XNOR2X1 U1168 ( .A(n1192), .B(b[6]), .Y(n1179) );
  INVX2 U1169 ( .A(n888), .Y(n1294) );
  XNOR2X1 U1170 ( .A(n1284), .B(b[12]), .Y(n1180) );
  AND2X2 U1171 ( .A(n9), .B(n899), .Y(n1181) );
  XOR2X1 U1172 ( .A(n1184), .B(b[10]), .Y(n1182) );
  INVX2 U1173 ( .A(n1278), .Y(n1183) );
  INVX1 U1174 ( .A(n7), .Y(n924) );
  BUFX4 U1175 ( .A(n1193), .Y(n1186) );
  BUFX4 U1176 ( .A(n1193), .Y(n1187) );
  BUFX2 U1177 ( .A(n1184), .Y(n1188) );
  BUFX2 U1178 ( .A(n1212), .Y(n1190) );
  BUFX4 U1179 ( .A(n1212), .Y(n1191) );
  INVX1 U1180 ( .A(n1182), .Y(n1212) );
  INVX8 U1181 ( .A(n1286), .Y(n1287) );
  INVX1 U1182 ( .A(n213), .Y(n212) );
  INVX1 U1183 ( .A(n200), .Y(n202) );
  BUFX4 U1184 ( .A(n411), .Y(n1195) );
  INVX1 U1185 ( .A(n210), .Y(n289) );
  INVX1 U1186 ( .A(n199), .Y(n201) );
  INVX1 U1187 ( .A(n1041), .Y(n290) );
  INVX1 U1188 ( .A(n1046), .Y(n286) );
  INVX4 U1189 ( .A(n1213), .Y(n1256) );
  INVX1 U1190 ( .A(n896), .Y(n1211) );
  XOR2X1 U1191 ( .A(n612), .B(n676), .Y(n1202) );
  XOR2X1 U1192 ( .A(n1202), .B(n660), .Y(n410) );
  NAND2X1 U1193 ( .A(n676), .B(n612), .Y(n1203) );
  NAND2X1 U1194 ( .A(n676), .B(n660), .Y(n1204) );
  NAND2X1 U1195 ( .A(n612), .B(n660), .Y(n1205) );
  NAND3X1 U1196 ( .A(n1203), .B(n1204), .C(n1205), .Y(n409) );
  XOR2X1 U1197 ( .A(n413), .B(n1195), .Y(n1206) );
  XOR2X1 U1198 ( .A(n1206), .B(n409), .Y(n394) );
  NAND2X1 U1199 ( .A(n413), .B(n1195), .Y(n1207) );
  NAND2X1 U1200 ( .A(n413), .B(n409), .Y(n1208) );
  NAND2X1 U1201 ( .A(n1195), .B(n409), .Y(n1209) );
  NAND3X1 U1202 ( .A(n1207), .B(n1208), .C(n1209), .Y(n393) );
  OR2X2 U1203 ( .A(n1211), .B(n1058), .Y(n1210) );
  INVX2 U1204 ( .A(n1068), .Y(n1257) );
  AND2X2 U1205 ( .A(n898), .B(n1254), .Y(n1213) );
  AND2X2 U1206 ( .A(n898), .B(n1254), .Y(n1214) );
  AND2X2 U1207 ( .A(n896), .B(n28), .Y(n1215) );
  XOR2X1 U1208 ( .A(n428), .B(n1196), .Y(n1216) );
  XOR2X1 U1209 ( .A(n1216), .B(n441), .Y(n422) );
  NAND2X1 U1210 ( .A(n441), .B(n428), .Y(n1217) );
  NAND2X1 U1211 ( .A(n441), .B(n1196), .Y(n1218) );
  NAND2X1 U1212 ( .A(n428), .B(n1196), .Y(n1219) );
  NAND3X1 U1213 ( .A(n1218), .B(n1217), .C(n1219), .Y(n421) );
  XOR2X1 U1214 ( .A(n662), .B(n582), .Y(n1220) );
  XOR2X1 U1215 ( .A(n614), .B(n1220), .Y(n442) );
  NAND2X1 U1216 ( .A(n614), .B(n662), .Y(n1221) );
  NAND2X1 U1217 ( .A(n614), .B(n582), .Y(n1222) );
  NAND2X1 U1218 ( .A(n662), .B(n582), .Y(n1223) );
  NAND3X1 U1219 ( .A(n1222), .B(n1221), .C(n1223), .Y(n441) );
  XNOR2X1 U1220 ( .A(n1278), .B(b[0]), .Y(n900) );
  INVX1 U1221 ( .A(n37), .Y(n919) );
  XOR2X1 U1222 ( .A(n385), .B(n578), .Y(n1225) );
  XOR2X1 U1223 ( .A(n1225), .B(n641), .Y(n372) );
  XOR2X1 U1224 ( .A(n625), .B(n593), .Y(n1226) );
  XOR2X1 U1225 ( .A(n1226), .B(n372), .Y(n368) );
  NAND2X1 U1226 ( .A(n385), .B(n578), .Y(n1227) );
  NAND2X1 U1227 ( .A(n385), .B(n1233), .Y(n1228) );
  NAND2X1 U1228 ( .A(n578), .B(n1233), .Y(n1229) );
  NAND3X1 U1229 ( .A(n1227), .B(n1228), .C(n1229), .Y(n371) );
  NAND2X1 U1230 ( .A(n625), .B(n593), .Y(n1230) );
  NAND2X1 U1231 ( .A(n625), .B(n372), .Y(n1231) );
  NAND2X1 U1232 ( .A(n593), .B(n372), .Y(n1232) );
  NAND3X1 U1233 ( .A(n1230), .B(n1231), .C(n1232), .Y(n367) );
  BUFX2 U1234 ( .A(n641), .Y(n1233) );
  INVX1 U1235 ( .A(n194), .Y(n287) );
  INVX1 U1236 ( .A(n171), .Y(n173) );
  XOR2X1 U1237 ( .A(n371), .B(n369), .Y(n1234) );
  XOR2X1 U1238 ( .A(n1234), .B(n358), .Y(n354) );
  NAND2X1 U1239 ( .A(n371), .B(n369), .Y(n1235) );
  NAND2X1 U1240 ( .A(n371), .B(n358), .Y(n1236) );
  NAND2X1 U1241 ( .A(n369), .B(n358), .Y(n1237) );
  NAND3X1 U1242 ( .A(n1235), .B(n1236), .C(n1237), .Y(n353) );
  XOR2X1 U1243 ( .A(n355), .B(n346), .Y(n1238) );
  XOR2X1 U1244 ( .A(n1238), .B(n353), .Y(n342) );
  NAND2X1 U1245 ( .A(n355), .B(n346), .Y(n1239) );
  NAND2X1 U1246 ( .A(n355), .B(n353), .Y(n1240) );
  NAND2X1 U1247 ( .A(n346), .B(n353), .Y(n1241) );
  NAND3X1 U1248 ( .A(n1239), .B(n1240), .C(n1241), .Y(n341) );
  INVX1 U1249 ( .A(n1150), .Y(n288) );
  INVX1 U1250 ( .A(n177), .Y(n284) );
  INVX1 U1251 ( .A(n172), .Y(n174) );
  INVX1 U1252 ( .A(n1039), .Y(n155) );
  INVX1 U1253 ( .A(n166), .Y(n283) );
  XOR2X1 U1254 ( .A(n609), .B(n673), .Y(n1242) );
  XOR2X1 U1255 ( .A(n1242), .B(n657), .Y(n370) );
  NAND2X1 U1256 ( .A(n609), .B(n673), .Y(n1243) );
  NAND2X1 U1257 ( .A(n609), .B(n657), .Y(n1244) );
  NAND2X1 U1258 ( .A(n673), .B(n657), .Y(n1245) );
  NAND3X1 U1259 ( .A(n1243), .B(n1244), .C(n1245), .Y(n369) );
  NAND2X1 U1260 ( .A(n383), .B(n381), .Y(n1246) );
  NAND2X1 U1261 ( .A(n383), .B(n370), .Y(n1247) );
  NAND2X1 U1262 ( .A(n381), .B(n370), .Y(n1248) );
  NAND3X1 U1263 ( .A(n1246), .B(n1247), .C(n1248), .Y(n365) );
  INVX2 U1264 ( .A(n557), .Y(n673) );
  INVX8 U1265 ( .A(b[0]), .Y(n917) );
  INVX8 U1266 ( .A(n1250), .Y(n1251) );
  INVX8 U1267 ( .A(n1304), .Y(n1305) );
  INVX8 U1268 ( .A(n1306), .Y(n1307) );
  INVX8 U1269 ( .A(n1308), .Y(n1309) );
  INVX8 U1270 ( .A(n1310), .Y(n1311) );
  INVX2 U1271 ( .A(n101), .Y(n99) );
  INVX2 U1272 ( .A(n100), .Y(n98) );
  INVX2 U1273 ( .A(n94), .Y(n92) );
  INVX2 U1274 ( .A(n79), .Y(n77) );
  INVX2 U1275 ( .A(n887), .Y(n736) );
  INVX2 U1276 ( .A(n882), .Y(n731) );
  INVX2 U1277 ( .A(n1307), .Y(n729) );
  INVX2 U1278 ( .A(n1311), .Y(n727) );
  OAI22X1 U1279 ( .A(n917), .B(n925), .C(n6), .D(n925), .Y(n563) );
  INVX2 U1280 ( .A(n1059), .Y(n925) );
  OAI22X1 U1281 ( .A(n1251), .B(n924), .C(n1252), .D(n924), .Y(n560) );
  OAI22X1 U1282 ( .A(n1126), .B(n923), .C(n1255), .D(n923), .Y(n557) );
  OAI22X1 U1283 ( .A(n1257), .B(n922), .C(n1261), .D(n922), .Y(n554) );
  OAI22X1 U1284 ( .A(n1008), .B(n921), .C(n1265), .D(n921), .Y(n551) );
  INVX2 U1285 ( .A(n1191), .Y(n549) );
  OAI22X1 U1286 ( .A(n1191), .B(n920), .C(n1201), .D(n920), .Y(n548) );
  OAI22X1 U1287 ( .A(n1077), .B(n919), .C(n1270), .D(n919), .Y(n545) );
  OAI22X1 U1288 ( .A(n1114), .B(n918), .C(n1067), .D(n918), .Y(n542) );
  INVX2 U1289 ( .A(n385), .Y(n386) );
  INVX2 U1290 ( .A(n359), .Y(n360) );
  INVX2 U1291 ( .A(n337), .Y(n338) );
  INVX2 U1292 ( .A(n319), .Y(n320) );
  INVX2 U1293 ( .A(n305), .Y(n306) );
  INVX2 U1294 ( .A(n295), .Y(n296) );
  INVX2 U1295 ( .A(n130), .Y(n279) );
  INVX2 U1296 ( .A(n93), .Y(n91) );
  INVX2 U1297 ( .A(n84), .Y(n275) );
  INVX2 U1298 ( .A(n149), .Y(n151) );
  INVX2 U1299 ( .A(n148), .Y(n281) );
  INVX2 U1300 ( .A(n144), .Y(n142) );
  INVX2 U1301 ( .A(n129), .Y(n127) );
  INVX2 U1302 ( .A(n122), .Y(n120) );
  INVX2 U1303 ( .A(n111), .Y(n109) );
  INVX2 U1304 ( .A(n105), .Y(n103) );
endmodule


module alu ( src1_data, src2_data, alu_op, result, overflow );
  input [16:0] src1_data;
  input [16:0] src2_data;
  input [1:0] alu_op;
  output [16:0] result;
  output overflow;
  wire   n109, N26, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13,
         n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107;
  wire   [46:30] full_mult;
  wire   [17:0] large_sum;
  wire   [17:0] large_dif;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28, SYNOPSYS_UNCONNECTED__29;

  alu_DW01_sub_1 sub_44 ( .A({src1_data[16], src1_data[16:9], n7, n8, n9, 
        src1_data[5], n29, n15, src1_data[2:1], n30}), .B({src2_data[16], 
        src2_data[16], n24, n18, n19, src2_data[12], n13, src2_data[10], n16, 
        n22, n2, n14, src2_data[5], n1, src2_data[3:0]}), .CI(1'b0), .DIFF(
        large_dif) );
  alu_DW01_add_1 add_41 ( .A({src1_data[16], src1_data[16:9], n7, n8, n9, 
        src1_data[5], n29, src1_data[3:2], n6, n30}), .B({src2_data[16], 
        src2_data[16], n24, n18, n19, src2_data[12], n13, src2_data[10], n16, 
        n22, n2, n14, n3, n17, n5, src2_data[2], n11, src2_data[0]}), .CI(1'b0), .SUM(large_sum) );
  alu_DW_mult_uns_2 mult_35 ( .a({src1_data[15:1], n30, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), 
        .b({n24, src2_data[14:9], n22, src2_data[7:5], n1, src2_data[3:0]}), 
        .product({N26, full_mult[45:30], SYNOPSYS_UNCONNECTED__0, 
        SYNOPSYS_UNCONNECTED__1, SYNOPSYS_UNCONNECTED__2, 
        SYNOPSYS_UNCONNECTED__3, SYNOPSYS_UNCONNECTED__4, 
        SYNOPSYS_UNCONNECTED__5, SYNOPSYS_UNCONNECTED__6, 
        SYNOPSYS_UNCONNECTED__7, SYNOPSYS_UNCONNECTED__8, 
        SYNOPSYS_UNCONNECTED__9, SYNOPSYS_UNCONNECTED__10, 
        SYNOPSYS_UNCONNECTED__11, SYNOPSYS_UNCONNECTED__12, 
        SYNOPSYS_UNCONNECTED__13, SYNOPSYS_UNCONNECTED__14, 
        SYNOPSYS_UNCONNECTED__15, SYNOPSYS_UNCONNECTED__16, 
        SYNOPSYS_UNCONNECTED__17, SYNOPSYS_UNCONNECTED__18, 
        SYNOPSYS_UNCONNECTED__19, SYNOPSYS_UNCONNECTED__20, 
        SYNOPSYS_UNCONNECTED__21, SYNOPSYS_UNCONNECTED__22, 
        SYNOPSYS_UNCONNECTED__23, SYNOPSYS_UNCONNECTED__24, 
        SYNOPSYS_UNCONNECTED__25, SYNOPSYS_UNCONNECTED__26, 
        SYNOPSYS_UNCONNECTED__27, SYNOPSYS_UNCONNECTED__28, 
        SYNOPSYS_UNCONNECTED__29}) );
  INVX2 U3 ( .A(n21), .Y(n22) );
  INVX2 U4 ( .A(src2_data[15]), .Y(n23) );
  INVX2 U6 ( .A(src1_data[0]), .Y(n31) );
  BUFX4 U7 ( .A(src2_data[4]), .Y(n1) );
  INVX4 U9 ( .A(n31), .Y(n30) );
  BUFX2 U10 ( .A(src1_data[1]), .Y(n6) );
  BUFX2 U11 ( .A(src2_data[7]), .Y(n2) );
  BUFX2 U12 ( .A(src2_data[5]), .Y(n3) );
  INVX1 U13 ( .A(src2_data[3]), .Y(n4) );
  INVX2 U14 ( .A(n4), .Y(n5) );
  INVX1 U15 ( .A(src1_data[9]), .Y(n67) );
  INVX2 U16 ( .A(n62), .Y(n7) );
  INVX1 U17 ( .A(src1_data[8]), .Y(n62) );
  INVX2 U18 ( .A(n57), .Y(n8) );
  INVX1 U19 ( .A(src1_data[7]), .Y(n57) );
  INVX2 U20 ( .A(n52), .Y(n9) );
  INVX1 U21 ( .A(src1_data[6]), .Y(n52) );
  INVX1 U22 ( .A(src1_data[14]), .Y(n92) );
  INVX1 U23 ( .A(src1_data[13]), .Y(n87) );
  INVX1 U24 ( .A(src1_data[11]), .Y(n77) );
  INVX1 U25 ( .A(src1_data[10]), .Y(n72) );
  INVX1 U26 ( .A(src1_data[12]), .Y(n82) );
  INVX1 U27 ( .A(src2_data[1]), .Y(n10) );
  INVX1 U28 ( .A(n10), .Y(n11) );
  INVX1 U29 ( .A(src2_data[11]), .Y(n12) );
  INVX2 U30 ( .A(n12), .Y(n13) );
  BUFX2 U31 ( .A(src2_data[6]), .Y(n14) );
  BUFX2 U32 ( .A(src1_data[3]), .Y(n15) );
  BUFX2 U33 ( .A(src2_data[9]), .Y(n16) );
  BUFX2 U34 ( .A(n1), .Y(n17) );
  BUFX2 U35 ( .A(src2_data[14]), .Y(n18) );
  BUFX2 U36 ( .A(src2_data[13]), .Y(n19) );
  INVX1 U37 ( .A(large_sum[16]), .Y(n106) );
  INVX2 U38 ( .A(n107), .Y(n100) );
  INVX2 U39 ( .A(src2_data[8]), .Y(n21) );
  AND2X2 U40 ( .A(alu_op[1]), .B(n36), .Y(n20) );
  INVX8 U41 ( .A(n23), .Y(n24) );
  INVX4 U42 ( .A(n109), .Y(n25) );
  INVX8 U43 ( .A(n25), .Y(overflow) );
  BUFX2 U44 ( .A(src1_data[4]), .Y(n29) );
  INVX1 U45 ( .A(src1_data[15]), .Y(n97) );
  NAND2X1 U46 ( .A(alu_op[0]), .B(alu_op[1]), .Y(n103) );
  INVX2 U47 ( .A(N26), .Y(n35) );
  INVX2 U48 ( .A(alu_op[0]), .Y(n36) );
  XOR2X1 U49 ( .A(large_dif[17]), .B(large_dif[16]), .Y(n33) );
  INVX2 U50 ( .A(alu_op[1]), .Y(n37) );
  NAND2X1 U51 ( .A(alu_op[0]), .B(n37), .Y(n107) );
  XOR2X1 U52 ( .A(large_sum[17]), .B(large_sum[16]), .Y(n32) );
  AOI22X1 U53 ( .A(n33), .B(n20), .C(n100), .D(n32), .Y(n34) );
  OAI21X1 U54 ( .A(n103), .B(n35), .C(n34), .Y(n109) );
  NAND2X1 U55 ( .A(n37), .B(n36), .Y(n98) );
  INVX2 U56 ( .A(n98), .Y(n104) );
  INVX2 U57 ( .A(n103), .Y(n48) );
  AOI22X1 U58 ( .A(n30), .B(n104), .C(full_mult[30]), .D(n48), .Y(n39) );
  AOI22X1 U59 ( .A(large_dif[0]), .B(n20), .C(large_sum[0]), .D(n100), .Y(n38)
         );
  NAND2X1 U60 ( .A(n39), .B(n38), .Y(result[0]) );
  AOI22X1 U61 ( .A(n6), .B(n104), .C(full_mult[31]), .D(n48), .Y(n41) );
  AOI22X1 U62 ( .A(large_dif[1]), .B(n20), .C(large_sum[1]), .D(n100), .Y(n40)
         );
  NAND2X1 U63 ( .A(n41), .B(n40), .Y(result[1]) );
  AOI22X1 U64 ( .A(src1_data[2]), .B(n104), .C(full_mult[32]), .D(n48), .Y(n43) );
  AOI22X1 U65 ( .A(large_dif[2]), .B(n20), .C(large_sum[2]), .D(n100), .Y(n42)
         );
  NAND2X1 U66 ( .A(n43), .B(n42), .Y(result[2]) );
  AOI22X1 U67 ( .A(n15), .B(n104), .C(full_mult[33]), .D(n48), .Y(n45) );
  AOI22X1 U68 ( .A(large_dif[3]), .B(n20), .C(large_sum[3]), .D(n100), .Y(n44)
         );
  NAND2X1 U69 ( .A(n45), .B(n44), .Y(result[3]) );
  AOI22X1 U70 ( .A(n29), .B(n104), .C(full_mult[34]), .D(n48), .Y(n47) );
  AOI22X1 U71 ( .A(large_dif[4]), .B(n20), .C(large_sum[4]), .D(n100), .Y(n46)
         );
  NAND2X1 U72 ( .A(n47), .B(n46), .Y(result[4]) );
  AOI22X1 U73 ( .A(src1_data[5]), .B(n104), .C(full_mult[35]), .D(n48), .Y(n50) );
  AOI22X1 U74 ( .A(large_dif[5]), .B(n20), .C(large_sum[5]), .D(n100), .Y(n49)
         );
  NAND2X1 U75 ( .A(n50), .B(n49), .Y(result[5]) );
  INVX2 U76 ( .A(full_mult[36]), .Y(n55) );
  NAND2X1 U77 ( .A(large_dif[6]), .B(n20), .Y(n51) );
  OAI21X1 U78 ( .A(n98), .B(n52), .C(n51), .Y(n53) );
  AOI21X1 U79 ( .A(large_sum[6]), .B(n100), .C(n53), .Y(n54) );
  OAI21X1 U80 ( .A(n103), .B(n55), .C(n54), .Y(result[6]) );
  INVX2 U81 ( .A(full_mult[37]), .Y(n60) );
  NAND2X1 U82 ( .A(large_dif[7]), .B(n20), .Y(n56) );
  OAI21X1 U83 ( .A(n98), .B(n57), .C(n56), .Y(n58) );
  AOI21X1 U84 ( .A(large_sum[7]), .B(n100), .C(n58), .Y(n59) );
  OAI21X1 U85 ( .A(n103), .B(n60), .C(n59), .Y(result[7]) );
  INVX2 U86 ( .A(full_mult[38]), .Y(n65) );
  NAND2X1 U87 ( .A(large_dif[8]), .B(n20), .Y(n61) );
  OAI21X1 U88 ( .A(n98), .B(n62), .C(n61), .Y(n63) );
  AOI21X1 U89 ( .A(large_sum[8]), .B(n100), .C(n63), .Y(n64) );
  OAI21X1 U90 ( .A(n103), .B(n65), .C(n64), .Y(result[8]) );
  INVX2 U91 ( .A(full_mult[39]), .Y(n70) );
  NAND2X1 U92 ( .A(large_dif[9]), .B(n20), .Y(n66) );
  OAI21X1 U93 ( .A(n98), .B(n67), .C(n66), .Y(n68) );
  AOI21X1 U94 ( .A(large_sum[9]), .B(n100), .C(n68), .Y(n69) );
  OAI21X1 U95 ( .A(n103), .B(n70), .C(n69), .Y(result[9]) );
  INVX2 U96 ( .A(full_mult[40]), .Y(n75) );
  NAND2X1 U97 ( .A(large_dif[10]), .B(n20), .Y(n71) );
  OAI21X1 U98 ( .A(n98), .B(n72), .C(n71), .Y(n73) );
  AOI21X1 U99 ( .A(large_sum[10]), .B(n100), .C(n73), .Y(n74) );
  OAI21X1 U100 ( .A(n103), .B(n75), .C(n74), .Y(result[10]) );
  INVX2 U101 ( .A(full_mult[41]), .Y(n80) );
  NAND2X1 U102 ( .A(large_dif[11]), .B(n20), .Y(n76) );
  OAI21X1 U103 ( .A(n98), .B(n77), .C(n76), .Y(n78) );
  AOI21X1 U104 ( .A(large_sum[11]), .B(n100), .C(n78), .Y(n79) );
  OAI21X1 U105 ( .A(n103), .B(n80), .C(n79), .Y(result[11]) );
  INVX2 U106 ( .A(full_mult[42]), .Y(n85) );
  NAND2X1 U107 ( .A(large_dif[12]), .B(n20), .Y(n81) );
  OAI21X1 U108 ( .A(n98), .B(n82), .C(n81), .Y(n83) );
  AOI21X1 U109 ( .A(large_sum[12]), .B(n100), .C(n83), .Y(n84) );
  OAI21X1 U110 ( .A(n103), .B(n85), .C(n84), .Y(result[12]) );
  INVX2 U111 ( .A(full_mult[43]), .Y(n90) );
  NAND2X1 U112 ( .A(large_dif[13]), .B(n20), .Y(n86) );
  OAI21X1 U113 ( .A(n98), .B(n87), .C(n86), .Y(n88) );
  AOI21X1 U114 ( .A(large_sum[13]), .B(n100), .C(n88), .Y(n89) );
  OAI21X1 U115 ( .A(n103), .B(n90), .C(n89), .Y(result[13]) );
  INVX2 U116 ( .A(full_mult[44]), .Y(n95) );
  NAND2X1 U117 ( .A(large_dif[14]), .B(n20), .Y(n91) );
  OAI21X1 U118 ( .A(n98), .B(n92), .C(n91), .Y(n93) );
  AOI21X1 U119 ( .A(large_sum[14]), .B(n100), .C(n93), .Y(n94) );
  OAI21X1 U120 ( .A(n103), .B(n95), .C(n94), .Y(result[14]) );
  INVX2 U121 ( .A(full_mult[45]), .Y(n102) );
  NAND2X1 U122 ( .A(large_dif[15]), .B(n20), .Y(n96) );
  OAI21X1 U123 ( .A(n98), .B(n97), .C(n96), .Y(n99) );
  AOI21X1 U124 ( .A(large_sum[15]), .B(n100), .C(n99), .Y(n101) );
  OAI21X1 U125 ( .A(n103), .B(n102), .C(n101), .Y(result[15]) );
  AOI22X1 U126 ( .A(src1_data[16]), .B(n104), .C(large_dif[16]), .D(n20), .Y(
        n105) );
  OAI21X1 U127 ( .A(n107), .B(n106), .C(n105), .Y(result[16]) );
endmodule


module flex_sreg_NUM_BITS17_15 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42, n44, n46,
         n48, n50, n52, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13,
         n14, n15, n16, n17, n18, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n52), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n50), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n28), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n26), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n24), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n22), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n20), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n17), .Y(n44) );
  INVX1 U3 ( .A(n18), .Y(n46) );
  INVX1 U4 ( .A(n15), .Y(n40) );
  INVX1 U5 ( .A(n16), .Y(n42) );
  INVX1 U6 ( .A(n53), .Y(n48) );
  INVX1 U7 ( .A(n13), .Y(n36) );
  INVX1 U8 ( .A(n14), .Y(n38) );
  INVX1 U9 ( .A(n12), .Y(n34) );
  INVX2 U10 ( .A(n1), .Y(n2) );
  INVX2 U11 ( .A(write_enable), .Y(n1) );
  INVX2 U12 ( .A(n4), .Y(n3) );
  INVX2 U13 ( .A(n_reset), .Y(n4) );
  MUX2X1 U14 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U15 ( .A(n5), .Y(n20) );
  MUX2X1 U16 ( .B(current_value[1]), .A(new_value[1]), .S(write_enable), .Y(n6) );
  INVX2 U17 ( .A(n6), .Y(n22) );
  MUX2X1 U18 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U19 ( .A(n7), .Y(n24) );
  MUX2X1 U20 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U21 ( .A(n8), .Y(n26) );
  MUX2X1 U22 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U23 ( .A(n9), .Y(n28) );
  MUX2X1 U24 ( .B(current_value[5]), .A(new_value[5]), .S(n2), .Y(n10) );
  INVX2 U25 ( .A(n10), .Y(n30) );
  MUX2X1 U26 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U27 ( .A(n11), .Y(n32) );
  MUX2X1 U28 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U29 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U30 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U31 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U32 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U33 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U34 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U35 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n53) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n54) );
  INVX2 U54 ( .A(n54), .Y(n50) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n55) );
  INVX2 U56 ( .A(n55), .Y(n52) );
endmodule


module flex_sreg_NUM_BITS17_14 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n53, n54, n55, n56, n58, n60, n62, n64, n66, n68, n70, n72,
         n74, n76, n78, n80, n82, n84, n86, n88;

  DFFSR \value_reg[16]  ( .D(n56), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n58), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n60), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n62), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n64), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n66), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n68), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n70), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n72), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n74), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n76), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n78), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n80), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n82), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n84), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n86), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n88), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n18), .Y(n62) );
  INVX1 U3 ( .A(n15), .Y(n68) );
  INVX2 U4 ( .A(n1), .Y(n2) );
  INVX2 U5 ( .A(write_enable), .Y(n1) );
  INVX2 U6 ( .A(n4), .Y(n3) );
  INVX2 U7 ( .A(n_reset), .Y(n4) );
  MUX2X1 U8 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U9 ( .A(n5), .Y(n88) );
  MUX2X1 U10 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U11 ( .A(n6), .Y(n86) );
  MUX2X1 U12 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U13 ( .A(n7), .Y(n84) );
  MUX2X1 U14 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(n8) );
  INVX2 U15 ( .A(n8), .Y(n82) );
  MUX2X1 U16 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U17 ( .A(n9), .Y(n80) );
  MUX2X1 U18 ( .B(current_value[5]), .A(new_value[5]), .S(n2), .Y(n10) );
  INVX2 U19 ( .A(n10), .Y(n78) );
  MUX2X1 U20 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U21 ( .A(n11), .Y(n76) );
  MUX2X1 U22 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U23 ( .A(n12), .Y(n74) );
  MUX2X1 U24 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U25 ( .A(n13), .Y(n72) );
  MUX2X1 U26 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U27 ( .A(n14), .Y(n70) );
  MUX2X1 U28 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U29 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U30 ( .A(n16), .Y(n66) );
  MUX2X1 U31 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U32 ( .A(n17), .Y(n64) );
  MUX2X1 U33 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n53) );
  INVX2 U35 ( .A(n53), .Y(n60) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n54) );
  INVX2 U54 ( .A(n54), .Y(n58) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n55) );
  INVX2 U56 ( .A(n55), .Y(n56) );
endmodule


module flex_sreg_NUM_BITS17_13 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n53, n54, n55, n56, n58, n60, n62, n64, n66, n68, n70, n72,
         n74, n76, n78, n80, n82, n84, n86, n88;

  DFFSR \value_reg[16]  ( .D(n56), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n58), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n60), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n62), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n64), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n66), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n68), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n70), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n72), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n74), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n76), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n78), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n80), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n82), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n84), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n86), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n88), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n18), .Y(n62) );
  INVX1 U3 ( .A(n15), .Y(n68) );
  INVX2 U4 ( .A(n1), .Y(n2) );
  INVX2 U5 ( .A(write_enable), .Y(n1) );
  INVX2 U6 ( .A(n4), .Y(n3) );
  INVX2 U7 ( .A(n_reset), .Y(n4) );
  MUX2X1 U8 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U9 ( .A(n5), .Y(n88) );
  MUX2X1 U10 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U11 ( .A(n6), .Y(n86) );
  MUX2X1 U12 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U13 ( .A(n7), .Y(n84) );
  MUX2X1 U14 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(n8) );
  INVX2 U15 ( .A(n8), .Y(n82) );
  MUX2X1 U16 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U17 ( .A(n9), .Y(n80) );
  MUX2X1 U18 ( .B(current_value[5]), .A(new_value[5]), .S(n2), .Y(n10) );
  INVX2 U19 ( .A(n10), .Y(n78) );
  MUX2X1 U20 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U21 ( .A(n11), .Y(n76) );
  MUX2X1 U22 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U23 ( .A(n12), .Y(n74) );
  MUX2X1 U24 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U25 ( .A(n13), .Y(n72) );
  MUX2X1 U26 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U27 ( .A(n14), .Y(n70) );
  MUX2X1 U28 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U29 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U30 ( .A(n16), .Y(n66) );
  MUX2X1 U31 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U32 ( .A(n17), .Y(n64) );
  MUX2X1 U33 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n53) );
  INVX2 U35 ( .A(n53), .Y(n60) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n54) );
  INVX2 U54 ( .A(n54), .Y(n58) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n55) );
  INVX2 U56 ( .A(n55), .Y(n56) );
endmodule


module flex_sreg_NUM_BITS17_12 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n53, n54, n55, n56, n58, n60, n62, n64, n66, n68, n70, n72,
         n74, n76, n78, n80, n82, n84, n86, n88;

  DFFSR \value_reg[16]  ( .D(n56), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n58), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n60), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n62), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n64), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n66), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n68), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n70), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n72), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n74), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n76), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n78), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n80), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n82), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n84), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n86), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n88), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n18), .Y(n62) );
  INVX1 U3 ( .A(n15), .Y(n68) );
  INVX2 U4 ( .A(n1), .Y(n2) );
  INVX2 U5 ( .A(write_enable), .Y(n1) );
  INVX2 U6 ( .A(n4), .Y(n3) );
  INVX2 U7 ( .A(n_reset), .Y(n4) );
  MUX2X1 U8 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U9 ( .A(n5), .Y(n88) );
  MUX2X1 U10 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U11 ( .A(n6), .Y(n86) );
  MUX2X1 U12 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U13 ( .A(n7), .Y(n84) );
  MUX2X1 U14 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(n8) );
  INVX2 U15 ( .A(n8), .Y(n82) );
  MUX2X1 U16 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U17 ( .A(n9), .Y(n80) );
  MUX2X1 U18 ( .B(current_value[5]), .A(new_value[5]), .S(n2), .Y(n10) );
  INVX2 U19 ( .A(n10), .Y(n78) );
  MUX2X1 U20 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U21 ( .A(n11), .Y(n76) );
  MUX2X1 U22 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U23 ( .A(n12), .Y(n74) );
  MUX2X1 U24 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U25 ( .A(n13), .Y(n72) );
  MUX2X1 U26 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U27 ( .A(n14), .Y(n70) );
  MUX2X1 U28 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U29 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U30 ( .A(n16), .Y(n66) );
  MUX2X1 U31 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U32 ( .A(n17), .Y(n64) );
  MUX2X1 U33 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n53) );
  INVX2 U35 ( .A(n53), .Y(n60) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n54) );
  INVX2 U54 ( .A(n54), .Y(n58) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n55) );
  INVX2 U56 ( .A(n55), .Y(n56) );
endmodule


module flex_sreg_NUM_BITS17_11 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n53, n54, n55, n56, n58, n60, n62, n64, n66, n68, n70, n72,
         n74, n76, n78, n80, n82, n84, n86, n88;

  DFFSR \value_reg[16]  ( .D(n56), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n58), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n60), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n62), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n64), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n66), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n68), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n70), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n72), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n74), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n76), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n78), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n80), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n82), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n84), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n86), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n88), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n15), .Y(n68) );
  INVX2 U3 ( .A(n1), .Y(n2) );
  INVX2 U4 ( .A(write_enable), .Y(n1) );
  INVX2 U5 ( .A(n4), .Y(n3) );
  INVX2 U6 ( .A(n_reset), .Y(n4) );
  MUX2X1 U7 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U8 ( .A(n5), .Y(n88) );
  MUX2X1 U9 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U10 ( .A(n6), .Y(n86) );
  MUX2X1 U11 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U12 ( .A(n7), .Y(n84) );
  MUX2X1 U13 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(n8) );
  INVX2 U14 ( .A(n8), .Y(n82) );
  MUX2X1 U15 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U16 ( .A(n9), .Y(n80) );
  MUX2X1 U17 ( .B(current_value[5]), .A(new_value[5]), .S(n2), .Y(n10) );
  INVX2 U18 ( .A(n10), .Y(n78) );
  MUX2X1 U19 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U20 ( .A(n11), .Y(n76) );
  MUX2X1 U21 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U22 ( .A(n12), .Y(n74) );
  MUX2X1 U23 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U24 ( .A(n13), .Y(n72) );
  MUX2X1 U25 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U26 ( .A(n14), .Y(n70) );
  MUX2X1 U27 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U28 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U29 ( .A(n16), .Y(n66) );
  MUX2X1 U30 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U31 ( .A(n17), .Y(n64) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n62) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n53) );
  INVX2 U35 ( .A(n53), .Y(n60) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n54) );
  INVX2 U54 ( .A(n54), .Y(n58) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n55) );
  INVX2 U56 ( .A(n55), .Y(n56) );
endmodule


module flex_sreg_NUM_BITS17_10 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n53, n54, n55, n56, n58, n60, n62, n64, n66, n68, n70, n72,
         n74, n76, n78, n80, n82, n84, n86, n88;

  DFFSR \value_reg[16]  ( .D(n56), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n58), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n60), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n62), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n64), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n66), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n68), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n70), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n72), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n74), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n76), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n78), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n80), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n82), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n84), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n86), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n88), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n15), .Y(n68) );
  INVX2 U3 ( .A(n1), .Y(n2) );
  INVX2 U4 ( .A(write_enable), .Y(n1) );
  INVX2 U5 ( .A(n4), .Y(n3) );
  INVX2 U6 ( .A(n_reset), .Y(n4) );
  MUX2X1 U7 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U8 ( .A(n5), .Y(n88) );
  MUX2X1 U9 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U10 ( .A(n6), .Y(n86) );
  MUX2X1 U11 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U12 ( .A(n7), .Y(n84) );
  MUX2X1 U13 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(n8) );
  INVX2 U14 ( .A(n8), .Y(n82) );
  MUX2X1 U15 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U16 ( .A(n9), .Y(n80) );
  MUX2X1 U17 ( .B(current_value[5]), .A(new_value[5]), .S(n2), .Y(n10) );
  INVX2 U18 ( .A(n10), .Y(n78) );
  MUX2X1 U19 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U20 ( .A(n11), .Y(n76) );
  MUX2X1 U21 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U22 ( .A(n12), .Y(n74) );
  MUX2X1 U23 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U24 ( .A(n13), .Y(n72) );
  MUX2X1 U25 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U26 ( .A(n14), .Y(n70) );
  MUX2X1 U27 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U28 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U29 ( .A(n16), .Y(n66) );
  MUX2X1 U30 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U31 ( .A(n17), .Y(n64) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n62) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n53) );
  INVX2 U35 ( .A(n53), .Y(n60) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n54) );
  INVX2 U54 ( .A(n54), .Y(n58) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n55) );
  INVX2 U56 ( .A(n55), .Y(n56) );
endmodule


module flex_sreg_NUM_BITS17_9 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n53, n54, n55, n56, n58, n60, n62, n64, n66, n68, n70, n72,
         n74, n76, n78, n80, n82, n84, n86, n88;

  DFFSR \value_reg[16]  ( .D(n56), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n58), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n60), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n62), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n64), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n66), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n68), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n70), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n72), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n74), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n76), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n78), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n80), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n82), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n84), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n86), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n88), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n18), .Y(n62) );
  INVX1 U3 ( .A(n15), .Y(n68) );
  INVX2 U4 ( .A(n1), .Y(n2) );
  INVX2 U5 ( .A(write_enable), .Y(n1) );
  INVX2 U6 ( .A(n4), .Y(n3) );
  INVX2 U7 ( .A(n_reset), .Y(n4) );
  MUX2X1 U8 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U9 ( .A(n5), .Y(n88) );
  MUX2X1 U10 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U11 ( .A(n6), .Y(n86) );
  MUX2X1 U12 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U13 ( .A(n7), .Y(n84) );
  MUX2X1 U14 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(n8) );
  INVX2 U15 ( .A(n8), .Y(n82) );
  MUX2X1 U16 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U17 ( .A(n9), .Y(n80) );
  MUX2X1 U18 ( .B(current_value[5]), .A(new_value[5]), .S(n2), .Y(n10) );
  INVX2 U19 ( .A(n10), .Y(n78) );
  MUX2X1 U20 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U21 ( .A(n11), .Y(n76) );
  MUX2X1 U22 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U23 ( .A(n12), .Y(n74) );
  MUX2X1 U24 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U25 ( .A(n13), .Y(n72) );
  MUX2X1 U26 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U27 ( .A(n14), .Y(n70) );
  MUX2X1 U28 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U29 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U30 ( .A(n16), .Y(n66) );
  MUX2X1 U31 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U32 ( .A(n17), .Y(n64) );
  MUX2X1 U33 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n53) );
  INVX2 U35 ( .A(n53), .Y(n60) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n54) );
  INVX2 U54 ( .A(n54), .Y(n58) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n55) );
  INVX2 U56 ( .A(n55), .Y(n56) );
endmodule


module flex_sreg_NUM_BITS17_8 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n53, n54, n55, n56, n58, n60, n62, n64, n66, n68, n70, n72,
         n74, n76, n78, n80, n82, n84, n86, n88;

  DFFSR \value_reg[16]  ( .D(n56), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n58), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n60), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n62), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n64), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n66), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n68), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n70), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n72), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n74), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n76), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n78), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n80), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n82), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n84), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n86), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n88), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n18), .Y(n62) );
  INVX1 U3 ( .A(n15), .Y(n68) );
  INVX2 U4 ( .A(n1), .Y(n2) );
  INVX2 U5 ( .A(write_enable), .Y(n1) );
  INVX2 U6 ( .A(n4), .Y(n3) );
  INVX2 U7 ( .A(n_reset), .Y(n4) );
  MUX2X1 U8 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U9 ( .A(n5), .Y(n88) );
  MUX2X1 U10 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U11 ( .A(n6), .Y(n86) );
  MUX2X1 U12 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U13 ( .A(n7), .Y(n84) );
  MUX2X1 U14 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(n8) );
  INVX2 U15 ( .A(n8), .Y(n82) );
  MUX2X1 U16 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U17 ( .A(n9), .Y(n80) );
  MUX2X1 U18 ( .B(current_value[5]), .A(new_value[5]), .S(n2), .Y(n10) );
  INVX2 U19 ( .A(n10), .Y(n78) );
  MUX2X1 U20 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U21 ( .A(n11), .Y(n76) );
  MUX2X1 U22 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U23 ( .A(n12), .Y(n74) );
  MUX2X1 U24 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U25 ( .A(n13), .Y(n72) );
  MUX2X1 U26 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U27 ( .A(n14), .Y(n70) );
  MUX2X1 U28 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U29 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U30 ( .A(n16), .Y(n66) );
  MUX2X1 U31 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U32 ( .A(n17), .Y(n64) );
  MUX2X1 U33 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n53) );
  INVX2 U35 ( .A(n53), .Y(n60) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n54) );
  INVX2 U54 ( .A(n54), .Y(n58) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n55) );
  INVX2 U56 ( .A(n55), .Y(n56) );
endmodule


module flex_sreg_NUM_BITS17_7 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n53, n54, n55, n56, n58, n60, n62, n64, n66, n68, n70, n72,
         n74, n76, n78, n80, n82, n84, n86, n88;

  DFFSR \value_reg[16]  ( .D(n56), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n58), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n60), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n62), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n64), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n66), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n68), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n70), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n72), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n74), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n76), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n78), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n80), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n82), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n84), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n86), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n88), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n15), .Y(n68) );
  INVX2 U3 ( .A(n1), .Y(n2) );
  INVX2 U4 ( .A(write_enable), .Y(n1) );
  INVX2 U5 ( .A(n4), .Y(n3) );
  INVX2 U6 ( .A(n_reset), .Y(n4) );
  MUX2X1 U7 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U8 ( .A(n5), .Y(n88) );
  MUX2X1 U9 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U10 ( .A(n6), .Y(n86) );
  MUX2X1 U11 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U12 ( .A(n7), .Y(n84) );
  MUX2X1 U13 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(n8) );
  INVX2 U14 ( .A(n8), .Y(n82) );
  MUX2X1 U15 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U16 ( .A(n9), .Y(n80) );
  MUX2X1 U17 ( .B(current_value[5]), .A(new_value[5]), .S(n2), .Y(n10) );
  INVX2 U18 ( .A(n10), .Y(n78) );
  MUX2X1 U19 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U20 ( .A(n11), .Y(n76) );
  MUX2X1 U21 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U22 ( .A(n12), .Y(n74) );
  MUX2X1 U23 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U24 ( .A(n13), .Y(n72) );
  MUX2X1 U25 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U26 ( .A(n14), .Y(n70) );
  MUX2X1 U27 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U28 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U29 ( .A(n16), .Y(n66) );
  MUX2X1 U30 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U31 ( .A(n17), .Y(n64) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n62) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n53) );
  INVX2 U35 ( .A(n53), .Y(n60) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n54) );
  INVX2 U54 ( .A(n54), .Y(n58) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n55) );
  INVX2 U56 ( .A(n55), .Y(n56) );
endmodule


module flex_sreg_NUM_BITS17_6 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n53, n54, n55, n56, n58, n60, n62, n64, n66, n68, n70, n72,
         n74, n76, n78, n80, n82, n84, n86, n88;

  DFFSR \value_reg[16]  ( .D(n56), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n58), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n60), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n62), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n64), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n66), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n68), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n70), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n72), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n74), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n76), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n78), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n80), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n82), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n84), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n86), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n88), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n18), .Y(n62) );
  INVX1 U3 ( .A(n15), .Y(n68) );
  INVX2 U4 ( .A(n1), .Y(n2) );
  INVX2 U5 ( .A(write_enable), .Y(n1) );
  INVX2 U6 ( .A(n4), .Y(n3) );
  INVX2 U7 ( .A(n_reset), .Y(n4) );
  MUX2X1 U8 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U9 ( .A(n5), .Y(n88) );
  MUX2X1 U10 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U11 ( .A(n6), .Y(n86) );
  MUX2X1 U12 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U13 ( .A(n7), .Y(n84) );
  MUX2X1 U14 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(n8) );
  INVX2 U15 ( .A(n8), .Y(n82) );
  MUX2X1 U16 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U17 ( .A(n9), .Y(n80) );
  MUX2X1 U18 ( .B(current_value[5]), .A(new_value[5]), .S(n2), .Y(n10) );
  INVX2 U19 ( .A(n10), .Y(n78) );
  MUX2X1 U20 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U21 ( .A(n11), .Y(n76) );
  MUX2X1 U22 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U23 ( .A(n12), .Y(n74) );
  MUX2X1 U24 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U25 ( .A(n13), .Y(n72) );
  MUX2X1 U26 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U27 ( .A(n14), .Y(n70) );
  MUX2X1 U28 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U29 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U30 ( .A(n16), .Y(n66) );
  MUX2X1 U31 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U32 ( .A(n17), .Y(n64) );
  MUX2X1 U33 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n53) );
  INVX2 U35 ( .A(n53), .Y(n60) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n54) );
  INVX2 U54 ( .A(n54), .Y(n58) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n55) );
  INVX2 U56 ( .A(n55), .Y(n56) );
endmodule


module flex_sreg_NUM_BITS17_5 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n53, n54, n55, n56, n58, n60, n62, n64, n66, n68, n70, n72,
         n74, n76, n78, n80, n82, n84, n86, n88;

  DFFSR \value_reg[16]  ( .D(n56), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n58), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n60), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n62), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n64), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n66), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n68), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n70), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n72), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n74), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n76), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n78), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n80), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n82), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n84), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n86), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n88), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n18), .Y(n62) );
  INVX1 U3 ( .A(n15), .Y(n68) );
  INVX2 U4 ( .A(n1), .Y(n2) );
  INVX2 U5 ( .A(write_enable), .Y(n1) );
  INVX2 U6 ( .A(n4), .Y(n3) );
  INVX2 U7 ( .A(n_reset), .Y(n4) );
  MUX2X1 U8 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U9 ( .A(n5), .Y(n88) );
  MUX2X1 U10 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U11 ( .A(n6), .Y(n86) );
  MUX2X1 U12 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U13 ( .A(n7), .Y(n84) );
  MUX2X1 U14 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(n8) );
  INVX2 U15 ( .A(n8), .Y(n82) );
  MUX2X1 U16 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U17 ( .A(n9), .Y(n80) );
  MUX2X1 U18 ( .B(current_value[5]), .A(new_value[5]), .S(n2), .Y(n10) );
  INVX2 U19 ( .A(n10), .Y(n78) );
  MUX2X1 U20 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U21 ( .A(n11), .Y(n76) );
  MUX2X1 U22 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U23 ( .A(n12), .Y(n74) );
  MUX2X1 U24 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U25 ( .A(n13), .Y(n72) );
  MUX2X1 U26 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U27 ( .A(n14), .Y(n70) );
  MUX2X1 U28 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U29 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U30 ( .A(n16), .Y(n66) );
  MUX2X1 U31 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U32 ( .A(n17), .Y(n64) );
  MUX2X1 U33 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n53) );
  INVX2 U35 ( .A(n53), .Y(n60) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n54) );
  INVX2 U54 ( .A(n54), .Y(n58) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n55) );
  INVX2 U56 ( .A(n55), .Y(n56) );
endmodule


module flex_sreg_NUM_BITS17_4 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n53, n54, n55, n56, n58, n60, n62, n64, n66, n68, n70, n72,
         n74, n76, n78, n80, n82, n84, n86, n88;

  DFFSR \value_reg[16]  ( .D(n56), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n58), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n60), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n62), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n64), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n66), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n68), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n70), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n72), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n74), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n76), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n78), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n80), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n82), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n84), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n86), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n88), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n15), .Y(n68) );
  INVX2 U3 ( .A(n1), .Y(n2) );
  INVX2 U4 ( .A(write_enable), .Y(n1) );
  INVX2 U5 ( .A(n4), .Y(n3) );
  INVX2 U6 ( .A(n_reset), .Y(n4) );
  MUX2X1 U7 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U8 ( .A(n5), .Y(n88) );
  MUX2X1 U9 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U10 ( .A(n6), .Y(n86) );
  MUX2X1 U11 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U12 ( .A(n7), .Y(n84) );
  MUX2X1 U13 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(n8) );
  INVX2 U14 ( .A(n8), .Y(n82) );
  MUX2X1 U15 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U16 ( .A(n9), .Y(n80) );
  MUX2X1 U17 ( .B(current_value[5]), .A(new_value[5]), .S(n2), .Y(n10) );
  INVX2 U18 ( .A(n10), .Y(n78) );
  MUX2X1 U19 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U20 ( .A(n11), .Y(n76) );
  MUX2X1 U21 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U22 ( .A(n12), .Y(n74) );
  MUX2X1 U23 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U24 ( .A(n13), .Y(n72) );
  MUX2X1 U25 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U26 ( .A(n14), .Y(n70) );
  MUX2X1 U27 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U28 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U29 ( .A(n16), .Y(n66) );
  MUX2X1 U30 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U31 ( .A(n17), .Y(n64) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n62) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n53) );
  INVX2 U35 ( .A(n53), .Y(n60) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n54) );
  INVX2 U54 ( .A(n54), .Y(n58) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n55) );
  INVX2 U56 ( .A(n55), .Y(n56) );
endmodule


module flex_sreg_NUM_BITS17_3 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n53, n54, n55, n56, n58, n60, n62, n64, n66, n68, n70, n72,
         n74, n76, n78, n80, n82, n84, n86, n88;

  DFFSR \value_reg[16]  ( .D(n56), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n58), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n60), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n62), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n64), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n66), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n68), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n70), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n72), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n74), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n76), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n78), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n80), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n82), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n84), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n86), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n88), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n15), .Y(n68) );
  INVX2 U3 ( .A(n1), .Y(n2) );
  INVX2 U4 ( .A(write_enable), .Y(n1) );
  INVX2 U5 ( .A(n4), .Y(n3) );
  INVX2 U6 ( .A(n_reset), .Y(n4) );
  MUX2X1 U7 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U8 ( .A(n5), .Y(n88) );
  MUX2X1 U9 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U10 ( .A(n6), .Y(n86) );
  MUX2X1 U11 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U12 ( .A(n7), .Y(n84) );
  MUX2X1 U13 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(n8) );
  INVX2 U14 ( .A(n8), .Y(n82) );
  MUX2X1 U15 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U16 ( .A(n9), .Y(n80) );
  MUX2X1 U17 ( .B(current_value[5]), .A(new_value[5]), .S(n2), .Y(n10) );
  INVX2 U18 ( .A(n10), .Y(n78) );
  MUX2X1 U19 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U20 ( .A(n11), .Y(n76) );
  MUX2X1 U21 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U22 ( .A(n12), .Y(n74) );
  MUX2X1 U23 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U24 ( .A(n13), .Y(n72) );
  MUX2X1 U25 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U26 ( .A(n14), .Y(n70) );
  MUX2X1 U27 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U28 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U29 ( .A(n16), .Y(n66) );
  MUX2X1 U30 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U31 ( .A(n17), .Y(n64) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n62) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n53) );
  INVX2 U35 ( .A(n53), .Y(n60) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n54) );
  INVX2 U54 ( .A(n54), .Y(n58) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n55) );
  INVX2 U56 ( .A(n55), .Y(n56) );
endmodule


module flex_sreg_NUM_BITS17_2 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n53, n54, n55, n56, n58, n60, n62, n64, n66, n68, n70, n72,
         n74, n76, n78, n80, n82, n84, n86, n88;

  DFFSR \value_reg[16]  ( .D(n56), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n58), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n60), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n62), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n64), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n66), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n68), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n70), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n72), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n74), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n76), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n78), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n80), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n82), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n84), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n86), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n88), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n15), .Y(n68) );
  INVX2 U3 ( .A(n1), .Y(n2) );
  INVX2 U4 ( .A(write_enable), .Y(n1) );
  INVX2 U5 ( .A(n4), .Y(n3) );
  INVX2 U6 ( .A(n_reset), .Y(n4) );
  MUX2X1 U7 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U8 ( .A(n5), .Y(n88) );
  MUX2X1 U9 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U10 ( .A(n6), .Y(n86) );
  MUX2X1 U11 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U12 ( .A(n7), .Y(n84) );
  MUX2X1 U13 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(n8) );
  INVX2 U14 ( .A(n8), .Y(n82) );
  MUX2X1 U15 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U16 ( .A(n9), .Y(n80) );
  MUX2X1 U17 ( .B(current_value[5]), .A(new_value[5]), .S(n2), .Y(n10) );
  INVX2 U18 ( .A(n10), .Y(n78) );
  MUX2X1 U19 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U20 ( .A(n11), .Y(n76) );
  MUX2X1 U21 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U22 ( .A(n12), .Y(n74) );
  MUX2X1 U23 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U24 ( .A(n13), .Y(n72) );
  MUX2X1 U25 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U26 ( .A(n14), .Y(n70) );
  MUX2X1 U27 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U28 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U29 ( .A(n16), .Y(n66) );
  MUX2X1 U30 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U31 ( .A(n17), .Y(n64) );
  MUX2X1 U32 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  INVX2 U33 ( .A(n18), .Y(n62) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n53) );
  INVX2 U35 ( .A(n53), .Y(n60) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n54) );
  INVX2 U54 ( .A(n54), .Y(n58) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n55) );
  INVX2 U56 ( .A(n55), .Y(n56) );
endmodule


module flex_sreg_NUM_BITS17_1 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n53, n54, n55, n56, n58, n60, n62, n64, n66, n68, n70, n72,
         n74, n76, n78, n80, n82, n84, n86, n88;

  DFFSR \value_reg[16]  ( .D(n56), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n58), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n60), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n62), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n64), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n66), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n68), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n70), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n72), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n74), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n76), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n78), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n80), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n82), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n84), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n86), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n88), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n18), .Y(n62) );
  INVX1 U3 ( .A(n15), .Y(n68) );
  INVX2 U4 ( .A(n1), .Y(n2) );
  INVX2 U5 ( .A(write_enable), .Y(n1) );
  INVX2 U6 ( .A(n4), .Y(n3) );
  INVX2 U7 ( .A(n_reset), .Y(n4) );
  MUX2X1 U8 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U9 ( .A(n5), .Y(n88) );
  MUX2X1 U10 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U11 ( .A(n6), .Y(n86) );
  MUX2X1 U12 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U13 ( .A(n7), .Y(n84) );
  MUX2X1 U14 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(n8) );
  INVX2 U15 ( .A(n8), .Y(n82) );
  MUX2X1 U16 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U17 ( .A(n9), .Y(n80) );
  MUX2X1 U18 ( .B(current_value[5]), .A(new_value[5]), .S(n2), .Y(n10) );
  INVX2 U19 ( .A(n10), .Y(n78) );
  MUX2X1 U20 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U21 ( .A(n11), .Y(n76) );
  MUX2X1 U22 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U23 ( .A(n12), .Y(n74) );
  MUX2X1 U24 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U25 ( .A(n13), .Y(n72) );
  MUX2X1 U26 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U27 ( .A(n14), .Y(n70) );
  MUX2X1 U28 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U29 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U30 ( .A(n16), .Y(n66) );
  MUX2X1 U31 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U32 ( .A(n17), .Y(n64) );
  MUX2X1 U33 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n53) );
  INVX2 U35 ( .A(n53), .Y(n60) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n54) );
  INVX2 U54 ( .A(n54), .Y(n58) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n55) );
  INVX2 U56 ( .A(n55), .Y(n56) );
endmodule


module flex_sreg_NUM_BITS17_0 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n53, n54, n55, n56, n58, n60, n62, n64, n66, n68, n70, n72,
         n74, n76, n78, n80, n82, n84, n86, n88;

  DFFSR \value_reg[16]  ( .D(n56), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n58), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n60), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n62), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n64), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n66), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n68), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n70), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n72), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n74), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n76), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n78), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n80), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n82), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n84), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n86), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n88), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n18), .Y(n62) );
  INVX1 U3 ( .A(n15), .Y(n68) );
  INVX2 U4 ( .A(n1), .Y(n2) );
  INVX2 U5 ( .A(write_enable), .Y(n1) );
  INVX2 U6 ( .A(n4), .Y(n3) );
  INVX2 U7 ( .A(n_reset), .Y(n4) );
  MUX2X1 U8 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U9 ( .A(n5), .Y(n88) );
  MUX2X1 U10 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U11 ( .A(n6), .Y(n86) );
  MUX2X1 U12 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U13 ( .A(n7), .Y(n84) );
  MUX2X1 U14 ( .B(current_value[3]), .A(new_value[3]), .S(write_enable), .Y(n8) );
  INVX2 U15 ( .A(n8), .Y(n82) );
  MUX2X1 U16 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U17 ( .A(n9), .Y(n80) );
  MUX2X1 U18 ( .B(current_value[5]), .A(new_value[5]), .S(n2), .Y(n10) );
  INVX2 U19 ( .A(n10), .Y(n78) );
  MUX2X1 U20 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  INVX2 U21 ( .A(n11), .Y(n76) );
  MUX2X1 U22 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  INVX2 U23 ( .A(n12), .Y(n74) );
  MUX2X1 U24 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  INVX2 U25 ( .A(n13), .Y(n72) );
  MUX2X1 U26 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  INVX2 U27 ( .A(n14), .Y(n70) );
  MUX2X1 U28 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U29 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  INVX2 U30 ( .A(n16), .Y(n66) );
  MUX2X1 U31 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  INVX2 U32 ( .A(n17), .Y(n64) );
  MUX2X1 U33 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U34 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n53) );
  INVX2 U35 ( .A(n53), .Y(n60) );
  MUX2X1 U36 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n54) );
  INVX2 U54 ( .A(n54), .Y(n58) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n55) );
  INVX2 U56 ( .A(n55), .Y(n56) );
endmodule


module register_file ( clk, n_reset, w_en, r1_sel, r2_sel, w_sel, w_data, 
        r1_data, r2_data, outreg_data );
  input [3:0] r1_sel;
  input [3:0] r2_sel;
  input [3:0] w_sel;
  input [16:0] w_data;
  output [16:0] r1_data;
  output [16:0] r2_data;
  output [16:0] outreg_data;
  input clk, n_reset, w_en;
  wire   N10, N11, N12, N13, N14, N15, N16, N17, n706, n707, n708, n709, n710,
         \regs_matrix[15][16] , \regs_matrix[15][15] , \regs_matrix[15][14] ,
         \regs_matrix[15][13] , \regs_matrix[15][12] , \regs_matrix[15][11] ,
         \regs_matrix[15][10] , \regs_matrix[15][9] , \regs_matrix[15][8] ,
         \regs_matrix[15][7] , \regs_matrix[15][6] , \regs_matrix[15][5] ,
         \regs_matrix[15][4] , \regs_matrix[15][3] , \regs_matrix[15][2] ,
         \regs_matrix[15][1] , \regs_matrix[15][0] , \regs_matrix[14][16] ,
         \regs_matrix[14][15] , \regs_matrix[14][14] , \regs_matrix[14][13] ,
         \regs_matrix[14][12] , \regs_matrix[14][11] , \regs_matrix[14][10] ,
         \regs_matrix[14][9] , \regs_matrix[14][8] , \regs_matrix[14][7] ,
         \regs_matrix[14][6] , \regs_matrix[14][5] , \regs_matrix[14][4] ,
         \regs_matrix[14][3] , \regs_matrix[14][2] , \regs_matrix[14][1] ,
         \regs_matrix[14][0] , \regs_matrix[13][16] , \regs_matrix[13][15] ,
         \regs_matrix[13][14] , \regs_matrix[13][13] , \regs_matrix[13][12] ,
         \regs_matrix[13][11] , \regs_matrix[13][10] , \regs_matrix[13][9] ,
         \regs_matrix[13][8] , \regs_matrix[13][7] , \regs_matrix[13][6] ,
         \regs_matrix[13][5] , \regs_matrix[13][4] , \regs_matrix[13][3] ,
         \regs_matrix[13][2] , \regs_matrix[13][1] , \regs_matrix[13][0] ,
         \regs_matrix[12][16] , \regs_matrix[12][15] , \regs_matrix[12][14] ,
         \regs_matrix[12][13] , \regs_matrix[12][12] , \regs_matrix[12][11] ,
         \regs_matrix[12][10] , \regs_matrix[12][9] , \regs_matrix[12][8] ,
         \regs_matrix[12][7] , \regs_matrix[12][6] , \regs_matrix[12][5] ,
         \regs_matrix[12][4] , \regs_matrix[12][3] , \regs_matrix[12][2] ,
         \regs_matrix[12][1] , \regs_matrix[12][0] , \regs_matrix[11][16] ,
         \regs_matrix[11][15] , \regs_matrix[11][14] , \regs_matrix[11][13] ,
         \regs_matrix[11][12] , \regs_matrix[11][11] , \regs_matrix[11][10] ,
         \regs_matrix[11][9] , \regs_matrix[11][8] , \regs_matrix[11][7] ,
         \regs_matrix[11][6] , \regs_matrix[11][5] , \regs_matrix[11][4] ,
         \regs_matrix[11][3] , \regs_matrix[11][2] , \regs_matrix[11][1] ,
         \regs_matrix[11][0] , \regs_matrix[10][16] , \regs_matrix[10][15] ,
         \regs_matrix[10][14] , \regs_matrix[10][13] , \regs_matrix[10][12] ,
         \regs_matrix[10][11] , \regs_matrix[10][10] , \regs_matrix[10][9] ,
         \regs_matrix[10][8] , \regs_matrix[10][7] , \regs_matrix[10][6] ,
         \regs_matrix[10][5] , \regs_matrix[10][4] , \regs_matrix[10][3] ,
         \regs_matrix[10][2] , \regs_matrix[10][1] , \regs_matrix[10][0] ,
         \regs_matrix[9][16] , \regs_matrix[9][15] , \regs_matrix[9][14] ,
         \regs_matrix[9][13] , \regs_matrix[9][12] , \regs_matrix[9][11] ,
         \regs_matrix[9][10] , \regs_matrix[9][9] , \regs_matrix[9][8] ,
         \regs_matrix[9][7] , \regs_matrix[9][6] , \regs_matrix[9][5] ,
         \regs_matrix[9][4] , \regs_matrix[9][3] , \regs_matrix[9][2] ,
         \regs_matrix[9][1] , \regs_matrix[9][0] , \regs_matrix[8][16] ,
         \regs_matrix[8][15] , \regs_matrix[8][14] , \regs_matrix[8][13] ,
         \regs_matrix[8][12] , \regs_matrix[8][11] , \regs_matrix[8][10] ,
         \regs_matrix[8][9] , \regs_matrix[8][8] , \regs_matrix[8][7] ,
         \regs_matrix[8][6] , \regs_matrix[8][5] , \regs_matrix[8][4] ,
         \regs_matrix[8][3] , \regs_matrix[8][2] , \regs_matrix[8][1] ,
         \regs_matrix[8][0] , \regs_matrix[7][16] , \regs_matrix[7][15] ,
         \regs_matrix[7][14] , \regs_matrix[7][13] , \regs_matrix[7][12] ,
         \regs_matrix[7][11] , \regs_matrix[7][10] , \regs_matrix[7][9] ,
         \regs_matrix[7][8] , \regs_matrix[7][7] , \regs_matrix[7][6] ,
         \regs_matrix[7][5] , \regs_matrix[7][4] , \regs_matrix[7][3] ,
         \regs_matrix[7][2] , \regs_matrix[7][1] , \regs_matrix[7][0] ,
         \regs_matrix[6][16] , \regs_matrix[6][15] , \regs_matrix[6][14] ,
         \regs_matrix[6][13] , \regs_matrix[6][12] , \regs_matrix[6][11] ,
         \regs_matrix[6][10] , \regs_matrix[6][9] , \regs_matrix[6][8] ,
         \regs_matrix[6][7] , \regs_matrix[6][6] , \regs_matrix[6][5] ,
         \regs_matrix[6][4] , \regs_matrix[6][3] , \regs_matrix[6][2] ,
         \regs_matrix[6][1] , \regs_matrix[6][0] , \regs_matrix[5][16] ,
         \regs_matrix[5][15] , \regs_matrix[5][14] , \regs_matrix[5][13] ,
         \regs_matrix[5][12] , \regs_matrix[5][11] , \regs_matrix[5][10] ,
         \regs_matrix[5][9] , \regs_matrix[5][8] , \regs_matrix[5][7] ,
         \regs_matrix[5][6] , \regs_matrix[5][5] , \regs_matrix[5][4] ,
         \regs_matrix[5][3] , \regs_matrix[5][2] , \regs_matrix[5][1] ,
         \regs_matrix[5][0] , \regs_matrix[4][16] , \regs_matrix[4][15] ,
         \regs_matrix[4][14] , \regs_matrix[4][13] , \regs_matrix[4][12] ,
         \regs_matrix[4][11] , \regs_matrix[4][10] , \regs_matrix[4][9] ,
         \regs_matrix[4][8] , \regs_matrix[4][7] , \regs_matrix[4][6] ,
         \regs_matrix[4][5] , \regs_matrix[4][4] , \regs_matrix[4][3] ,
         \regs_matrix[4][2] , \regs_matrix[4][1] , \regs_matrix[4][0] ,
         \regs_matrix[3][16] , \regs_matrix[3][15] , \regs_matrix[3][14] ,
         \regs_matrix[3][13] , \regs_matrix[3][12] , \regs_matrix[3][11] ,
         \regs_matrix[3][10] , \regs_matrix[3][9] , \regs_matrix[3][8] ,
         \regs_matrix[3][7] , \regs_matrix[3][6] , \regs_matrix[3][5] ,
         \regs_matrix[3][4] , \regs_matrix[3][3] , \regs_matrix[3][2] ,
         \regs_matrix[3][1] , \regs_matrix[3][0] , \regs_matrix[2][16] ,
         \regs_matrix[2][15] , \regs_matrix[2][14] , \regs_matrix[2][13] ,
         \regs_matrix[2][12] , \regs_matrix[2][11] , \regs_matrix[2][10] ,
         \regs_matrix[2][9] , \regs_matrix[2][8] , \regs_matrix[2][7] ,
         \regs_matrix[2][6] , \regs_matrix[2][5] , \regs_matrix[2][4] ,
         \regs_matrix[2][3] , \regs_matrix[2][2] , \regs_matrix[2][1] ,
         \regs_matrix[2][0] , \regs_matrix[1][16] , \regs_matrix[1][15] ,
         \regs_matrix[1][14] , \regs_matrix[1][13] , \regs_matrix[1][12] ,
         \regs_matrix[1][11] , \regs_matrix[1][10] , \regs_matrix[1][9] ,
         \regs_matrix[1][8] , \regs_matrix[1][7] , \regs_matrix[1][6] ,
         \regs_matrix[1][5] , \regs_matrix[1][4] , \regs_matrix[1][3] ,
         \regs_matrix[1][2] , \regs_matrix[1][1] , \regs_matrix[1][0] , n1, n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n15, n16, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n31, n32, n33, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n65, n66, n67, n68, n69, n70, n71, n72, n73, n75, n76, n77, n78, n79,
         n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93,
         n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127,
         n128, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138,
         n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149,
         n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160,
         n161, n162, n163, n164, n165, n166, n167, n168, n169, n170, n171,
         n172, n173, n174, n175, n176, n177, n178, n179, n180, n181, n182,
         n183, n184, n185, n186, n187, n188, n189, n190, n191, n192, n193,
         n194, n195, n196, n197, n198, n199, n200, n201, n202, n203, n204,
         n205, n206, n207, n208, n209, n210, n211, n212, n213, n214, n215,
         n216, n217, n218, n219, n220, n221, n222, n223, n224, n225, n226,
         n227, n228, n229, n230, n231, n232, n233, n234, n235, n236, n237,
         n238, n239, n240, n241, n242, n243, n244, n245, n246, n247, n248,
         n249, n250, n251, n252, n253, n254, n255, n256, n257, n258, n259,
         n260, n261, n262, n263, n264, n265, n266, n267, n268, n269, n270,
         n271, n272, n273, n274, n275, n276, n277, n278, n279, n280, n281,
         n282, n283, n284, n285, n286, n287, n288, n289, n290, n291, n292,
         n293, n294, n295, n296, n297, n298, n299, n300, n301, n302, n303,
         n304, n305, n306, n307, n308, n309, n310, n311, n312, n313, n314,
         n315, n316, n317, n318, n319, n320, n321, n322, n323, n324, n325,
         n326, n327, n328, n329, n330, n331, n332, n333, n334, n335, n336,
         n337, n338, n339, n340, n341, n342, n343, n344, n345, n346, n347,
         n348, n349, n350, n351, n352, n353, n354, n355, n356, n357, n358,
         n359, n360, n361, n362, n363, n364, n365, n366, n367, n368, n369,
         n370, n371, n372, n373, n374, n376, n377, n378, n379, n380, n381,
         n382, n383, n384, n385, n386, n387, n388, n389, n390, n391, n392,
         n393, n394, n395, n396, n397, n398, n399, n400, n401, n402, n403,
         n404, n405, n406, n407, n408, n409, n410, n411, n412, n413, n414,
         n415, n416, n417, n418, n419, n420, n421, n422, n423, n424, n425,
         n426, n427, n428, n429, n430, n431, n432, n433, n434, n435, n436,
         n437, n438, n439, n440, n441, n442, n443, n444, n445, n446, n447,
         n448, n449, n450, n451, n452, n453, n454, n455, n456, n457, n458,
         n459, n460, n461, n462, n463, n464, n465, n466, n467, n468, n469,
         n470, n471, n472, n473, n474, n475, n476, n477, n478, n479, n480,
         n481, n482, n483, n484, n485, n486, n487, n488, n489, n490, n491,
         n492, n493, n494, n495, n496, n497, n498, n499, n500, n501, n502,
         n503, n504, n505, n506, n507, n508, n509, n510, n511, n512, n513,
         n514, n515, n516, n517, n518, n519, n520, n521, n522, n523, n524,
         n525, n526, n527, n528, n529, n530, n531, n532, n533, n534, n535,
         n536, n537, n538, n539, n540, n541, n542, n543, n544, n545, n546,
         n547, n548, n549, n550, n551, n552, n553, n554, n555, n556, n557,
         n558, n559, n560, n561, n562, n563, n564, n565, n566, n567, n568,
         n569, n570, n571, n572, n573, n574, n575, n576, n577, n578, n579,
         n580, n581, n582, n583, n584, n585, n586, n587, n588, n589, n590,
         n591, n592, n593, n594, n595, n596, n597, n598, n599, n600, n601,
         n602, n603, n604, n605, n606, n607, n608, n609, n610, n611, n612,
         n613, n614, n615, n616, n617, n618, n619, n620, n621, n622, n623,
         n624, n625, n626, n627, n628, n629, n630, n631, n632, n633, n634,
         n635, n636, n637, n638, n639, n640, n641, n642, n643, n644, n645,
         n646, n647, n648, n649, n650, n651, n652, n654, n655, n656, n657,
         n658, n659, n660, n661, n662, n663, n664, n665, n666, n667, n668,
         n669, n670, n671, n672, n673, n674, n675, n676, n677, n678, n679,
         n680, n681, n682, n683, n684, n685, n686, n687, n688, n689, n690,
         n691, n692, n693, n694, n695, n696, n697, n698, n699, n700, n701,
         n702, n703, n704, n705;
  wire   [15:0] write_enables;
  assign N10 = r1_sel[0];
  assign N11 = r1_sel[1];
  assign N12 = r1_sel[2];
  assign N13 = r1_sel[3];
  assign N14 = r2_sel[0];
  assign N15 = r2_sel[1];
  assign N16 = r2_sel[2];
  assign N17 = r2_sel[3];

  INVX2 U2 ( .A(w_en), .Y(n1) );
  INVX2 U3 ( .A(w_sel[3]), .Y(n2) );
  INVX2 U4 ( .A(w_sel[2]), .Y(n3) );
  INVX2 U5 ( .A(w_sel[1]), .Y(n4) );
  NOR2X1 U6 ( .A(n5), .B(n6), .Y(write_enables[9]) );
  NOR2X1 U7 ( .A(n6), .B(n7), .Y(write_enables[8]) );
  NOR2X1 U8 ( .A(n8), .B(n9), .Y(write_enables[7]) );
  NOR2X1 U9 ( .A(n8), .B(n10), .Y(write_enables[6]) );
  NOR2X1 U10 ( .A(n9), .B(n11), .Y(write_enables[5]) );
  NOR2X1 U11 ( .A(n10), .B(n11), .Y(write_enables[4]) );
  NOR2X1 U12 ( .A(n9), .B(n12), .Y(write_enables[3]) );
  NOR2X1 U13 ( .A(n10), .B(n12), .Y(write_enables[2]) );
  NOR2X1 U14 ( .A(n6), .B(n9), .Y(write_enables[1]) );
  NAND3X1 U15 ( .A(w_en), .B(n2), .C(w_sel[0]), .Y(n9) );
  NOR2X1 U16 ( .A(n5), .B(n8), .Y(write_enables[15]) );
  NOR2X1 U17 ( .A(n7), .B(n8), .Y(write_enables[14]) );
  NAND2X1 U18 ( .A(w_sel[2]), .B(w_sel[1]), .Y(n8) );
  NOR2X1 U19 ( .A(n5), .B(n11), .Y(write_enables[13]) );
  NOR2X1 U20 ( .A(n7), .B(n11), .Y(write_enables[12]) );
  NAND2X1 U21 ( .A(w_sel[2]), .B(n4), .Y(n11) );
  NOR2X1 U22 ( .A(n5), .B(n12), .Y(write_enables[11]) );
  NAND3X1 U23 ( .A(w_sel[0]), .B(w_en), .C(w_sel[3]), .Y(n5) );
  NOR2X1 U24 ( .A(n7), .B(n12), .Y(write_enables[10]) );
  NAND2X1 U25 ( .A(w_sel[1]), .B(n3), .Y(n12) );
  NAND2X1 U26 ( .A(n13), .B(w_sel[3]), .Y(n7) );
  NOR2X1 U27 ( .A(n6), .B(n10), .Y(write_enables[0]) );
  NAND2X1 U28 ( .A(n13), .B(n2), .Y(n10) );
  NOR2X1 U29 ( .A(n1), .B(w_sel[0]), .Y(n13) );
  NAND2X1 U30 ( .A(n4), .B(n3), .Y(n6) );
  flex_sreg_NUM_BITS17_15 \genblk1[0].REGX  ( .clk(clk), .n_reset(n705), 
        .write_enable(write_enables[0]), .new_value({w_data[16], n697, n695, 
        n692, n689, n686, n683, n680, n677, n674, n671, n668, n665, n42, n44, 
        n658, n655}), .current_value(outreg_data) );
  flex_sreg_NUM_BITS17_14 \genblk1[1].REGX  ( .clk(clk), .n_reset(n698), 
        .write_enable(write_enables[1]), .new_value({w_data[16], n697, n52, 
        n54, n45, n58, n56, n62, n60, n64, n47, n667, n664, n41, n43, n657, 
        n655}), .current_value({\regs_matrix[1][16] , \regs_matrix[1][15] , 
        \regs_matrix[1][14] , \regs_matrix[1][13] , \regs_matrix[1][12] , 
        \regs_matrix[1][11] , \regs_matrix[1][10] , \regs_matrix[1][9] , 
        \regs_matrix[1][8] , \regs_matrix[1][7] , \regs_matrix[1][6] , 
        \regs_matrix[1][5] , \regs_matrix[1][4] , \regs_matrix[1][3] , 
        \regs_matrix[1][2] , \regs_matrix[1][1] , \regs_matrix[1][0] }) );
  flex_sreg_NUM_BITS17_13 \genblk1[2].REGX  ( .clk(clk), .n_reset(n698), 
        .write_enable(write_enables[2]), .new_value({w_data[16], n697, n695, 
        n692, n689, n686, n683, n680, n677, n674, n671, n668, n665, n41, n43, 
        n658, w_data[0]}), .current_value({\regs_matrix[2][16] , 
        \regs_matrix[2][15] , \regs_matrix[2][14] , \regs_matrix[2][13] , 
        \regs_matrix[2][12] , \regs_matrix[2][11] , \regs_matrix[2][10] , 
        \regs_matrix[2][9] , \regs_matrix[2][8] , \regs_matrix[2][7] , 
        \regs_matrix[2][6] , \regs_matrix[2][5] , \regs_matrix[2][4] , 
        \regs_matrix[2][3] , \regs_matrix[2][2] , \regs_matrix[2][1] , 
        \regs_matrix[2][0] }) );
  flex_sreg_NUM_BITS17_12 \genblk1[3].REGX  ( .clk(clk), .n_reset(n699), 
        .write_enable(write_enables[3]), .new_value({w_data[16], n697, n694, 
        n691, n688, n685, n682, n679, n676, n673, n670, n667, n664, n662, n660, 
        n657, n655}), .current_value({\regs_matrix[3][16] , 
        \regs_matrix[3][15] , \regs_matrix[3][14] , \regs_matrix[3][13] , 
        \regs_matrix[3][12] , \regs_matrix[3][11] , \regs_matrix[3][10] , 
        \regs_matrix[3][9] , \regs_matrix[3][8] , \regs_matrix[3][7] , 
        \regs_matrix[3][6] , \regs_matrix[3][5] , \regs_matrix[3][4] , 
        \regs_matrix[3][3] , \regs_matrix[3][2] , \regs_matrix[3][1] , 
        \regs_matrix[3][0] }) );
  flex_sreg_NUM_BITS17_11 \genblk1[4].REGX  ( .clk(clk), .n_reset(n699), 
        .write_enable(write_enables[4]), .new_value({w_data[16], n697, n695, 
        n692, n689, n686, n683, n680, n677, n674, n671, n668, n665, 
        w_data[3:2], n658, w_data[0]}), .current_value({\regs_matrix[4][16] , 
        \regs_matrix[4][15] , \regs_matrix[4][14] , \regs_matrix[4][13] , 
        \regs_matrix[4][12] , \regs_matrix[4][11] , \regs_matrix[4][10] , 
        \regs_matrix[4][9] , \regs_matrix[4][8] , \regs_matrix[4][7] , 
        \regs_matrix[4][6] , \regs_matrix[4][5] , \regs_matrix[4][4] , 
        \regs_matrix[4][3] , \regs_matrix[4][2] , \regs_matrix[4][1] , 
        \regs_matrix[4][0] }) );
  flex_sreg_NUM_BITS17_10 \genblk1[5].REGX  ( .clk(clk), .n_reset(n700), 
        .write_enable(write_enables[5]), .new_value({w_data[16], n697, n53, 
        n55, n46, n59, n57, n63, n61, n65, n48, n667, n664, n42, n44, n657, 
        n655}), .current_value({\regs_matrix[5][16] , \regs_matrix[5][15] , 
        \regs_matrix[5][14] , \regs_matrix[5][13] , \regs_matrix[5][12] , 
        \regs_matrix[5][11] , \regs_matrix[5][10] , \regs_matrix[5][9] , 
        \regs_matrix[5][8] , \regs_matrix[5][7] , \regs_matrix[5][6] , 
        \regs_matrix[5][5] , \regs_matrix[5][4] , \regs_matrix[5][3] , 
        \regs_matrix[5][2] , \regs_matrix[5][1] , \regs_matrix[5][0] }) );
  flex_sreg_NUM_BITS17_9 \genblk1[6].REGX  ( .clk(clk), .n_reset(n700), 
        .write_enable(write_enables[6]), .new_value({w_data[16], n697, n695, 
        n692, n689, n686, n683, n680, n677, n674, n671, n668, n665, n662, n660, 
        n658, w_data[0]}), .current_value({\regs_matrix[6][16] , 
        \regs_matrix[6][15] , \regs_matrix[6][14] , \regs_matrix[6][13] , 
        \regs_matrix[6][12] , \regs_matrix[6][11] , \regs_matrix[6][10] , 
        \regs_matrix[6][9] , \regs_matrix[6][8] , \regs_matrix[6][7] , 
        \regs_matrix[6][6] , \regs_matrix[6][5] , \regs_matrix[6][4] , 
        \regs_matrix[6][3] , \regs_matrix[6][2] , \regs_matrix[6][1] , 
        \regs_matrix[6][0] }) );
  flex_sreg_NUM_BITS17_8 \genblk1[7].REGX  ( .clk(clk), .n_reset(n701), 
        .write_enable(write_enables[7]), .new_value({w_data[16], n697, n52, 
        n54, n45, n58, n56, n62, n60, n64, n47, n667, n664, n41, n43, n657, 
        n655}), .current_value({\regs_matrix[7][16] , \regs_matrix[7][15] , 
        \regs_matrix[7][14] , \regs_matrix[7][13] , \regs_matrix[7][12] , 
        \regs_matrix[7][11] , \regs_matrix[7][10] , \regs_matrix[7][9] , 
        \regs_matrix[7][8] , \regs_matrix[7][7] , \regs_matrix[7][6] , 
        \regs_matrix[7][5] , \regs_matrix[7][4] , \regs_matrix[7][3] , 
        \regs_matrix[7][2] , \regs_matrix[7][1] , \regs_matrix[7][0] }) );
  flex_sreg_NUM_BITS17_7 \genblk1[8].REGX  ( .clk(clk), .n_reset(n701), 
        .write_enable(write_enables[8]), .new_value({w_data[16], n697, n53, 
        n55, n46, n59, n57, n63, n61, n65, n48, n668, n665, n42, n44, n658, 
        w_data[0]}), .current_value({\regs_matrix[8][16] , 
        \regs_matrix[8][15] , \regs_matrix[8][14] , \regs_matrix[8][13] , 
        \regs_matrix[8][12] , \regs_matrix[8][11] , \regs_matrix[8][10] , 
        \regs_matrix[8][9] , \regs_matrix[8][8] , \regs_matrix[8][7] , 
        \regs_matrix[8][6] , \regs_matrix[8][5] , \regs_matrix[8][4] , 
        \regs_matrix[8][3] , \regs_matrix[8][2] , \regs_matrix[8][1] , 
        \regs_matrix[8][0] }) );
  flex_sreg_NUM_BITS17_6 \genblk1[9].REGX  ( .clk(clk), .n_reset(n702), 
        .write_enable(write_enables[9]), .new_value({w_data[16], n697, n694, 
        n691, n688, n685, n682, n679, n676, n673, n670, n667, n664, n662, n660, 
        n657, n655}), .current_value({\regs_matrix[9][16] , 
        \regs_matrix[9][15] , \regs_matrix[9][14] , \regs_matrix[9][13] , 
        \regs_matrix[9][12] , \regs_matrix[9][11] , \regs_matrix[9][10] , 
        \regs_matrix[9][9] , \regs_matrix[9][8] , \regs_matrix[9][7] , 
        \regs_matrix[9][6] , \regs_matrix[9][5] , \regs_matrix[9][4] , 
        \regs_matrix[9][3] , \regs_matrix[9][2] , \regs_matrix[9][1] , 
        \regs_matrix[9][0] }) );
  flex_sreg_NUM_BITS17_5 \genblk1[10].REGX  ( .clk(clk), .n_reset(n702), 
        .write_enable(write_enables[10]), .new_value({w_data[16], n697, n52, 
        n54, n45, n58, n56, n62, n60, n64, n47, n668, n665, n41, n43, n658, 
        w_data[0]}), .current_value({\regs_matrix[10][16] , 
        \regs_matrix[10][15] , \regs_matrix[10][14] , \regs_matrix[10][13] , 
        \regs_matrix[10][12] , \regs_matrix[10][11] , \regs_matrix[10][10] , 
        \regs_matrix[10][9] , \regs_matrix[10][8] , \regs_matrix[10][7] , 
        \regs_matrix[10][6] , \regs_matrix[10][5] , \regs_matrix[10][4] , 
        \regs_matrix[10][3] , \regs_matrix[10][2] , \regs_matrix[10][1] , 
        \regs_matrix[10][0] }) );
  flex_sreg_NUM_BITS17_4 \genblk1[11].REGX  ( .clk(clk), .n_reset(n703), 
        .write_enable(write_enables[11]), .new_value({w_data[16], n697, n53, 
        n55, n46, n59, n57, n63, n61, n65, n48, n667, n664, n42, n44, n657, 
        n655}), .current_value({\regs_matrix[11][16] , \regs_matrix[11][15] , 
        \regs_matrix[11][14] , \regs_matrix[11][13] , \regs_matrix[11][12] , 
        \regs_matrix[11][11] , \regs_matrix[11][10] , \regs_matrix[11][9] , 
        \regs_matrix[11][8] , \regs_matrix[11][7] , \regs_matrix[11][6] , 
        \regs_matrix[11][5] , \regs_matrix[11][4] , \regs_matrix[11][3] , 
        \regs_matrix[11][2] , \regs_matrix[11][1] , \regs_matrix[11][0] }) );
  flex_sreg_NUM_BITS17_3 \genblk1[12].REGX  ( .clk(clk), .n_reset(n703), 
        .write_enable(write_enables[12]), .new_value({w_data[16], n697, n694, 
        n691, n688, n685, n682, n679, n676, n673, n670, n668, n665, n662, n660, 
        n658, w_data[0]}), .current_value({\regs_matrix[12][16] , 
        \regs_matrix[12][15] , \regs_matrix[12][14] , \regs_matrix[12][13] , 
        \regs_matrix[12][12] , \regs_matrix[12][11] , \regs_matrix[12][10] , 
        \regs_matrix[12][9] , \regs_matrix[12][8] , \regs_matrix[12][7] , 
        \regs_matrix[12][6] , \regs_matrix[12][5] , \regs_matrix[12][4] , 
        \regs_matrix[12][3] , \regs_matrix[12][2] , \regs_matrix[12][1] , 
        \regs_matrix[12][0] }) );
  flex_sreg_NUM_BITS17_2 \genblk1[13].REGX  ( .clk(clk), .n_reset(n704), 
        .write_enable(write_enables[13]), .new_value({w_data[16], n697, n52, 
        n54, n45, n58, n56, n62, n60, n64, n47, n667, n664, n41, n43, n657, 
        n655}), .current_value({\regs_matrix[13][16] , \regs_matrix[13][15] , 
        \regs_matrix[13][14] , \regs_matrix[13][13] , \regs_matrix[13][12] , 
        \regs_matrix[13][11] , \regs_matrix[13][10] , \regs_matrix[13][9] , 
        \regs_matrix[13][8] , \regs_matrix[13][7] , \regs_matrix[13][6] , 
        \regs_matrix[13][5] , \regs_matrix[13][4] , \regs_matrix[13][3] , 
        \regs_matrix[13][2] , \regs_matrix[13][1] , \regs_matrix[13][0] }) );
  flex_sreg_NUM_BITS17_1 \genblk1[14].REGX  ( .clk(clk), .n_reset(n704), 
        .write_enable(write_enables[14]), .new_value({w_data[16], n697, n53, 
        n55, n46, n59, n57, n63, n61, n65, n48, n668, n665, n42, n44, n658, 
        w_data[0]}), .current_value({\regs_matrix[14][16] , 
        \regs_matrix[14][15] , \regs_matrix[14][14] , \regs_matrix[14][13] , 
        \regs_matrix[14][12] , \regs_matrix[14][11] , \regs_matrix[14][10] , 
        \regs_matrix[14][9] , \regs_matrix[14][8] , \regs_matrix[14][7] , 
        \regs_matrix[14][6] , \regs_matrix[14][5] , \regs_matrix[14][4] , 
        \regs_matrix[14][3] , \regs_matrix[14][2] , \regs_matrix[14][1] , 
        \regs_matrix[14][0] }) );
  flex_sreg_NUM_BITS17_0 \genblk1[15].REGX  ( .clk(clk), .n_reset(n705), 
        .write_enable(write_enables[15]), .new_value({w_data[16], n697, n694, 
        n691, n688, n685, n682, n679, n676, n673, n670, n667, n664, n662, n660, 
        n657, n655}), .current_value({\regs_matrix[15][16] , 
        \regs_matrix[15][15] , \regs_matrix[15][14] , \regs_matrix[15][13] , 
        \regs_matrix[15][12] , \regs_matrix[15][11] , \regs_matrix[15][10] , 
        \regs_matrix[15][9] , \regs_matrix[15][8] , \regs_matrix[15][7] , 
        \regs_matrix[15][6] , \regs_matrix[15][5] , \regs_matrix[15][4] , 
        \regs_matrix[15][3] , \regs_matrix[15][2] , \regs_matrix[15][1] , 
        \regs_matrix[15][0] }) );
  AND2X1 U31 ( .A(N14), .B(N15), .Y(n650) );
  BUFX4 U32 ( .A(n709), .Y(r2_data[2]) );
  BUFX4 U33 ( .A(n339), .Y(n341) );
  INVX4 U34 ( .A(n100), .Y(n364) );
  INVX8 U35 ( .A(n33), .Y(r1_data[2]) );
  INVX4 U36 ( .A(n390), .Y(n643) );
  INVX8 U37 ( .A(n334), .Y(n338) );
  INVX8 U38 ( .A(n640), .Y(n641) );
  INVX4 U39 ( .A(n387), .Y(n634) );
  INVX8 U40 ( .A(n350), .Y(n351) );
  INVX4 U41 ( .A(n350), .Y(n352) );
  INVX4 U42 ( .A(n364), .Y(n365) );
  INVX2 U43 ( .A(n648), .Y(n647) );
  INVX2 U44 ( .A(n369), .Y(n367) );
  INVX2 U45 ( .A(n341), .Y(n24) );
  INVX4 U46 ( .A(n624), .Y(n627) );
  INVX4 U47 ( .A(n335), .Y(n337) );
  BUFX2 U48 ( .A(n28), .Y(n335) );
  INVX2 U49 ( .A(n341), .Y(n344) );
  INVX4 U50 ( .A(n21), .Y(n628) );
  BUFX2 U51 ( .A(n28), .Y(n334) );
  INVX2 U52 ( .A(n79), .Y(n355) );
  INVX4 U53 ( .A(n342), .Y(n343) );
  BUFX2 U54 ( .A(n339), .Y(n342) );
  INVX2 U55 ( .A(n99), .Y(n360) );
  INVX2 U56 ( .A(n98), .Y(n356) );
  INVX2 U57 ( .A(n94), .Y(n346) );
  INVX2 U58 ( .A(n710), .Y(n652) );
  INVX4 U59 ( .A(n73), .Y(r1_data[15]) );
  INVX2 U60 ( .A(n706), .Y(n73) );
  INVX2 U61 ( .A(N12), .Y(n15) );
  INVX4 U62 ( .A(n15), .Y(n16) );
  AND2X2 U63 ( .A(n51), .B(n50), .Y(r2_data[7]) );
  INVX2 U64 ( .A(w_data[3]), .Y(n661) );
  AND2X2 U65 ( .A(n66), .B(n67), .Y(r2_data[12]) );
  INVX1 U66 ( .A(n383), .Y(n21) );
  BUFX2 U67 ( .A(n28), .Y(n336) );
  INVX2 U68 ( .A(n336), .Y(n25) );
  INVX2 U69 ( .A(w_data[2]), .Y(n659) );
  AND2X2 U70 ( .A(n39), .B(n38), .Y(n19) );
  INVX2 U71 ( .A(N16), .Y(n616) );
  INVX4 U72 ( .A(n39), .Y(n20) );
  INVX4 U73 ( .A(N14), .Y(n39) );
  AND2X2 U74 ( .A(N11), .B(N10), .Y(n80) );
  INVX1 U75 ( .A(n383), .Y(n22) );
  INVX1 U76 ( .A(n383), .Y(n624) );
  INVX1 U77 ( .A(n25), .Y(n23) );
  AND2X2 U78 ( .A(N16), .B(N15), .Y(n38) );
  INVX2 U79 ( .A(n708), .Y(n33) );
  INVX2 U80 ( .A(n336), .Y(n26) );
  INVX2 U81 ( .A(n92), .Y(n28) );
  INVX4 U82 ( .A(n346), .Y(n348) );
  INVX4 U83 ( .A(n346), .Y(n349) );
  INVX1 U84 ( .A(n345), .Y(n27) );
  INVX2 U85 ( .A(n707), .Y(n29) );
  INVX4 U86 ( .A(n29), .Y(r1_data[9]) );
  INVX4 U87 ( .A(n643), .Y(n31) );
  BUFX4 U88 ( .A(n339), .Y(n340) );
  BUFX2 U89 ( .A(N11), .Y(n32) );
  INVX2 U90 ( .A(n620), .Y(n35) );
  INVX4 U91 ( .A(n620), .Y(n36) );
  INVX4 U92 ( .A(n95), .Y(n350) );
  MUX2X1 U93 ( .B(n234), .A(n233), .S(n369), .Y(r1_data[10]) );
  INVX4 U94 ( .A(n16), .Y(n330) );
  MUX2X1 U95 ( .B(n425), .A(n426), .S(n647), .Y(r2_data[3]) );
  INVX8 U96 ( .A(n696), .Y(n697) );
  BUFX2 U97 ( .A(n632), .Y(n37) );
  INVX1 U98 ( .A(N14), .Y(n40) );
  INVX2 U99 ( .A(n661), .Y(n41) );
  INVX2 U100 ( .A(n661), .Y(n42) );
  INVX2 U101 ( .A(n659), .Y(n43) );
  INVX2 U102 ( .A(n659), .Y(n44) );
  INVX2 U103 ( .A(n687), .Y(n45) );
  INVX2 U104 ( .A(n687), .Y(n46) );
  INVX4 U105 ( .A(w_data[12]), .Y(n687) );
  INVX4 U106 ( .A(w_data[15]), .Y(n696) );
  INVX2 U107 ( .A(n669), .Y(n47) );
  INVX2 U108 ( .A(n669), .Y(n48) );
  INVX4 U109 ( .A(w_data[6]), .Y(n669) );
  INVX4 U110 ( .A(n360), .Y(n71) );
  NAND2X1 U111 ( .A(n481), .B(n49), .Y(n50) );
  NAND2X1 U112 ( .A(n482), .B(n647), .Y(n51) );
  INVX1 U113 ( .A(n647), .Y(n49) );
  INVX2 U114 ( .A(n693), .Y(n52) );
  INVX2 U115 ( .A(n693), .Y(n53) );
  INVX4 U116 ( .A(w_data[14]), .Y(n693) );
  INVX2 U117 ( .A(n690), .Y(n54) );
  INVX2 U118 ( .A(n690), .Y(n55) );
  INVX4 U119 ( .A(w_data[13]), .Y(n690) );
  INVX2 U120 ( .A(n681), .Y(n56) );
  INVX2 U121 ( .A(n681), .Y(n57) );
  INVX4 U122 ( .A(w_data[10]), .Y(n681) );
  INVX2 U123 ( .A(n684), .Y(n58) );
  INVX2 U124 ( .A(n684), .Y(n59) );
  INVX4 U125 ( .A(w_data[11]), .Y(n684) );
  INVX2 U126 ( .A(n648), .Y(n646) );
  INVX2 U127 ( .A(n675), .Y(n60) );
  INVX2 U128 ( .A(n675), .Y(n61) );
  INVX4 U129 ( .A(w_data[8]), .Y(n675) );
  INVX2 U130 ( .A(n678), .Y(n62) );
  INVX2 U131 ( .A(n678), .Y(n63) );
  INVX4 U132 ( .A(w_data[9]), .Y(n678) );
  INVX2 U133 ( .A(n672), .Y(n64) );
  INVX2 U134 ( .A(n672), .Y(n65) );
  INVX4 U135 ( .A(w_data[7]), .Y(n672) );
  NAND2X1 U136 ( .A(n550), .B(n49), .Y(n66) );
  NAND2X1 U137 ( .A(n551), .B(n646), .Y(n67) );
  INVX2 U138 ( .A(n346), .Y(n68) );
  INVX2 U139 ( .A(n346), .Y(n69) );
  INVX2 U140 ( .A(n360), .Y(n70) );
  INVX2 U141 ( .A(n637), .Y(n72) );
  INVX4 U142 ( .A(n79), .Y(n354) );
  INVX2 U143 ( .A(n356), .Y(n75) );
  INVX2 U144 ( .A(n356), .Y(n76) );
  INVX2 U145 ( .A(n637), .Y(n78) );
  INVX4 U146 ( .A(n79), .Y(n353) );
  INVX2 U147 ( .A(w_data[4]), .Y(n663) );
  INVX2 U148 ( .A(w_data[5]), .Y(n666) );
  INVX2 U149 ( .A(w_data[1]), .Y(n656) );
  INVX2 U150 ( .A(w_data[0]), .Y(n654) );
  INVX2 U151 ( .A(N17), .Y(n648) );
  INVX2 U152 ( .A(n637), .Y(n77) );
  INVX2 U153 ( .A(n637), .Y(n639) );
  INVX2 U154 ( .A(n637), .Y(n638) );
  INVX4 U155 ( .A(n388), .Y(n637) );
  INVX2 U156 ( .A(n356), .Y(n359) );
  INVX2 U157 ( .A(n356), .Y(n358) );
  INVX2 U158 ( .A(n356), .Y(n357) );
  AND2X2 U159 ( .A(n80), .B(n330), .Y(n79) );
  INVX2 U160 ( .A(n360), .Y(n363) );
  INVX2 U161 ( .A(n360), .Y(n362) );
  INVX2 U162 ( .A(n369), .Y(n368) );
  INVX2 U163 ( .A(n346), .Y(n347) );
  INVX2 U164 ( .A(n360), .Y(n361) );
  INVX2 U165 ( .A(n672), .Y(n674) );
  INVX2 U166 ( .A(n678), .Y(n680) );
  INVX2 U167 ( .A(n693), .Y(n695) );
  INVX2 U168 ( .A(n675), .Y(n677) );
  INVX2 U169 ( .A(n669), .Y(n671) );
  INVX2 U170 ( .A(n684), .Y(n686) );
  INVX2 U171 ( .A(n672), .Y(n673) );
  INVX2 U172 ( .A(n681), .Y(n683) );
  INVX2 U173 ( .A(n687), .Y(n689) );
  INVX2 U174 ( .A(n690), .Y(n692) );
  INVX2 U175 ( .A(n675), .Y(n676) );
  INVX2 U176 ( .A(n669), .Y(n670) );
  INVX2 U177 ( .A(n678), .Y(n679) );
  INVX2 U178 ( .A(n693), .Y(n694) );
  INVX2 U179 ( .A(n684), .Y(n685) );
  INVX2 U180 ( .A(n681), .Y(n682) );
  INVX2 U181 ( .A(n687), .Y(n688) );
  INVX2 U182 ( .A(n690), .Y(n691) );
  INVX2 U183 ( .A(n659), .Y(n660) );
  INVX2 U184 ( .A(n661), .Y(n662) );
  INVX2 U185 ( .A(n663), .Y(n665) );
  INVX2 U186 ( .A(n663), .Y(n664) );
  INVX2 U187 ( .A(n666), .Y(n668) );
  INVX2 U188 ( .A(n666), .Y(n667) );
  INVX2 U189 ( .A(n656), .Y(n658) );
  INVX2 U190 ( .A(n656), .Y(n657) );
  INVX2 U191 ( .A(n654), .Y(n655) );
  INVX1 U192 ( .A(N13), .Y(n369) );
  BUFX2 U193 ( .A(n_reset), .Y(n698) );
  BUFX2 U194 ( .A(n_reset), .Y(n699) );
  BUFX2 U195 ( .A(n_reset), .Y(n700) );
  BUFX2 U196 ( .A(n_reset), .Y(n701) );
  BUFX2 U197 ( .A(n_reset), .Y(n702) );
  BUFX2 U198 ( .A(n_reset), .Y(n703) );
  BUFX2 U199 ( .A(n_reset), .Y(n704) );
  BUFX2 U200 ( .A(n_reset), .Y(n705) );
  AOI22X1 U201 ( .A(n84), .B(n83), .C(n82), .D(n81), .Y(n85) );
  INVX2 U202 ( .A(n85), .Y(r1_data[16]) );
  MUX2X1 U203 ( .B(n86), .A(n87), .S(n367), .Y(r1_data[0]) );
  NAND2X1 U204 ( .A(n88), .B(n89), .Y(n87) );
  NOR2X1 U205 ( .A(n91), .B(n90), .Y(n89) );
  OAI22X1 U206 ( .A(\regs_matrix[8][0] ), .B(n25), .C(\regs_matrix[10][0] ), 
        .D(n343), .Y(n91) );
  OAI22X1 U207 ( .A(\regs_matrix[12][0] ), .B(n348), .C(\regs_matrix[14][0] ), 
        .D(n352), .Y(n90) );
  NOR2X1 U208 ( .A(n97), .B(n96), .Y(n88) );
  OAI22X1 U209 ( .A(\regs_matrix[11][0] ), .B(n354), .C(\regs_matrix[9][0] ), 
        .D(n359), .Y(n97) );
  OAI22X1 U210 ( .A(\regs_matrix[13][0] ), .B(n362), .C(\regs_matrix[15][0] ), 
        .D(n366), .Y(n96) );
  NAND2X1 U211 ( .A(n101), .B(n102), .Y(n86) );
  NOR2X1 U212 ( .A(n104), .B(n103), .Y(n102) );
  OAI22X1 U213 ( .A(outreg_data[0]), .B(n26), .C(\regs_matrix[2][0] ), .D(n343), .Y(n104) );
  OAI22X1 U214 ( .A(\regs_matrix[4][0] ), .B(n347), .C(\regs_matrix[6][0] ), 
        .D(n352), .Y(n103) );
  NOR2X1 U215 ( .A(n105), .B(n106), .Y(n101) );
  OAI22X1 U216 ( .A(\regs_matrix[3][0] ), .B(n353), .C(\regs_matrix[1][0] ), 
        .D(n76), .Y(n106) );
  OAI22X1 U217 ( .A(\regs_matrix[5][0] ), .B(n362), .C(\regs_matrix[7][0] ), 
        .D(n365), .Y(n105) );
  MUX2X1 U218 ( .B(n107), .A(n108), .S(n368), .Y(r1_data[1]) );
  NAND2X1 U219 ( .A(n109), .B(n110), .Y(n108) );
  NOR2X1 U220 ( .A(n111), .B(n112), .Y(n110) );
  OAI22X1 U221 ( .A(\regs_matrix[8][1] ), .B(n337), .C(\regs_matrix[10][1] ), 
        .D(n343), .Y(n112) );
  OAI22X1 U222 ( .A(\regs_matrix[12][1] ), .B(n69), .C(\regs_matrix[14][1] ), 
        .D(n351), .Y(n111) );
  NOR2X1 U223 ( .A(n113), .B(n114), .Y(n109) );
  OAI22X1 U224 ( .A(\regs_matrix[11][1] ), .B(n354), .C(\regs_matrix[9][1] ), 
        .D(n76), .Y(n114) );
  OAI22X1 U225 ( .A(\regs_matrix[13][1] ), .B(n71), .C(\regs_matrix[15][1] ), 
        .D(n366), .Y(n113) );
  NAND2X1 U226 ( .A(n115), .B(n116), .Y(n107) );
  NOR2X1 U227 ( .A(n117), .B(n118), .Y(n116) );
  OAI22X1 U228 ( .A(outreg_data[1]), .B(n337), .C(\regs_matrix[2][1] ), .D(
        n343), .Y(n118) );
  OAI22X1 U229 ( .A(\regs_matrix[4][1] ), .B(n68), .C(\regs_matrix[6][1] ), 
        .D(n351), .Y(n117) );
  NOR2X1 U230 ( .A(n119), .B(n120), .Y(n115) );
  OAI22X1 U231 ( .A(\regs_matrix[3][1] ), .B(n353), .C(\regs_matrix[1][1] ), 
        .D(n75), .Y(n120) );
  OAI22X1 U232 ( .A(\regs_matrix[5][1] ), .B(n71), .C(\regs_matrix[7][1] ), 
        .D(n366), .Y(n119) );
  MUX2X1 U233 ( .B(n121), .A(n122), .S(n367), .Y(n708) );
  NAND2X1 U234 ( .A(n124), .B(n123), .Y(n122) );
  NOR2X1 U235 ( .A(n125), .B(n126), .Y(n124) );
  OAI22X1 U236 ( .A(\regs_matrix[8][2] ), .B(n26), .C(\regs_matrix[10][2] ), 
        .D(n343), .Y(n126) );
  OAI22X1 U237 ( .A(\regs_matrix[12][2] ), .B(n349), .C(\regs_matrix[14][2] ), 
        .D(n351), .Y(n125) );
  NOR2X1 U238 ( .A(n127), .B(n128), .Y(n123) );
  OAI22X1 U239 ( .A(\regs_matrix[11][2] ), .B(n353), .C(\regs_matrix[9][2] ), 
        .D(n358), .Y(n128) );
  OAI22X1 U240 ( .A(\regs_matrix[13][2] ), .B(n71), .C(\regs_matrix[15][2] ), 
        .D(n365), .Y(n127) );
  NAND2X1 U241 ( .A(n129), .B(n130), .Y(n121) );
  NOR2X1 U242 ( .A(n131), .B(n132), .Y(n130) );
  OAI22X1 U243 ( .A(outreg_data[2]), .B(n26), .C(\regs_matrix[2][2] ), .D(n343), .Y(n132) );
  OAI22X1 U244 ( .A(\regs_matrix[4][2] ), .B(n349), .C(\regs_matrix[6][2] ), 
        .D(n351), .Y(n131) );
  NOR2X1 U245 ( .A(n133), .B(n134), .Y(n129) );
  OAI22X1 U246 ( .A(n354), .B(\regs_matrix[3][2] ), .C(\regs_matrix[1][2] ), 
        .D(n358), .Y(n134) );
  OAI22X1 U247 ( .A(\regs_matrix[5][2] ), .B(n71), .C(\regs_matrix[7][2] ), 
        .D(n365), .Y(n133) );
  MUX2X1 U248 ( .B(n135), .A(n136), .S(n368), .Y(r1_data[3]) );
  NAND2X1 U249 ( .A(n137), .B(n138), .Y(n136) );
  NOR2X1 U250 ( .A(n139), .B(n140), .Y(n138) );
  OAI22X1 U251 ( .A(\regs_matrix[8][3] ), .B(n26), .C(\regs_matrix[10][3] ), 
        .D(n343), .Y(n140) );
  OAI22X1 U252 ( .A(\regs_matrix[12][3] ), .B(n348), .C(\regs_matrix[14][3] ), 
        .D(n352), .Y(n139) );
  NOR2X1 U253 ( .A(n141), .B(n142), .Y(n137) );
  OAI22X1 U254 ( .A(\regs_matrix[11][3] ), .B(n354), .C(\regs_matrix[9][3] ), 
        .D(n357), .Y(n142) );
  OAI22X1 U255 ( .A(\regs_matrix[13][3] ), .B(n361), .C(\regs_matrix[15][3] ), 
        .D(n366), .Y(n141) );
  NAND2X1 U256 ( .A(n143), .B(n144), .Y(n135) );
  NOR2X1 U257 ( .A(n145), .B(n146), .Y(n144) );
  OAI22X1 U258 ( .A(outreg_data[3]), .B(n25), .C(\regs_matrix[2][3] ), .D(n343), .Y(n146) );
  OAI22X1 U259 ( .A(\regs_matrix[4][3] ), .B(n348), .C(\regs_matrix[6][3] ), 
        .D(n352), .Y(n145) );
  NOR2X1 U260 ( .A(n147), .B(n148), .Y(n143) );
  OAI22X1 U261 ( .A(\regs_matrix[3][3] ), .B(n355), .C(\regs_matrix[1][3] ), 
        .D(n359), .Y(n148) );
  OAI22X1 U262 ( .A(\regs_matrix[5][3] ), .B(n361), .C(\regs_matrix[7][3] ), 
        .D(n366), .Y(n147) );
  MUX2X1 U263 ( .B(n149), .A(n150), .S(n367), .Y(r1_data[4]) );
  NAND2X1 U264 ( .A(n151), .B(n152), .Y(n150) );
  NOR2X1 U265 ( .A(n153), .B(n154), .Y(n152) );
  OAI22X1 U266 ( .A(\regs_matrix[8][4] ), .B(n337), .C(\regs_matrix[10][4] ), 
        .D(n24), .Y(n154) );
  OAI22X1 U267 ( .A(\regs_matrix[12][4] ), .B(n348), .C(\regs_matrix[14][4] ), 
        .D(n352), .Y(n153) );
  NOR2X1 U268 ( .A(n155), .B(n156), .Y(n151) );
  OAI22X1 U269 ( .A(\regs_matrix[11][4] ), .B(n354), .C(\regs_matrix[9][4] ), 
        .D(n76), .Y(n156) );
  OAI22X1 U270 ( .A(\regs_matrix[13][4] ), .B(n70), .C(\regs_matrix[15][4] ), 
        .D(n366), .Y(n155) );
  NAND2X1 U271 ( .A(n157), .B(n158), .Y(n149) );
  NOR2X1 U272 ( .A(n159), .B(n160), .Y(n158) );
  OAI22X1 U273 ( .A(outreg_data[4]), .B(n337), .C(\regs_matrix[2][4] ), .D(n24), .Y(n160) );
  OAI22X1 U274 ( .A(\regs_matrix[4][4] ), .B(n348), .C(\regs_matrix[6][4] ), 
        .D(n351), .Y(n159) );
  NOR2X1 U275 ( .A(n161), .B(n162), .Y(n157) );
  OAI22X1 U276 ( .A(\regs_matrix[3][4] ), .B(n353), .C(\regs_matrix[1][4] ), 
        .D(n357), .Y(n162) );
  OAI22X1 U277 ( .A(\regs_matrix[5][4] ), .B(n70), .C(\regs_matrix[7][4] ), 
        .D(n366), .Y(n161) );
  MUX2X1 U278 ( .B(n163), .A(n164), .S(n368), .Y(r1_data[5]) );
  NAND2X1 U279 ( .A(n165), .B(n166), .Y(n164) );
  NOR2X1 U280 ( .A(n167), .B(n168), .Y(n166) );
  OAI22X1 U281 ( .A(\regs_matrix[8][5] ), .B(n337), .C(\regs_matrix[10][5] ), 
        .D(n344), .Y(n168) );
  OAI22X1 U282 ( .A(\regs_matrix[12][5] ), .B(n348), .C(\regs_matrix[14][5] ), 
        .D(n351), .Y(n167) );
  NOR2X1 U283 ( .A(n169), .B(n170), .Y(n165) );
  OAI22X1 U284 ( .A(\regs_matrix[11][5] ), .B(n353), .C(\regs_matrix[9][5] ), 
        .D(n76), .Y(n170) );
  OAI22X1 U285 ( .A(\regs_matrix[13][5] ), .B(n71), .C(\regs_matrix[15][5] ), 
        .D(n365), .Y(n169) );
  NAND2X1 U286 ( .A(n171), .B(n172), .Y(n163) );
  NOR2X1 U287 ( .A(n173), .B(n174), .Y(n172) );
  OAI22X1 U288 ( .A(outreg_data[5]), .B(n337), .C(\regs_matrix[2][5] ), .D(
        n344), .Y(n174) );
  OAI22X1 U289 ( .A(\regs_matrix[4][5] ), .B(n349), .C(\regs_matrix[6][5] ), 
        .D(n351), .Y(n173) );
  NOR2X1 U290 ( .A(n175), .B(n176), .Y(n171) );
  OAI22X1 U291 ( .A(\regs_matrix[3][5] ), .B(n355), .C(\regs_matrix[1][5] ), 
        .D(n357), .Y(n176) );
  OAI22X1 U292 ( .A(\regs_matrix[5][5] ), .B(n361), .C(\regs_matrix[7][5] ), 
        .D(n365), .Y(n175) );
  MUX2X1 U293 ( .B(n177), .A(n178), .S(n367), .Y(r1_data[6]) );
  NAND2X1 U294 ( .A(n179), .B(n180), .Y(n178) );
  NOR2X1 U295 ( .A(n181), .B(n182), .Y(n180) );
  OAI22X1 U296 ( .A(\regs_matrix[8][6] ), .B(n337), .C(\regs_matrix[10][6] ), 
        .D(n24), .Y(n182) );
  OAI22X1 U297 ( .A(\regs_matrix[12][6] ), .B(n69), .C(\regs_matrix[14][6] ), 
        .D(n352), .Y(n181) );
  NOR2X1 U298 ( .A(n183), .B(n184), .Y(n179) );
  OAI22X1 U299 ( .A(\regs_matrix[11][6] ), .B(n354), .C(\regs_matrix[9][6] ), 
        .D(n359), .Y(n184) );
  OAI22X1 U300 ( .A(\regs_matrix[13][6] ), .B(n363), .C(\regs_matrix[15][6] ), 
        .D(n366), .Y(n183) );
  NAND2X1 U301 ( .A(n185), .B(n186), .Y(n177) );
  NOR2X1 U302 ( .A(n187), .B(n188), .Y(n186) );
  OAI22X1 U303 ( .A(outreg_data[6]), .B(n337), .C(\regs_matrix[2][6] ), .D(n24), .Y(n188) );
  OAI22X1 U304 ( .A(\regs_matrix[4][6] ), .B(n348), .C(\regs_matrix[6][6] ), 
        .D(n351), .Y(n187) );
  NOR2X1 U305 ( .A(n189), .B(n190), .Y(n185) );
  OAI22X1 U306 ( .A(\regs_matrix[3][6] ), .B(n353), .C(\regs_matrix[1][6] ), 
        .D(n359), .Y(n190) );
  OAI22X1 U307 ( .A(\regs_matrix[5][6] ), .B(n361), .C(\regs_matrix[7][6] ), 
        .D(n366), .Y(n189) );
  MUX2X1 U308 ( .B(n191), .A(n192), .S(n368), .Y(r1_data[7]) );
  NAND2X1 U309 ( .A(n193), .B(n194), .Y(n192) );
  NOR2X1 U310 ( .A(n195), .B(n196), .Y(n194) );
  OAI22X1 U311 ( .A(\regs_matrix[8][7] ), .B(n337), .C(\regs_matrix[10][7] ), 
        .D(n24), .Y(n196) );
  OAI22X1 U312 ( .A(\regs_matrix[12][7] ), .B(n348), .C(\regs_matrix[14][7] ), 
        .D(n351), .Y(n195) );
  NOR2X1 U313 ( .A(n197), .B(n198), .Y(n193) );
  OAI22X1 U314 ( .A(\regs_matrix[11][7] ), .B(n353), .C(\regs_matrix[9][7] ), 
        .D(n357), .Y(n198) );
  OAI22X1 U315 ( .A(\regs_matrix[13][7] ), .B(n70), .C(\regs_matrix[15][7] ), 
        .D(n366), .Y(n197) );
  NAND2X1 U316 ( .A(n199), .B(n200), .Y(n191) );
  NOR2X1 U317 ( .A(n201), .B(n202), .Y(n200) );
  OAI22X1 U318 ( .A(outreg_data[7]), .B(n337), .C(\regs_matrix[2][7] ), .D(n24), .Y(n202) );
  OAI22X1 U319 ( .A(\regs_matrix[4][7] ), .B(n68), .C(\regs_matrix[6][7] ), 
        .D(n351), .Y(n201) );
  NOR2X1 U320 ( .A(n203), .B(n204), .Y(n199) );
  OAI22X1 U321 ( .A(\regs_matrix[3][7] ), .B(n354), .C(\regs_matrix[1][7] ), 
        .D(n359), .Y(n204) );
  OAI22X1 U322 ( .A(\regs_matrix[5][7] ), .B(n362), .C(\regs_matrix[7][7] ), 
        .D(n366), .Y(n203) );
  MUX2X1 U323 ( .B(n205), .A(n206), .S(n367), .Y(r1_data[8]) );
  NAND2X1 U324 ( .A(n207), .B(n208), .Y(n206) );
  NOR2X1 U325 ( .A(n209), .B(n210), .Y(n208) );
  OAI22X1 U326 ( .A(\regs_matrix[8][8] ), .B(n337), .C(\regs_matrix[10][8] ), 
        .D(n24), .Y(n210) );
  OAI22X1 U327 ( .A(\regs_matrix[12][8] ), .B(n347), .C(\regs_matrix[14][8] ), 
        .D(n351), .Y(n209) );
  NOR2X1 U328 ( .A(n211), .B(n212), .Y(n207) );
  OAI22X1 U329 ( .A(\regs_matrix[11][8] ), .B(n355), .C(\regs_matrix[9][8] ), 
        .D(n76), .Y(n212) );
  OAI22X1 U330 ( .A(\regs_matrix[13][8] ), .B(n361), .C(\regs_matrix[15][8] ), 
        .D(n366), .Y(n211) );
  NAND2X1 U331 ( .A(n213), .B(n214), .Y(n205) );
  NOR2X1 U332 ( .A(n215), .B(n216), .Y(n214) );
  OAI22X1 U333 ( .A(outreg_data[8]), .B(n337), .C(\regs_matrix[2][8] ), .D(n24), .Y(n216) );
  OAI22X1 U334 ( .A(\regs_matrix[4][8] ), .B(n69), .C(\regs_matrix[6][8] ), 
        .D(n351), .Y(n215) );
  NOR2X1 U335 ( .A(n217), .B(n218), .Y(n213) );
  OAI22X1 U336 ( .A(\regs_matrix[3][8] ), .B(n354), .C(\regs_matrix[1][8] ), 
        .D(n75), .Y(n218) );
  OAI22X1 U337 ( .A(\regs_matrix[5][8] ), .B(n363), .C(\regs_matrix[7][8] ), 
        .D(n366), .Y(n217) );
  MUX2X1 U338 ( .B(n219), .A(n220), .S(n368), .Y(n707) );
  NAND2X1 U339 ( .A(n221), .B(n222), .Y(n220) );
  NOR2X1 U340 ( .A(n223), .B(n224), .Y(n222) );
  OAI22X1 U341 ( .A(\regs_matrix[8][9] ), .B(n337), .C(\regs_matrix[10][9] ), 
        .D(n344), .Y(n224) );
  OAI22X1 U342 ( .A(\regs_matrix[12][9] ), .B(n347), .C(\regs_matrix[14][9] ), 
        .D(n351), .Y(n223) );
  NOR2X1 U343 ( .A(n225), .B(n226), .Y(n221) );
  OAI22X1 U344 ( .A(\regs_matrix[11][9] ), .B(n354), .C(\regs_matrix[9][9] ), 
        .D(n75), .Y(n226) );
  OAI22X1 U345 ( .A(\regs_matrix[13][9] ), .B(n363), .C(\regs_matrix[15][9] ), 
        .D(n365), .Y(n225) );
  NAND2X1 U346 ( .A(n227), .B(n228), .Y(n219) );
  NOR2X1 U347 ( .A(n229), .B(n230), .Y(n228) );
  OAI22X1 U348 ( .A(outreg_data[9]), .B(n337), .C(\regs_matrix[2][9] ), .D(
        n344), .Y(n230) );
  OAI22X1 U349 ( .A(\regs_matrix[4][9] ), .B(n69), .C(\regs_matrix[6][9] ), 
        .D(n351), .Y(n229) );
  NOR2X1 U350 ( .A(n231), .B(n232), .Y(n227) );
  OAI22X1 U351 ( .A(\regs_matrix[3][9] ), .B(n353), .C(\regs_matrix[1][9] ), 
        .D(n357), .Y(n232) );
  OAI22X1 U352 ( .A(\regs_matrix[5][9] ), .B(n70), .C(\regs_matrix[7][9] ), 
        .D(n365), .Y(n231) );
  NAND2X1 U353 ( .A(n235), .B(n236), .Y(n234) );
  NOR2X1 U354 ( .A(n237), .B(n238), .Y(n236) );
  OAI22X1 U355 ( .A(\regs_matrix[8][10] ), .B(n338), .C(\regs_matrix[10][10] ), 
        .D(n345), .Y(n238) );
  OAI22X1 U356 ( .A(\regs_matrix[12][10] ), .B(n349), .C(\regs_matrix[14][10] ), .D(n351), .Y(n237) );
  NOR2X1 U357 ( .A(n239), .B(n240), .Y(n235) );
  OAI22X1 U358 ( .A(\regs_matrix[11][10] ), .B(n353), .C(\regs_matrix[9][10] ), 
        .D(n358), .Y(n240) );
  OAI22X1 U359 ( .A(\regs_matrix[13][10] ), .B(n71), .C(\regs_matrix[15][10] ), 
        .D(n365), .Y(n239) );
  NAND2X1 U360 ( .A(n241), .B(n242), .Y(n233) );
  NOR2X1 U361 ( .A(n243), .B(n244), .Y(n242) );
  OAI22X1 U362 ( .A(outreg_data[10]), .B(n338), .C(\regs_matrix[2][10] ), .D(
        n345), .Y(n244) );
  OAI22X1 U363 ( .A(\regs_matrix[4][10] ), .B(n349), .C(\regs_matrix[6][10] ), 
        .D(n351), .Y(n243) );
  NOR2X1 U364 ( .A(n245), .B(n246), .Y(n241) );
  OAI22X1 U365 ( .A(\regs_matrix[3][10] ), .B(n355), .C(\regs_matrix[1][10] ), 
        .D(n358), .Y(n246) );
  OAI22X1 U366 ( .A(\regs_matrix[5][10] ), .B(n362), .C(\regs_matrix[7][10] ), 
        .D(n365), .Y(n245) );
  MUX2X1 U367 ( .B(n247), .A(n248), .S(n368), .Y(r1_data[11]) );
  NAND2X1 U368 ( .A(n249), .B(n250), .Y(n248) );
  NOR2X1 U369 ( .A(n251), .B(n252), .Y(n250) );
  OAI22X1 U370 ( .A(\regs_matrix[8][11] ), .B(n338), .C(\regs_matrix[10][11] ), 
        .D(n345), .Y(n252) );
  OAI22X1 U371 ( .A(\regs_matrix[12][11] ), .B(n348), .C(\regs_matrix[14][11] ), .D(n351), .Y(n251) );
  NOR2X1 U372 ( .A(n253), .B(n254), .Y(n249) );
  OAI22X1 U373 ( .A(\regs_matrix[11][11] ), .B(n354), .C(\regs_matrix[9][11] ), 
        .D(n358), .Y(n254) );
  OAI22X1 U374 ( .A(\regs_matrix[13][11] ), .B(n71), .C(\regs_matrix[15][11] ), 
        .D(n365), .Y(n253) );
  NAND2X1 U375 ( .A(n255), .B(n256), .Y(n247) );
  NOR2X1 U376 ( .A(n257), .B(n258), .Y(n256) );
  OAI22X1 U377 ( .A(outreg_data[11]), .B(n338), .C(\regs_matrix[2][11] ), .D(
        n345), .Y(n258) );
  OAI22X1 U378 ( .A(\regs_matrix[4][11] ), .B(n349), .C(\regs_matrix[6][11] ), 
        .D(n351), .Y(n257) );
  NOR2X1 U379 ( .A(n259), .B(n260), .Y(n255) );
  OAI22X1 U380 ( .A(\regs_matrix[3][11] ), .B(n353), .C(\regs_matrix[1][11] ), 
        .D(n358), .Y(n260) );
  OAI22X1 U381 ( .A(\regs_matrix[5][11] ), .B(n71), .C(\regs_matrix[7][11] ), 
        .D(n365), .Y(n259) );
  MUX2X1 U382 ( .B(n261), .A(n262), .S(n367), .Y(r1_data[12]) );
  NAND2X1 U383 ( .A(n263), .B(n264), .Y(n262) );
  NOR2X1 U384 ( .A(n265), .B(n266), .Y(n264) );
  OAI22X1 U385 ( .A(\regs_matrix[8][12] ), .B(n338), .C(\regs_matrix[10][12] ), 
        .D(n345), .Y(n266) );
  OAI22X1 U386 ( .A(\regs_matrix[12][12] ), .B(n69), .C(\regs_matrix[14][12] ), 
        .D(n352), .Y(n265) );
  NOR2X1 U387 ( .A(n267), .B(n268), .Y(n263) );
  OAI22X1 U388 ( .A(\regs_matrix[11][12] ), .B(n355), .C(\regs_matrix[9][12] ), 
        .D(n357), .Y(n268) );
  OAI22X1 U389 ( .A(\regs_matrix[13][12] ), .B(n363), .C(\regs_matrix[15][12] ), .D(n366), .Y(n267) );
  NAND2X1 U390 ( .A(n269), .B(n270), .Y(n261) );
  NOR2X1 U391 ( .A(n271), .B(n272), .Y(n270) );
  OAI22X1 U392 ( .A(outreg_data[12]), .B(n338), .C(\regs_matrix[2][12] ), .D(
        n345), .Y(n272) );
  OAI22X1 U393 ( .A(\regs_matrix[4][12] ), .B(n68), .C(\regs_matrix[6][12] ), 
        .D(n351), .Y(n271) );
  NOR2X1 U394 ( .A(n273), .B(n274), .Y(n269) );
  OAI22X1 U395 ( .A(\regs_matrix[3][12] ), .B(n354), .C(\regs_matrix[1][12] ), 
        .D(n359), .Y(n274) );
  OAI22X1 U396 ( .A(\regs_matrix[5][12] ), .B(n70), .C(\regs_matrix[7][12] ), 
        .D(n366), .Y(n273) );
  MUX2X1 U397 ( .B(n275), .A(n276), .S(n368), .Y(r1_data[13]) );
  NAND2X1 U398 ( .A(n277), .B(n278), .Y(n276) );
  NOR2X1 U399 ( .A(n279), .B(n280), .Y(n278) );
  OAI22X1 U400 ( .A(\regs_matrix[8][13] ), .B(n338), .C(\regs_matrix[10][13] ), 
        .D(n345), .Y(n280) );
  OAI22X1 U401 ( .A(\regs_matrix[12][13] ), .B(n68), .C(\regs_matrix[14][13] ), 
        .D(n351), .Y(n279) );
  NOR2X1 U402 ( .A(n281), .B(n282), .Y(n277) );
  OAI22X1 U403 ( .A(\regs_matrix[11][13] ), .B(n355), .C(\regs_matrix[9][13] ), 
        .D(n359), .Y(n282) );
  OAI22X1 U404 ( .A(\regs_matrix[13][13] ), .B(n70), .C(\regs_matrix[15][13] ), 
        .D(n366), .Y(n281) );
  NAND2X1 U405 ( .A(n283), .B(n284), .Y(n275) );
  NOR2X1 U406 ( .A(n285), .B(n286), .Y(n284) );
  OAI22X1 U407 ( .A(outreg_data[13]), .B(n338), .C(\regs_matrix[2][13] ), .D(
        n345), .Y(n286) );
  OAI22X1 U408 ( .A(\regs_matrix[4][13] ), .B(n347), .C(\regs_matrix[6][13] ), 
        .D(n351), .Y(n285) );
  NOR2X1 U409 ( .A(n287), .B(n288), .Y(n283) );
  OAI22X1 U410 ( .A(\regs_matrix[3][13] ), .B(n354), .C(\regs_matrix[1][13] ), 
        .D(n75), .Y(n288) );
  OAI22X1 U411 ( .A(\regs_matrix[5][13] ), .B(n363), .C(\regs_matrix[7][13] ), 
        .D(n366), .Y(n287) );
  MUX2X1 U412 ( .B(n289), .A(n290), .S(n367), .Y(r1_data[14]) );
  NAND2X1 U413 ( .A(n291), .B(n292), .Y(n290) );
  NOR2X1 U414 ( .A(n293), .B(n294), .Y(n292) );
  OAI22X1 U415 ( .A(\regs_matrix[8][14] ), .B(n338), .C(\regs_matrix[10][14] ), 
        .D(n345), .Y(n294) );
  OAI22X1 U416 ( .A(\regs_matrix[12][14] ), .B(n348), .C(\regs_matrix[14][14] ), .D(n351), .Y(n293) );
  NOR2X1 U417 ( .A(n295), .B(n296), .Y(n291) );
  OAI22X1 U418 ( .A(\regs_matrix[11][14] ), .B(n354), .C(\regs_matrix[9][14] ), 
        .D(n76), .Y(n296) );
  OAI22X1 U419 ( .A(\regs_matrix[13][14] ), .B(n361), .C(\regs_matrix[15][14] ), .D(n366), .Y(n295) );
  NAND2X1 U420 ( .A(n297), .B(n298), .Y(n289) );
  NOR2X1 U421 ( .A(n299), .B(n300), .Y(n298) );
  OAI22X1 U422 ( .A(outreg_data[14]), .B(n338), .C(\regs_matrix[2][14] ), .D(
        n345), .Y(n300) );
  OAI22X1 U423 ( .A(\regs_matrix[4][14] ), .B(n347), .C(\regs_matrix[6][14] ), 
        .D(n352), .Y(n299) );
  NOR2X1 U424 ( .A(n301), .B(n302), .Y(n297) );
  OAI22X1 U425 ( .A(\regs_matrix[3][14] ), .B(n353), .C(\regs_matrix[1][14] ), 
        .D(n357), .Y(n302) );
  OAI22X1 U426 ( .A(\regs_matrix[5][14] ), .B(n362), .C(\regs_matrix[7][14] ), 
        .D(n366), .Y(n301) );
  MUX2X1 U427 ( .B(n303), .A(n304), .S(n368), .Y(n706) );
  NAND2X1 U428 ( .A(n305), .B(n306), .Y(n304) );
  NOR2X1 U429 ( .A(n307), .B(n308), .Y(n306) );
  OAI22X1 U430 ( .A(\regs_matrix[8][15] ), .B(n338), .C(\regs_matrix[10][15] ), 
        .D(n345), .Y(n308) );
  OAI22X1 U431 ( .A(\regs_matrix[12][15] ), .B(n349), .C(\regs_matrix[14][15] ), .D(n352), .Y(n307) );
  NOR2X1 U432 ( .A(n309), .B(n310), .Y(n305) );
  OAI22X1 U433 ( .A(\regs_matrix[11][15] ), .B(n353), .C(\regs_matrix[9][15] ), 
        .D(n75), .Y(n310) );
  OAI22X1 U434 ( .A(\regs_matrix[13][15] ), .B(n71), .C(\regs_matrix[15][15] ), 
        .D(n365), .Y(n309) );
  NAND2X1 U435 ( .A(n311), .B(n312), .Y(n303) );
  NOR2X1 U436 ( .A(n313), .B(n314), .Y(n312) );
  OAI22X1 U437 ( .A(outreg_data[15]), .B(n338), .C(\regs_matrix[2][15] ), .D(
        n345), .Y(n314) );
  OAI22X1 U438 ( .A(\regs_matrix[4][15] ), .B(n349), .C(\regs_matrix[6][15] ), 
        .D(n352), .Y(n313) );
  NOR2X1 U439 ( .A(n315), .B(n316), .Y(n311) );
  OAI22X1 U440 ( .A(\regs_matrix[3][15] ), .B(n353), .C(\regs_matrix[1][15] ), 
        .D(n75), .Y(n316) );
  OAI22X1 U441 ( .A(\regs_matrix[5][15] ), .B(n71), .C(\regs_matrix[7][15] ), 
        .D(n365), .Y(n315) );
  NOR2X1 U442 ( .A(n317), .B(n318), .Y(n81) );
  OAI21X1 U443 ( .A(\regs_matrix[6][16] ), .B(n352), .C(n319), .Y(n318) );
  AOI22X1 U444 ( .A(n27), .B(n320), .C(n23), .D(n321), .Y(n319) );
  INVX2 U445 ( .A(outreg_data[16]), .Y(n321) );
  INVX2 U446 ( .A(\regs_matrix[2][16] ), .Y(n320) );
  OAI21X1 U447 ( .A(\regs_matrix[4][16] ), .B(n68), .C(n322), .Y(n317) );
  INVX2 U448 ( .A(n368), .Y(n322) );
  NOR2X1 U449 ( .A(n323), .B(n324), .Y(n82) );
  OAI22X1 U450 ( .A(\regs_matrix[3][16] ), .B(n355), .C(\regs_matrix[1][16] ), 
        .D(n76), .Y(n324) );
  OAI22X1 U451 ( .A(\regs_matrix[5][16] ), .B(n363), .C(\regs_matrix[7][16] ), 
        .D(n366), .Y(n323) );
  NOR2X1 U452 ( .A(n325), .B(n326), .Y(n83) );
  OAI21X1 U453 ( .A(\regs_matrix[12][16] ), .B(n348), .C(n327), .Y(n326) );
  AOI22X1 U454 ( .A(n27), .B(n328), .C(n23), .D(n614), .Y(n327) );
  NAND3X1 U455 ( .A(n329), .B(n330), .C(n331), .Y(n92) );
  INVX2 U456 ( .A(\regs_matrix[10][16] ), .Y(n328) );
  NAND3X1 U457 ( .A(n32), .B(n330), .C(n331), .Y(n93) );
  NAND3X1 U458 ( .A(n16), .B(n329), .C(n331), .Y(n94) );
  OAI22X1 U459 ( .A(\regs_matrix[9][16] ), .B(n76), .C(\regs_matrix[14][16] ), 
        .D(n351), .Y(n325) );
  NAND3X1 U460 ( .A(n16), .B(N11), .C(n331), .Y(n95) );
  INVX2 U461 ( .A(N10), .Y(n331) );
  NAND3X1 U462 ( .A(N10), .B(n329), .C(n330), .Y(n98) );
  NOR2X1 U463 ( .A(n332), .B(n333), .Y(n84) );
  OAI21X1 U464 ( .A(\regs_matrix[11][16] ), .B(n353), .C(n367), .Y(n333) );
  OAI22X1 U465 ( .A(\regs_matrix[15][16] ), .B(n366), .C(\regs_matrix[13][16] ), .D(n362), .Y(n332) );
  NAND3X1 U466 ( .A(n16), .B(N10), .C(n329), .Y(n99) );
  INVX2 U467 ( .A(N11), .Y(n329) );
  NAND2X1 U468 ( .A(n16), .B(n80), .Y(n100) );
  INVX8 U469 ( .A(n340), .Y(n345) );
  INVX8 U470 ( .A(n364), .Y(n366) );
  INVX2 U471 ( .A(n93), .Y(n339) );
  AOI22X1 U472 ( .A(n373), .B(n372), .C(n371), .D(n370), .Y(n374) );
  INVX2 U473 ( .A(n374), .Y(r2_data[16]) );
  MUX2X1 U474 ( .B(n376), .A(n377), .S(n646), .Y(n710) );
  NAND2X1 U475 ( .A(n378), .B(n379), .Y(n377) );
  NOR2X1 U476 ( .A(n380), .B(n381), .Y(n379) );
  OAI22X1 U477 ( .A(\regs_matrix[8][0] ), .B(n622), .C(\regs_matrix[10][0] ), 
        .D(n626), .Y(n381) );
  OAI22X1 U478 ( .A(\regs_matrix[12][0] ), .B(n630), .C(\regs_matrix[14][0] ), 
        .D(n632), .Y(n380) );
  NOR2X1 U479 ( .A(n385), .B(n386), .Y(n378) );
  OAI22X1 U480 ( .A(\regs_matrix[11][0] ), .B(n635), .C(\regs_matrix[9][0] ), 
        .D(n638), .Y(n386) );
  OAI22X1 U481 ( .A(\regs_matrix[13][0] ), .B(n642), .C(\regs_matrix[15][0] ), 
        .D(n31), .Y(n385) );
  NAND2X1 U482 ( .A(n391), .B(n392), .Y(n376) );
  NOR2X1 U483 ( .A(n393), .B(n394), .Y(n392) );
  OAI22X1 U484 ( .A(outreg_data[0]), .B(n622), .C(\regs_matrix[2][0] ), .D(
        n626), .Y(n394) );
  OAI22X1 U485 ( .A(\regs_matrix[4][0] ), .B(n630), .C(\regs_matrix[6][0] ), 
        .D(n632), .Y(n393) );
  NOR2X1 U486 ( .A(n395), .B(n396), .Y(n391) );
  OAI22X1 U487 ( .A(\regs_matrix[3][0] ), .B(n635), .C(\regs_matrix[1][0] ), 
        .D(n72), .Y(n396) );
  OAI22X1 U488 ( .A(\regs_matrix[5][0] ), .B(n641), .C(\regs_matrix[7][0] ), 
        .D(n31), .Y(n395) );
  MUX2X1 U489 ( .B(n397), .A(n398), .S(n647), .Y(r2_data[1]) );
  NAND2X1 U490 ( .A(n399), .B(n400), .Y(n398) );
  NOR2X1 U491 ( .A(n401), .B(n402), .Y(n400) );
  OAI22X1 U492 ( .A(\regs_matrix[8][1] ), .B(n622), .C(\regs_matrix[10][1] ), 
        .D(n626), .Y(n402) );
  OAI22X1 U493 ( .A(\regs_matrix[12][1] ), .B(n630), .C(\regs_matrix[14][1] ), 
        .D(n633), .Y(n401) );
  NOR2X1 U494 ( .A(n403), .B(n404), .Y(n399) );
  OAI22X1 U495 ( .A(\regs_matrix[11][1] ), .B(n635), .C(\regs_matrix[9][1] ), 
        .D(n77), .Y(n404) );
  OAI22X1 U496 ( .A(\regs_matrix[13][1] ), .B(n642), .C(\regs_matrix[15][1] ), 
        .D(n645), .Y(n403) );
  NAND2X1 U497 ( .A(n405), .B(n406), .Y(n397) );
  NOR2X1 U498 ( .A(n407), .B(n408), .Y(n406) );
  OAI22X1 U499 ( .A(outreg_data[1]), .B(n622), .C(\regs_matrix[2][1] ), .D(
        n626), .Y(n408) );
  OAI22X1 U500 ( .A(\regs_matrix[4][1] ), .B(n630), .C(\regs_matrix[6][1] ), 
        .D(n633), .Y(n407) );
  NOR2X1 U501 ( .A(n409), .B(n410), .Y(n405) );
  OAI22X1 U502 ( .A(\regs_matrix[3][1] ), .B(n636), .C(\regs_matrix[1][1] ), 
        .D(n639), .Y(n410) );
  OAI22X1 U503 ( .A(\regs_matrix[5][1] ), .B(n642), .C(\regs_matrix[7][1] ), 
        .D(n31), .Y(n409) );
  MUX2X1 U504 ( .B(n411), .A(n412), .S(n646), .Y(n709) );
  NAND2X1 U505 ( .A(n413), .B(n414), .Y(n412) );
  NOR2X1 U506 ( .A(n415), .B(n416), .Y(n414) );
  OAI22X1 U507 ( .A(\regs_matrix[8][2] ), .B(n622), .C(\regs_matrix[10][2] ), 
        .D(n626), .Y(n416) );
  OAI22X1 U508 ( .A(\regs_matrix[12][2] ), .B(n630), .C(\regs_matrix[14][2] ), 
        .D(n632), .Y(n415) );
  NOR2X1 U509 ( .A(n417), .B(n418), .Y(n413) );
  OAI22X1 U510 ( .A(\regs_matrix[11][2] ), .B(n636), .C(\regs_matrix[9][2] ), 
        .D(n78), .Y(n418) );
  OAI22X1 U511 ( .A(\regs_matrix[13][2] ), .B(n642), .C(\regs_matrix[15][2] ), 
        .D(n31), .Y(n417) );
  NAND2X1 U512 ( .A(n419), .B(n420), .Y(n411) );
  NOR2X1 U513 ( .A(n421), .B(n422), .Y(n420) );
  OAI22X1 U514 ( .A(outreg_data[2]), .B(n622), .C(\regs_matrix[2][2] ), .D(
        n626), .Y(n422) );
  OAI22X1 U515 ( .A(\regs_matrix[4][2] ), .B(n630), .C(\regs_matrix[6][2] ), 
        .D(n633), .Y(n421) );
  NOR2X1 U516 ( .A(n423), .B(n424), .Y(n419) );
  OAI22X1 U517 ( .A(\regs_matrix[3][2] ), .B(n635), .C(\regs_matrix[1][2] ), 
        .D(n639), .Y(n424) );
  OAI22X1 U518 ( .A(\regs_matrix[5][2] ), .B(n641), .C(\regs_matrix[7][2] ), 
        .D(n645), .Y(n423) );
  NAND2X1 U519 ( .A(n427), .B(n428), .Y(n426) );
  NOR2X1 U520 ( .A(n429), .B(n430), .Y(n428) );
  OAI22X1 U521 ( .A(\regs_matrix[8][3] ), .B(n622), .C(\regs_matrix[10][3] ), 
        .D(n626), .Y(n430) );
  OAI22X1 U522 ( .A(\regs_matrix[12][3] ), .B(n630), .C(\regs_matrix[14][3] ), 
        .D(n633), .Y(n429) );
  NOR2X1 U523 ( .A(n431), .B(n432), .Y(n427) );
  OAI22X1 U524 ( .A(\regs_matrix[11][3] ), .B(n636), .C(\regs_matrix[9][3] ), 
        .D(n77), .Y(n432) );
  OAI22X1 U525 ( .A(\regs_matrix[13][3] ), .B(n642), .C(\regs_matrix[15][3] ), 
        .D(n31), .Y(n431) );
  NAND2X1 U526 ( .A(n433), .B(n434), .Y(n425) );
  NOR2X1 U527 ( .A(n435), .B(n436), .Y(n434) );
  OAI22X1 U528 ( .A(outreg_data[3]), .B(n622), .C(\regs_matrix[2][3] ), .D(
        n626), .Y(n436) );
  OAI22X1 U529 ( .A(\regs_matrix[4][3] ), .B(n631), .C(\regs_matrix[6][3] ), 
        .D(n633), .Y(n435) );
  NOR2X1 U530 ( .A(n437), .B(n438), .Y(n433) );
  OAI22X1 U531 ( .A(\regs_matrix[3][3] ), .B(n635), .C(\regs_matrix[1][3] ), 
        .D(n78), .Y(n438) );
  OAI22X1 U532 ( .A(\regs_matrix[5][3] ), .B(n642), .C(\regs_matrix[7][3] ), 
        .D(n644), .Y(n437) );
  MUX2X1 U533 ( .B(n439), .A(n440), .S(n646), .Y(r2_data[4]) );
  NAND2X1 U534 ( .A(n441), .B(n442), .Y(n440) );
  NOR2X1 U535 ( .A(n443), .B(n444), .Y(n442) );
  OAI22X1 U536 ( .A(\regs_matrix[8][4] ), .B(n623), .C(\regs_matrix[10][4] ), 
        .D(n627), .Y(n444) );
  OAI22X1 U537 ( .A(\regs_matrix[12][4] ), .B(n631), .C(\regs_matrix[14][4] ), 
        .D(n632), .Y(n443) );
  NOR2X1 U538 ( .A(n445), .B(n446), .Y(n441) );
  OAI22X1 U539 ( .A(\regs_matrix[11][4] ), .B(n635), .C(\regs_matrix[9][4] ), 
        .D(n638), .Y(n446) );
  OAI22X1 U540 ( .A(\regs_matrix[13][4] ), .B(n641), .C(\regs_matrix[15][4] ), 
        .D(n644), .Y(n445) );
  NAND2X1 U541 ( .A(n447), .B(n448), .Y(n439) );
  NOR2X1 U542 ( .A(n449), .B(n450), .Y(n448) );
  OAI22X1 U543 ( .A(outreg_data[4]), .B(n623), .C(\regs_matrix[2][4] ), .D(
        n627), .Y(n450) );
  OAI22X1 U544 ( .A(\regs_matrix[4][4] ), .B(n630), .C(\regs_matrix[6][4] ), 
        .D(n632), .Y(n449) );
  NOR2X1 U545 ( .A(n451), .B(n452), .Y(n447) );
  OAI22X1 U546 ( .A(\regs_matrix[3][4] ), .B(n636), .C(\regs_matrix[1][4] ), 
        .D(n77), .Y(n452) );
  OAI22X1 U547 ( .A(\regs_matrix[5][4] ), .B(n641), .C(\regs_matrix[7][4] ), 
        .D(n644), .Y(n451) );
  MUX2X1 U548 ( .B(n453), .A(n454), .S(n647), .Y(r2_data[5]) );
  NAND2X1 U549 ( .A(n455), .B(n456), .Y(n454) );
  NOR2X1 U550 ( .A(n457), .B(n458), .Y(n456) );
  OAI22X1 U551 ( .A(\regs_matrix[8][5] ), .B(n623), .C(\regs_matrix[10][5] ), 
        .D(n627), .Y(n458) );
  OAI22X1 U552 ( .A(\regs_matrix[12][5] ), .B(n631), .C(\regs_matrix[14][5] ), 
        .D(n633), .Y(n457) );
  NOR2X1 U553 ( .A(n459), .B(n460), .Y(n455) );
  OAI22X1 U554 ( .A(\regs_matrix[11][5] ), .B(n635), .C(\regs_matrix[9][5] ), 
        .D(n638), .Y(n460) );
  OAI22X1 U555 ( .A(\regs_matrix[13][5] ), .B(n641), .C(\regs_matrix[15][5] ), 
        .D(n645), .Y(n459) );
  NAND2X1 U556 ( .A(n461), .B(n462), .Y(n453) );
  NOR2X1 U557 ( .A(n463), .B(n464), .Y(n462) );
  OAI22X1 U558 ( .A(n623), .B(outreg_data[5]), .C(\regs_matrix[2][5] ), .D(
        n626), .Y(n464) );
  OAI22X1 U559 ( .A(\regs_matrix[4][5] ), .B(n631), .C(\regs_matrix[6][5] ), 
        .D(n633), .Y(n463) );
  NOR2X1 U560 ( .A(n465), .B(n466), .Y(n461) );
  OAI22X1 U561 ( .A(\regs_matrix[3][5] ), .B(n635), .C(\regs_matrix[1][5] ), 
        .D(n77), .Y(n466) );
  OAI22X1 U562 ( .A(\regs_matrix[5][5] ), .B(n641), .C(\regs_matrix[7][5] ), 
        .D(n645), .Y(n465) );
  MUX2X1 U563 ( .B(n467), .A(n468), .S(n646), .Y(r2_data[6]) );
  NAND2X1 U564 ( .A(n469), .B(n470), .Y(n468) );
  NOR2X1 U565 ( .A(n471), .B(n472), .Y(n470) );
  OAI22X1 U566 ( .A(\regs_matrix[8][6] ), .B(n623), .C(\regs_matrix[10][6] ), 
        .D(n626), .Y(n472) );
  OAI22X1 U567 ( .A(\regs_matrix[12][6] ), .B(n631), .C(\regs_matrix[14][6] ), 
        .D(n632), .Y(n471) );
  NOR2X1 U568 ( .A(n473), .B(n474), .Y(n469) );
  OAI22X1 U569 ( .A(\regs_matrix[11][6] ), .B(n635), .C(\regs_matrix[9][6] ), 
        .D(n639), .Y(n474) );
  OAI22X1 U570 ( .A(\regs_matrix[13][6] ), .B(n641), .C(\regs_matrix[15][6] ), 
        .D(n644), .Y(n473) );
  NAND2X1 U571 ( .A(n475), .B(n476), .Y(n467) );
  NOR2X1 U572 ( .A(n477), .B(n478), .Y(n476) );
  OAI22X1 U573 ( .A(outreg_data[6]), .B(n623), .C(\regs_matrix[2][6] ), .D(
        n627), .Y(n478) );
  OAI22X1 U574 ( .A(\regs_matrix[4][6] ), .B(n631), .C(\regs_matrix[6][6] ), 
        .D(n632), .Y(n477) );
  NOR2X1 U575 ( .A(n479), .B(n480), .Y(n475) );
  OAI22X1 U576 ( .A(\regs_matrix[3][6] ), .B(n636), .C(\regs_matrix[1][6] ), 
        .D(n72), .Y(n480) );
  OAI22X1 U577 ( .A(\regs_matrix[5][6] ), .B(n641), .C(\regs_matrix[7][6] ), 
        .D(n644), .Y(n479) );
  NAND2X1 U578 ( .A(n483), .B(n484), .Y(n482) );
  NOR2X1 U579 ( .A(n485), .B(n486), .Y(n484) );
  OAI22X1 U580 ( .A(\regs_matrix[8][7] ), .B(n35), .C(\regs_matrix[10][7] ), 
        .D(n627), .Y(n486) );
  OAI22X1 U581 ( .A(\regs_matrix[12][7] ), .B(n631), .C(\regs_matrix[14][7] ), 
        .D(n633), .Y(n485) );
  NOR2X1 U582 ( .A(n487), .B(n488), .Y(n483) );
  OAI22X1 U583 ( .A(\regs_matrix[11][7] ), .B(n636), .C(\regs_matrix[9][7] ), 
        .D(n638), .Y(n488) );
  OAI22X1 U584 ( .A(\regs_matrix[13][7] ), .B(n641), .C(\regs_matrix[15][7] ), 
        .D(n644), .Y(n487) );
  NAND2X1 U585 ( .A(n489), .B(n490), .Y(n481) );
  NOR2X1 U586 ( .A(n491), .B(n492), .Y(n490) );
  OAI22X1 U587 ( .A(outreg_data[7]), .B(n623), .C(\regs_matrix[2][7] ), .D(
        n627), .Y(n492) );
  OAI22X1 U588 ( .A(\regs_matrix[4][7] ), .B(n630), .C(\regs_matrix[6][7] ), 
        .D(n633), .Y(n491) );
  NOR2X1 U589 ( .A(n493), .B(n494), .Y(n489) );
  OAI22X1 U590 ( .A(\regs_matrix[3][7] ), .B(n635), .C(\regs_matrix[1][7] ), 
        .D(n78), .Y(n494) );
  OAI22X1 U591 ( .A(\regs_matrix[5][7] ), .B(n641), .C(\regs_matrix[7][7] ), 
        .D(n31), .Y(n493) );
  MUX2X1 U592 ( .B(n495), .A(n496), .S(n646), .Y(r2_data[8]) );
  NAND2X1 U593 ( .A(n497), .B(n498), .Y(n496) );
  NOR2X1 U594 ( .A(n499), .B(n500), .Y(n498) );
  OAI22X1 U595 ( .A(\regs_matrix[8][8] ), .B(n623), .C(\regs_matrix[10][8] ), 
        .D(n627), .Y(n500) );
  OAI22X1 U596 ( .A(\regs_matrix[12][8] ), .B(n631), .C(\regs_matrix[14][8] ), 
        .D(n633), .Y(n499) );
  NOR2X1 U597 ( .A(n501), .B(n502), .Y(n497) );
  OAI22X1 U598 ( .A(\regs_matrix[11][8] ), .B(n635), .C(\regs_matrix[9][8] ), 
        .D(n72), .Y(n502) );
  OAI22X1 U599 ( .A(\regs_matrix[13][8] ), .B(n641), .C(\regs_matrix[15][8] ), 
        .D(n645), .Y(n501) );
  NAND2X1 U600 ( .A(n503), .B(n504), .Y(n495) );
  NOR2X1 U601 ( .A(n505), .B(n506), .Y(n504) );
  OAI22X1 U602 ( .A(outreg_data[8]), .B(n623), .C(\regs_matrix[2][8] ), .D(
        n627), .Y(n506) );
  OAI22X1 U603 ( .A(\regs_matrix[4][8] ), .B(n630), .C(\regs_matrix[6][8] ), 
        .D(n633), .Y(n505) );
  NOR2X1 U604 ( .A(n507), .B(n508), .Y(n503) );
  OAI22X1 U605 ( .A(\regs_matrix[3][8] ), .B(n636), .C(\regs_matrix[1][8] ), 
        .D(n639), .Y(n508) );
  OAI22X1 U606 ( .A(\regs_matrix[5][8] ), .B(n641), .C(\regs_matrix[7][8] ), 
        .D(n645), .Y(n507) );
  MUX2X1 U607 ( .B(n509), .A(n510), .S(n647), .Y(r2_data[9]) );
  NAND2X1 U608 ( .A(n511), .B(n512), .Y(n510) );
  NOR2X1 U609 ( .A(n513), .B(n514), .Y(n512) );
  OAI22X1 U610 ( .A(\regs_matrix[8][9] ), .B(n623), .C(\regs_matrix[10][9] ), 
        .D(n627), .Y(n514) );
  OAI22X1 U611 ( .A(\regs_matrix[12][9] ), .B(n631), .C(\regs_matrix[14][9] ), 
        .D(n633), .Y(n513) );
  NOR2X1 U612 ( .A(n515), .B(n516), .Y(n511) );
  OAI22X1 U613 ( .A(\regs_matrix[11][9] ), .B(n636), .C(\regs_matrix[9][9] ), 
        .D(n78), .Y(n516) );
  OAI22X1 U614 ( .A(\regs_matrix[13][9] ), .B(n641), .C(\regs_matrix[15][9] ), 
        .D(n645), .Y(n515) );
  NAND2X1 U615 ( .A(n517), .B(n518), .Y(n509) );
  NOR2X1 U616 ( .A(n519), .B(n651), .Y(n518) );
  OAI22X1 U617 ( .A(\regs_matrix[4][9] ), .B(n630), .C(\regs_matrix[6][9] ), 
        .D(n633), .Y(n519) );
  NOR2X1 U618 ( .A(n520), .B(n521), .Y(n517) );
  OAI22X1 U619 ( .A(\regs_matrix[3][9] ), .B(n636), .C(\regs_matrix[1][9] ), 
        .D(n72), .Y(n521) );
  OAI22X1 U620 ( .A(\regs_matrix[5][9] ), .B(n641), .C(\regs_matrix[7][9] ), 
        .D(n31), .Y(n520) );
  MUX2X1 U621 ( .B(n522), .A(n523), .S(n646), .Y(r2_data[10]) );
  NAND2X1 U622 ( .A(n524), .B(n525), .Y(n523) );
  NOR2X1 U623 ( .A(n526), .B(n527), .Y(n525) );
  OAI22X1 U624 ( .A(\regs_matrix[8][10] ), .B(n35), .C(\regs_matrix[10][10] ), 
        .D(n628), .Y(n527) );
  OAI22X1 U625 ( .A(\regs_matrix[12][10] ), .B(n631), .C(\regs_matrix[14][10] ), .D(n633), .Y(n526) );
  NOR2X1 U626 ( .A(n528), .B(n529), .Y(n524) );
  OAI22X1 U627 ( .A(\regs_matrix[11][10] ), .B(n636), .C(\regs_matrix[9][10] ), 
        .D(n78), .Y(n529) );
  OAI22X1 U628 ( .A(\regs_matrix[13][10] ), .B(n641), .C(\regs_matrix[15][10] ), .D(n31), .Y(n528) );
  NAND2X1 U629 ( .A(n530), .B(n531), .Y(n522) );
  NOR2X1 U630 ( .A(n532), .B(n533), .Y(n531) );
  OAI22X1 U631 ( .A(outreg_data[10]), .B(n36), .C(\regs_matrix[2][10] ), .D(
        n628), .Y(n533) );
  OAI22X1 U632 ( .A(\regs_matrix[4][10] ), .B(n630), .C(\regs_matrix[6][10] ), 
        .D(n633), .Y(n532) );
  NOR2X1 U633 ( .A(n534), .B(n535), .Y(n530) );
  OAI22X1 U634 ( .A(\regs_matrix[3][10] ), .B(n635), .C(\regs_matrix[1][10] ), 
        .D(n72), .Y(n535) );
  OAI22X1 U635 ( .A(\regs_matrix[5][10] ), .B(n642), .C(\regs_matrix[7][10] ), 
        .D(n31), .Y(n534) );
  MUX2X1 U636 ( .B(n536), .A(n537), .S(n647), .Y(r2_data[11]) );
  NAND2X1 U637 ( .A(n538), .B(n539), .Y(n537) );
  NOR2X1 U638 ( .A(n540), .B(n541), .Y(n539) );
  OAI22X1 U639 ( .A(\regs_matrix[8][11] ), .B(n623), .C(\regs_matrix[10][11] ), 
        .D(n628), .Y(n541) );
  OAI22X1 U640 ( .A(\regs_matrix[12][11] ), .B(n631), .C(\regs_matrix[14][11] ), .D(n632), .Y(n540) );
  NOR2X1 U641 ( .A(n542), .B(n543), .Y(n538) );
  OAI22X1 U642 ( .A(\regs_matrix[11][11] ), .B(n636), .C(\regs_matrix[9][11] ), 
        .D(n639), .Y(n543) );
  OAI22X1 U643 ( .A(\regs_matrix[13][11] ), .B(n642), .C(\regs_matrix[15][11] ), .D(n644), .Y(n542) );
  NAND2X1 U644 ( .A(n544), .B(n545), .Y(n536) );
  NOR2X1 U645 ( .A(n546), .B(n547), .Y(n545) );
  OAI22X1 U646 ( .A(outreg_data[11]), .B(n36), .C(\regs_matrix[2][11] ), .D(
        n628), .Y(n547) );
  OAI22X1 U647 ( .A(\regs_matrix[4][11] ), .B(n630), .C(\regs_matrix[6][11] ), 
        .D(n632), .Y(n546) );
  NOR2X1 U648 ( .A(n548), .B(n549), .Y(n544) );
  OAI22X1 U649 ( .A(\regs_matrix[3][11] ), .B(n635), .C(\regs_matrix[1][11] ), 
        .D(n638), .Y(n549) );
  OAI22X1 U650 ( .A(\regs_matrix[5][11] ), .B(n642), .C(\regs_matrix[7][11] ), 
        .D(n645), .Y(n548) );
  NAND2X1 U651 ( .A(n552), .B(n553), .Y(n551) );
  NOR2X1 U652 ( .A(n554), .B(n555), .Y(n553) );
  OAI22X1 U653 ( .A(\regs_matrix[8][12] ), .B(n622), .C(\regs_matrix[10][12] ), 
        .D(n628), .Y(n555) );
  OAI22X1 U654 ( .A(\regs_matrix[12][12] ), .B(n631), .C(\regs_matrix[14][12] ), .D(n633), .Y(n554) );
  NOR2X1 U655 ( .A(n556), .B(n557), .Y(n552) );
  OAI22X1 U656 ( .A(\regs_matrix[11][12] ), .B(n636), .C(\regs_matrix[9][12] ), 
        .D(n639), .Y(n557) );
  OAI22X1 U657 ( .A(\regs_matrix[13][12] ), .B(n642), .C(\regs_matrix[15][12] ), .D(n645), .Y(n556) );
  NAND2X1 U658 ( .A(n558), .B(n559), .Y(n550) );
  NOR2X1 U659 ( .A(n560), .B(n561), .Y(n559) );
  OAI22X1 U660 ( .A(outreg_data[12]), .B(n36), .C(\regs_matrix[2][12] ), .D(
        n628), .Y(n561) );
  OAI22X1 U661 ( .A(\regs_matrix[4][12] ), .B(n630), .C(\regs_matrix[6][12] ), 
        .D(n633), .Y(n560) );
  NOR2X1 U662 ( .A(n562), .B(n563), .Y(n558) );
  OAI22X1 U663 ( .A(\regs_matrix[3][12] ), .B(n635), .C(\regs_matrix[1][12] ), 
        .D(n78), .Y(n563) );
  OAI22X1 U664 ( .A(\regs_matrix[5][12] ), .B(n642), .C(\regs_matrix[7][12] ), 
        .D(n644), .Y(n562) );
  MUX2X1 U665 ( .B(n564), .A(n565), .S(n647), .Y(r2_data[13]) );
  NAND2X1 U666 ( .A(n566), .B(n567), .Y(n565) );
  NOR2X1 U667 ( .A(n569), .B(n568), .Y(n567) );
  OAI22X1 U668 ( .A(\regs_matrix[8][13] ), .B(n622), .C(\regs_matrix[10][13] ), 
        .D(n628), .Y(n569) );
  OAI22X1 U669 ( .A(\regs_matrix[12][13] ), .B(n630), .C(\regs_matrix[14][13] ), .D(n633), .Y(n568) );
  NOR2X1 U670 ( .A(n570), .B(n571), .Y(n566) );
  OAI22X1 U671 ( .A(\regs_matrix[11][13] ), .B(n636), .C(\regs_matrix[9][13] ), 
        .D(n72), .Y(n571) );
  OAI22X1 U672 ( .A(\regs_matrix[13][13] ), .B(n642), .C(\regs_matrix[15][13] ), .D(n31), .Y(n570) );
  NAND2X1 U673 ( .A(n572), .B(n573), .Y(n564) );
  NOR2X1 U674 ( .A(n574), .B(n575), .Y(n573) );
  OAI22X1 U675 ( .A(outreg_data[13]), .B(n622), .C(\regs_matrix[2][13] ), .D(
        n628), .Y(n575) );
  OAI22X1 U676 ( .A(\regs_matrix[4][13] ), .B(n631), .C(\regs_matrix[6][13] ), 
        .D(n633), .Y(n574) );
  NOR2X1 U677 ( .A(n576), .B(n577), .Y(n572) );
  OAI22X1 U678 ( .A(\regs_matrix[3][13] ), .B(n635), .C(\regs_matrix[1][13] ), 
        .D(n78), .Y(n577) );
  OAI22X1 U679 ( .A(\regs_matrix[5][13] ), .B(n642), .C(\regs_matrix[7][13] ), 
        .D(n644), .Y(n576) );
  MUX2X1 U680 ( .B(n578), .A(n579), .S(n646), .Y(r2_data[14]) );
  NAND2X1 U681 ( .A(n580), .B(n581), .Y(n579) );
  NOR2X1 U682 ( .A(n582), .B(n583), .Y(n581) );
  OAI22X1 U683 ( .A(\regs_matrix[8][14] ), .B(n36), .C(\regs_matrix[10][14] ), 
        .D(n628), .Y(n583) );
  OAI22X1 U684 ( .A(\regs_matrix[12][14] ), .B(n631), .C(\regs_matrix[14][14] ), .D(n632), .Y(n582) );
  NOR2X1 U685 ( .A(n584), .B(n585), .Y(n580) );
  OAI22X1 U686 ( .A(\regs_matrix[11][14] ), .B(n635), .C(\regs_matrix[9][14] ), 
        .D(n77), .Y(n585) );
  OAI22X1 U687 ( .A(\regs_matrix[13][14] ), .B(n642), .C(\regs_matrix[15][14] ), .D(n645), .Y(n584) );
  NAND2X1 U688 ( .A(n586), .B(n587), .Y(n578) );
  NOR2X1 U689 ( .A(n588), .B(n589), .Y(n587) );
  OAI22X1 U690 ( .A(outreg_data[14]), .B(n36), .C(\regs_matrix[2][14] ), .D(
        n628), .Y(n589) );
  OAI22X1 U691 ( .A(\regs_matrix[4][14] ), .B(n631), .C(\regs_matrix[6][14] ), 
        .D(n632), .Y(n588) );
  NOR2X1 U692 ( .A(n590), .B(n591), .Y(n586) );
  OAI22X1 U693 ( .A(\regs_matrix[3][14] ), .B(n636), .C(\regs_matrix[1][14] ), 
        .D(n639), .Y(n591) );
  OAI22X1 U694 ( .A(\regs_matrix[5][14] ), .B(n642), .C(\regs_matrix[7][14] ), 
        .D(n644), .Y(n590) );
  MUX2X1 U695 ( .B(n592), .A(n593), .S(n647), .Y(r2_data[15]) );
  NAND2X1 U696 ( .A(n594), .B(n595), .Y(n593) );
  NOR2X1 U697 ( .A(n596), .B(n597), .Y(n595) );
  OAI22X1 U698 ( .A(\regs_matrix[8][15] ), .B(n35), .C(\regs_matrix[10][15] ), 
        .D(n628), .Y(n597) );
  OAI22X1 U699 ( .A(\regs_matrix[12][15] ), .B(n630), .C(\regs_matrix[14][15] ), .D(n633), .Y(n596) );
  NOR2X1 U700 ( .A(n598), .B(n599), .Y(n594) );
  OAI22X1 U701 ( .A(\regs_matrix[11][15] ), .B(n636), .C(\regs_matrix[9][15] ), 
        .D(n77), .Y(n599) );
  OAI22X1 U702 ( .A(\regs_matrix[13][15] ), .B(n642), .C(\regs_matrix[15][15] ), .D(n31), .Y(n598) );
  NAND2X1 U703 ( .A(n600), .B(n601), .Y(n592) );
  NOR2X1 U704 ( .A(n602), .B(n603), .Y(n601) );
  OAI22X1 U705 ( .A(outreg_data[15]), .B(n36), .C(\regs_matrix[2][15] ), .D(
        n627), .Y(n603) );
  OAI22X1 U706 ( .A(\regs_matrix[4][15] ), .B(n630), .C(\regs_matrix[6][15] ), 
        .D(n633), .Y(n602) );
  NOR2X1 U707 ( .A(n604), .B(n605), .Y(n600) );
  OAI22X1 U708 ( .A(\regs_matrix[3][15] ), .B(n636), .C(\regs_matrix[1][15] ), 
        .D(n638), .Y(n605) );
  OAI22X1 U709 ( .A(\regs_matrix[5][15] ), .B(n642), .C(\regs_matrix[7][15] ), 
        .D(n644), .Y(n604) );
  NOR2X1 U710 ( .A(n606), .B(n607), .Y(n370) );
  OAI21X1 U711 ( .A(\regs_matrix[6][16] ), .B(n37), .C(n608), .Y(n607) );
  AOI22X1 U712 ( .A(n625), .B(n320), .C(n620), .D(n321), .Y(n608) );
  OAI21X1 U713 ( .A(\regs_matrix[4][16] ), .B(n631), .C(n49), .Y(n606) );
  NOR2X1 U714 ( .A(n609), .B(n610), .Y(n371) );
  OAI22X1 U715 ( .A(\regs_matrix[3][16] ), .B(n635), .C(\regs_matrix[1][16] ), 
        .D(n72), .Y(n610) );
  OAI22X1 U716 ( .A(\regs_matrix[5][16] ), .B(n642), .C(\regs_matrix[7][16] ), 
        .D(n645), .Y(n609) );
  NOR2X1 U717 ( .A(n611), .B(n612), .Y(n372) );
  OAI21X1 U718 ( .A(\regs_matrix[12][16] ), .B(n630), .C(n613), .Y(n612) );
  AOI22X1 U719 ( .A(n625), .B(n328), .C(n621), .D(n614), .Y(n613) );
  INVX2 U720 ( .A(\regs_matrix[8][16] ), .Y(n614) );
  NAND3X1 U721 ( .A(n40), .B(n616), .C(n615), .Y(n382) );
  NAND3X1 U722 ( .A(n39), .B(N15), .C(n616), .Y(n383) );
  NAND3X1 U723 ( .A(N16), .B(n615), .C(n39), .Y(n384) );
  OAI22X1 U724 ( .A(\regs_matrix[9][16] ), .B(n77), .C(\regs_matrix[14][16] ), 
        .D(n37), .Y(n611) );
  NAND3X1 U725 ( .A(n20), .B(n615), .C(n616), .Y(n388) );
  NOR2X1 U726 ( .A(n617), .B(n618), .Y(n373) );
  OAI21X1 U727 ( .A(\regs_matrix[11][16] ), .B(n636), .C(n646), .Y(n618) );
  NAND2X1 U728 ( .A(n616), .B(n650), .Y(n387) );
  OAI22X1 U729 ( .A(\regs_matrix[15][16] ), .B(n644), .C(\regs_matrix[13][16] ), .D(n642), .Y(n617) );
  NAND3X1 U730 ( .A(N16), .B(n615), .C(n20), .Y(n389) );
  INVX2 U731 ( .A(N15), .Y(n615) );
  NAND2X1 U732 ( .A(N16), .B(n650), .Y(n390) );
  BUFX4 U733 ( .A(n619), .Y(n620) );
  BUFX4 U734 ( .A(n619), .Y(n621) );
  INVX8 U735 ( .A(n621), .Y(n622) );
  BUFX4 U736 ( .A(n22), .Y(n625) );
  INVX8 U737 ( .A(n625), .Y(n626) );
  INVX8 U738 ( .A(n629), .Y(n630) );
  INVX8 U739 ( .A(n629), .Y(n631) );
  INVX8 U740 ( .A(n634), .Y(n635) );
  INVX8 U741 ( .A(n634), .Y(n636) );
  INVX8 U742 ( .A(n640), .Y(n642) );
  INVX2 U743 ( .A(n382), .Y(n619) );
  INVX4 U744 ( .A(n389), .Y(n640) );
  INVX4 U745 ( .A(n384), .Y(n629) );
  INVX1 U746 ( .A(n382), .Y(n649) );
  INVX4 U747 ( .A(n649), .Y(n623) );
  OAI22X1 U748 ( .A(outreg_data[9]), .B(n36), .C(\regs_matrix[2][9] ), .D(n628), .Y(n651) );
  INVX4 U749 ( .A(n643), .Y(n645) );
  INVX4 U750 ( .A(n643), .Y(n644) );
  INVX4 U751 ( .A(n19), .Y(n632) );
  INVX8 U752 ( .A(n19), .Y(n633) );
  INVX8 U753 ( .A(n652), .Y(r2_data[0]) );
endmodule


module datapath ( clk, n_reset, op, src1, src2, dest, ext_data1, ext_data2, 
        outreg_data, overflow );
  input [2:0] op;
  input [3:0] src1;
  input [3:0] src2;
  input [3:0] dest;
  input [15:0] ext_data1;
  input [15:0] ext_data2;
  output [16:0] outreg_data;
  input clk, n_reset;
  output overflow;
  wire   w_en, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45;
  wire   [1:0] w_data_sel;
  wire   [1:0] alu_op;
  wire   [16:0] src1_data;
  wire   [16:0] src2_data;
  wire   [16:0] alu_result;
  wire   [16:0] dest_data;

  datapath_decode DEC ( .op(op), .w_en(w_en), .w_data_sel(w_data_sel), 
        .alu_op(alu_op) );
  alu CORE ( .src1_data({src1_data[16:12], n4, n6, src1_data[9:6], n2, 
        src1_data[4:0]}), .src2_data({src2_data[16:11], n7, src2_data[9:4], n8, 
        src2_data[2:0]}), .alu_op(alu_op), .result(alu_result), .overflow(
        overflow) );
  register_file RF ( .clk(clk), .n_reset(n_reset), .w_en(w_en), .r1_sel(src1), 
        .r2_sel({src2[3:1], n11}), .w_sel(dest), .w_data(dest_data), .r1_data(
        src1_data), .r2_data(src2_data), .outreg_data(outreg_data) );
  INVX2 U2 ( .A(n3), .Y(n4) );
  INVX2 U3 ( .A(src1_data[5]), .Y(n1) );
  INVX4 U4 ( .A(n1), .Y(n2) );
  INVX2 U5 ( .A(src1_data[11]), .Y(n3) );
  INVX2 U6 ( .A(src1_data[10]), .Y(n5) );
  INVX4 U7 ( .A(n5), .Y(n6) );
  BUFX4 U8 ( .A(src2_data[10]), .Y(n7) );
  BUFX4 U9 ( .A(src2_data[3]), .Y(n8) );
  INVX2 U10 ( .A(w_data_sel[1]), .Y(n45) );
  AND2X2 U11 ( .A(n45), .B(n12), .Y(n9) );
  AND2X2 U12 ( .A(w_data_sel[0]), .B(n45), .Y(n10) );
  BUFX4 U13 ( .A(src2[0]), .Y(n11) );
  AND2X2 U14 ( .A(alu_result[16]), .B(w_data_sel[1]), .Y(dest_data[16]) );
  INVX2 U15 ( .A(alu_result[15]), .Y(n14) );
  INVX2 U16 ( .A(w_data_sel[0]), .Y(n12) );
  AOI22X1 U17 ( .A(ext_data2[15]), .B(n10), .C(ext_data1[15]), .D(n9), .Y(n13)
         );
  OAI21X1 U18 ( .A(n45), .B(n14), .C(n13), .Y(dest_data[15]) );
  INVX2 U19 ( .A(alu_result[14]), .Y(n16) );
  AOI22X1 U20 ( .A(ext_data2[14]), .B(n10), .C(ext_data1[14]), .D(n9), .Y(n15)
         );
  OAI21X1 U21 ( .A(n45), .B(n16), .C(n15), .Y(dest_data[14]) );
  INVX2 U22 ( .A(alu_result[13]), .Y(n18) );
  AOI22X1 U23 ( .A(ext_data2[13]), .B(n10), .C(ext_data1[13]), .D(n9), .Y(n17)
         );
  OAI21X1 U24 ( .A(n45), .B(n18), .C(n17), .Y(dest_data[13]) );
  INVX2 U25 ( .A(alu_result[12]), .Y(n20) );
  AOI22X1 U26 ( .A(ext_data2[12]), .B(n10), .C(ext_data1[12]), .D(n9), .Y(n19)
         );
  OAI21X1 U27 ( .A(n45), .B(n20), .C(n19), .Y(dest_data[12]) );
  INVX2 U28 ( .A(alu_result[11]), .Y(n22) );
  AOI22X1 U29 ( .A(ext_data2[11]), .B(n10), .C(ext_data1[11]), .D(n9), .Y(n21)
         );
  OAI21X1 U30 ( .A(n45), .B(n22), .C(n21), .Y(dest_data[11]) );
  INVX2 U31 ( .A(alu_result[10]), .Y(n24) );
  AOI22X1 U32 ( .A(ext_data2[10]), .B(n10), .C(ext_data1[10]), .D(n9), .Y(n23)
         );
  OAI21X1 U33 ( .A(n45), .B(n24), .C(n23), .Y(dest_data[10]) );
  INVX2 U34 ( .A(alu_result[9]), .Y(n26) );
  AOI22X1 U35 ( .A(ext_data2[9]), .B(n10), .C(ext_data1[9]), .D(n9), .Y(n25)
         );
  OAI21X1 U36 ( .A(n45), .B(n26), .C(n25), .Y(dest_data[9]) );
  INVX2 U37 ( .A(alu_result[8]), .Y(n28) );
  AOI22X1 U38 ( .A(ext_data2[8]), .B(n10), .C(ext_data1[8]), .D(n9), .Y(n27)
         );
  OAI21X1 U39 ( .A(n45), .B(n28), .C(n27), .Y(dest_data[8]) );
  INVX2 U40 ( .A(alu_result[7]), .Y(n30) );
  AOI22X1 U41 ( .A(ext_data2[7]), .B(n10), .C(ext_data1[7]), .D(n9), .Y(n29)
         );
  OAI21X1 U42 ( .A(n45), .B(n30), .C(n29), .Y(dest_data[7]) );
  INVX2 U43 ( .A(alu_result[6]), .Y(n32) );
  AOI22X1 U44 ( .A(ext_data2[6]), .B(n10), .C(ext_data1[6]), .D(n9), .Y(n31)
         );
  OAI21X1 U45 ( .A(n45), .B(n32), .C(n31), .Y(dest_data[6]) );
  INVX2 U46 ( .A(alu_result[5]), .Y(n34) );
  AOI22X1 U47 ( .A(ext_data2[5]), .B(n10), .C(ext_data1[5]), .D(n9), .Y(n33)
         );
  OAI21X1 U48 ( .A(n45), .B(n34), .C(n33), .Y(dest_data[5]) );
  INVX2 U49 ( .A(alu_result[4]), .Y(n36) );
  AOI22X1 U50 ( .A(ext_data2[4]), .B(n10), .C(ext_data1[4]), .D(n9), .Y(n35)
         );
  OAI21X1 U51 ( .A(n45), .B(n36), .C(n35), .Y(dest_data[4]) );
  INVX2 U52 ( .A(alu_result[3]), .Y(n38) );
  AOI22X1 U53 ( .A(ext_data2[3]), .B(n10), .C(ext_data1[3]), .D(n9), .Y(n37)
         );
  OAI21X1 U54 ( .A(n45), .B(n38), .C(n37), .Y(dest_data[3]) );
  INVX2 U55 ( .A(alu_result[2]), .Y(n40) );
  AOI22X1 U56 ( .A(ext_data2[2]), .B(n10), .C(ext_data1[2]), .D(n9), .Y(n39)
         );
  OAI21X1 U57 ( .A(n45), .B(n40), .C(n39), .Y(dest_data[2]) );
  INVX2 U58 ( .A(alu_result[1]), .Y(n42) );
  AOI22X1 U59 ( .A(ext_data2[1]), .B(n10), .C(ext_data1[1]), .D(n9), .Y(n41)
         );
  OAI21X1 U60 ( .A(n45), .B(n42), .C(n41), .Y(dest_data[1]) );
  INVX2 U61 ( .A(alu_result[0]), .Y(n44) );
  AOI22X1 U62 ( .A(ext_data2[0]), .B(n10), .C(ext_data1[0]), .D(n9), .Y(n43)
         );
  OAI21X1 U63 ( .A(n45), .B(n44), .C(n43), .Y(dest_data[0]) );
endmodule


module flex_counter_NUM_CNT_BITS10_DW01_inc_0 ( A, SUM );
  input [9:0] A;
  output [9:0] SUM;

  wire   [9:2] carry;

  HAX1 U1_1_8 ( .A(A[8]), .B(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  HAX1 U1_1_7 ( .A(A[7]), .B(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  HAX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  HAX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  HAX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  HAX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  HAX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  HAX1 U1_1_1 ( .A(A[1]), .B(A[0]), .YC(carry[2]), .YS(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[9]), .B(A[9]), .Y(SUM[9]) );
endmodule


module flex_counter_NUM_CNT_BITS10 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [9:0] rollover_val;
  output [9:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20,
         N21, N22, N23, N24, N25, N26, n16, n17, n18, n19, n20, n21, n22, n23,
         n24, n25, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n47, n48, n49, n50, n51, n52, n53, n54,
         n55, n56, n57, n1, n2, n3;

  DFFSR \count_out_reg[0]  ( .D(n25), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(n24), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(n23), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(n22), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR \count_out_reg[4]  ( .D(n21), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[4]) );
  DFFSR \count_out_reg[5]  ( .D(n20), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[5]) );
  DFFSR \count_out_reg[6]  ( .D(n19), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[6]) );
  DFFSR \count_out_reg[7]  ( .D(n18), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[7]) );
  DFFSR \count_out_reg[8]  ( .D(n17), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[8]) );
  DFFSR \count_out_reg[9]  ( .D(n16), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[9]) );
  DFFSR rollover_flag_reg ( .D(n57), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  AND2X2 U14 ( .A(n3), .B(count_out[2]), .Y(N9) );
  AND2X2 U15 ( .A(n3), .B(count_out[1]), .Y(N8) );
  AND2X2 U16 ( .A(n3), .B(count_out[0]), .Y(N7) );
  AND2X2 U17 ( .A(n3), .B(count_out[9]), .Y(N16) );
  AND2X2 U18 ( .A(n3), .B(count_out[8]), .Y(N15) );
  AND2X2 U19 ( .A(n3), .B(count_out[7]), .Y(N14) );
  AND2X2 U20 ( .A(n3), .B(count_out[6]), .Y(N13) );
  AND2X2 U21 ( .A(n3), .B(count_out[5]), .Y(N12) );
  AND2X2 U22 ( .A(n3), .B(count_out[4]), .Y(N11) );
  AND2X2 U23 ( .A(n3), .B(count_out[3]), .Y(N10) );
  INVX2 U24 ( .A(n47), .Y(n16) );
  INVX2 U25 ( .A(n48), .Y(n17) );
  INVX2 U26 ( .A(n49), .Y(n18) );
  INVX2 U27 ( .A(n50), .Y(n19) );
  INVX2 U28 ( .A(n51), .Y(n20) );
  INVX2 U29 ( .A(n52), .Y(n21) );
  INVX2 U30 ( .A(n53), .Y(n22) );
  INVX2 U31 ( .A(n54), .Y(n23) );
  INVX2 U32 ( .A(n55), .Y(n24) );
  INVX2 U33 ( .A(n56), .Y(n25) );
  OAI21X1 U36 ( .A(n1), .B(n3), .C(n28), .Y(n57) );
  NAND2X1 U37 ( .A(n29), .B(n30), .Y(n28) );
  NOR2X1 U38 ( .A(n31), .B(n32), .Y(n30) );
  NAND3X1 U39 ( .A(n33), .B(n34), .C(n35), .Y(n32) );
  XNOR2X1 U40 ( .A(N26), .B(rollover_val[9]), .Y(n35) );
  XNOR2X1 U41 ( .A(N23), .B(rollover_val[6]), .Y(n34) );
  XNOR2X1 U42 ( .A(N24), .B(rollover_val[7]), .Y(n33) );
  NAND3X1 U43 ( .A(n36), .B(n37), .C(n38), .Y(n31) );
  XNOR2X1 U44 ( .A(N20), .B(rollover_val[3]), .Y(n38) );
  XNOR2X1 U45 ( .A(N25), .B(rollover_val[8]), .Y(n36) );
  NOR2X1 U46 ( .A(n39), .B(n40), .Y(n29) );
  NAND2X1 U47 ( .A(n41), .B(n42), .Y(n40) );
  XNOR2X1 U48 ( .A(N18), .B(rollover_val[1]), .Y(n42) );
  XNOR2X1 U49 ( .A(N17), .B(rollover_val[0]), .Y(n41) );
  NAND3X1 U50 ( .A(n43), .B(n44), .C(n45), .Y(n39) );
  XNOR2X1 U51 ( .A(N19), .B(rollover_val[2]), .Y(n45) );
  XNOR2X1 U52 ( .A(N21), .B(rollover_val[4]), .Y(n44) );
  XNOR2X1 U53 ( .A(N22), .B(rollover_val[5]), .Y(n43) );
  AOI22X1 U54 ( .A(n2), .B(count_out[9]), .C(N26), .D(n37), .Y(n47) );
  AOI22X1 U55 ( .A(n2), .B(count_out[8]), .C(N25), .D(n37), .Y(n48) );
  AOI22X1 U56 ( .A(n2), .B(count_out[7]), .C(N24), .D(n37), .Y(n49) );
  AOI22X1 U57 ( .A(n2), .B(count_out[6]), .C(N23), .D(n37), .Y(n50) );
  AOI22X1 U58 ( .A(n2), .B(count_out[5]), .C(N22), .D(n37), .Y(n51) );
  AOI22X1 U59 ( .A(n2), .B(count_out[4]), .C(N21), .D(n37), .Y(n52) );
  AOI22X1 U60 ( .A(n2), .B(count_out[3]), .C(N20), .D(n37), .Y(n53) );
  AOI22X1 U61 ( .A(n2), .B(count_out[2]), .C(N19), .D(n37), .Y(n54) );
  AOI22X1 U62 ( .A(n2), .B(count_out[1]), .C(N18), .D(n37), .Y(n55) );
  AOI22X1 U63 ( .A(n2), .B(count_out[0]), .C(N17), .D(n37), .Y(n56) );
  NOR2X1 U64 ( .A(n2), .B(clear), .Y(n37) );
  flex_counter_NUM_CNT_BITS10_DW01_inc_0 add_26 ( .A({N16, N15, N14, N13, N12, 
        N11, N10, N9, N8, N7}), .SUM({N26, N25, N24, N23, N22, N21, N20, N19, 
        N18, N17}) );
  INVX2 U34 ( .A(n1), .Y(n2) );
  INVX2 U35 ( .A(rollover_flag), .Y(n3) );
  OR2X1 U65 ( .A(clear), .B(count_enable), .Y(n1) );
endmodule


module counter ( clk, n_rst, cnt_up, clear, one_k_samples );
  input clk, n_rst, cnt_up, clear;
  output one_k_samples;


  flex_counter_NUM_CNT_BITS10 fc ( .clk(clk), .n_rst(n_rst), .clear(clear), 
        .count_enable(cnt_up), .rollover_val({1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 
        1'b0, 1'b1, 1'b0, 1'b0, 1'b0}), .rollover_flag(one_k_samples) );
endmodule


module magnitude_DW01_dec_0 ( A, SUM );
  input [15:0] A;
  output [15:0] SUM;
  wire   n1, n2, n3, n5, n7, n9, n11, n13, n16, n17, n18, n19, n20, n21, n22,
         n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35;

  INVX2 U1 ( .A(A[13]), .Y(n1) );
  INVX2 U2 ( .A(n32), .Y(n2) );
  INVX2 U3 ( .A(A[12]), .Y(n3) );
  INVX2 U4 ( .A(n34), .Y(SUM[11]) );
  INVX2 U5 ( .A(A[10]), .Y(n5) );
  INVX2 U6 ( .A(n16), .Y(SUM[9]) );
  INVX2 U7 ( .A(A[8]), .Y(n7) );
  INVX2 U8 ( .A(n20), .Y(SUM[7]) );
  INVX2 U9 ( .A(A[6]), .Y(n9) );
  INVX2 U10 ( .A(n23), .Y(SUM[5]) );
  INVX2 U11 ( .A(A[4]), .Y(n11) );
  INVX2 U12 ( .A(n26), .Y(SUM[3]) );
  INVX2 U13 ( .A(A[2]), .Y(n13) );
  INVX2 U14 ( .A(n29), .Y(SUM[1]) );
  INVX2 U15 ( .A(A[0]), .Y(SUM[0]) );
  AOI21X1 U16 ( .A(n17), .B(A[9]), .C(n18), .Y(n16) );
  OAI21X1 U17 ( .A(n19), .B(n7), .C(n17), .Y(SUM[8]) );
  AOI21X1 U18 ( .A(n21), .B(A[7]), .C(n19), .Y(n20) );
  OAI21X1 U19 ( .A(n22), .B(n9), .C(n21), .Y(SUM[6]) );
  AOI21X1 U20 ( .A(n24), .B(A[5]), .C(n22), .Y(n23) );
  OAI21X1 U21 ( .A(n25), .B(n11), .C(n24), .Y(SUM[4]) );
  AOI21X1 U22 ( .A(n27), .B(A[3]), .C(n25), .Y(n26) );
  OAI21X1 U23 ( .A(n28), .B(n13), .C(n27), .Y(SUM[2]) );
  AOI21X1 U24 ( .A(A[0]), .B(A[1]), .C(n28), .Y(n29) );
  XOR2X1 U25 ( .A(A[15]), .B(n30), .Y(SUM[15]) );
  NOR2X1 U26 ( .A(A[14]), .B(n31), .Y(n30) );
  XNOR2X1 U27 ( .A(A[14]), .B(n31), .Y(SUM[14]) );
  OAI21X1 U28 ( .A(n2), .B(n1), .C(n31), .Y(SUM[13]) );
  NAND2X1 U29 ( .A(n2), .B(n1), .Y(n31) );
  OAI21X1 U30 ( .A(n33), .B(n3), .C(n32), .Y(SUM[12]) );
  NAND2X1 U31 ( .A(n33), .B(n3), .Y(n32) );
  AOI21X1 U32 ( .A(n35), .B(A[11]), .C(n33), .Y(n34) );
  NOR2X1 U33 ( .A(n35), .B(A[11]), .Y(n33) );
  OAI21X1 U34 ( .A(n18), .B(n5), .C(n35), .Y(SUM[10]) );
  NAND2X1 U35 ( .A(n18), .B(n5), .Y(n35) );
  NOR2X1 U36 ( .A(n17), .B(A[9]), .Y(n18) );
  NAND2X1 U37 ( .A(n19), .B(n7), .Y(n17) );
  NOR2X1 U38 ( .A(n21), .B(A[7]), .Y(n19) );
  NAND2X1 U39 ( .A(n22), .B(n9), .Y(n21) );
  NOR2X1 U40 ( .A(n24), .B(A[5]), .Y(n22) );
  NAND2X1 U41 ( .A(n25), .B(n11), .Y(n24) );
  NOR2X1 U42 ( .A(n27), .B(A[3]), .Y(n25) );
  NAND2X1 U43 ( .A(n28), .B(n13), .Y(n27) );
  NOR2X1 U44 ( .A(A[1]), .B(A[0]), .Y(n28) );
endmodule


module magnitude ( in, out );
  input [16:0] in;
  output [15:0] out;
  wire   N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16,
         N17, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n1;

  OAI21X1 U3 ( .A(N11), .B(n1), .C(n2), .Y(out[9]) );
  NAND2X1 U4 ( .A(in[9]), .B(n1), .Y(n2) );
  OAI21X1 U5 ( .A(N10), .B(n1), .C(n3), .Y(out[8]) );
  NAND2X1 U6 ( .A(in[8]), .B(n1), .Y(n3) );
  OAI21X1 U7 ( .A(N9), .B(n1), .C(n4), .Y(out[7]) );
  NAND2X1 U8 ( .A(in[7]), .B(n1), .Y(n4) );
  OAI21X1 U9 ( .A(N8), .B(n1), .C(n5), .Y(out[6]) );
  NAND2X1 U10 ( .A(in[6]), .B(n1), .Y(n5) );
  OAI21X1 U11 ( .A(N7), .B(n1), .C(n6), .Y(out[5]) );
  NAND2X1 U12 ( .A(in[5]), .B(n1), .Y(n6) );
  OAI21X1 U13 ( .A(N6), .B(n1), .C(n7), .Y(out[4]) );
  NAND2X1 U14 ( .A(in[4]), .B(n1), .Y(n7) );
  OAI21X1 U15 ( .A(N5), .B(n1), .C(n8), .Y(out[3]) );
  NAND2X1 U16 ( .A(in[3]), .B(n1), .Y(n8) );
  OAI21X1 U17 ( .A(N4), .B(n1), .C(n9), .Y(out[2]) );
  NAND2X1 U18 ( .A(in[2]), .B(n1), .Y(n9) );
  OAI21X1 U19 ( .A(N3), .B(n1), .C(n10), .Y(out[1]) );
  NAND2X1 U20 ( .A(in[1]), .B(n1), .Y(n10) );
  OAI21X1 U21 ( .A(N17), .B(n1), .C(n11), .Y(out[15]) );
  NAND2X1 U22 ( .A(in[15]), .B(n1), .Y(n11) );
  OAI21X1 U23 ( .A(N16), .B(n1), .C(n12), .Y(out[14]) );
  NAND2X1 U24 ( .A(in[14]), .B(n1), .Y(n12) );
  OAI21X1 U25 ( .A(N15), .B(n1), .C(n13), .Y(out[13]) );
  NAND2X1 U26 ( .A(in[13]), .B(n1), .Y(n13) );
  OAI21X1 U27 ( .A(N14), .B(n1), .C(n14), .Y(out[12]) );
  NAND2X1 U28 ( .A(in[12]), .B(n1), .Y(n14) );
  OAI21X1 U29 ( .A(N13), .B(n1), .C(n15), .Y(out[11]) );
  NAND2X1 U30 ( .A(in[11]), .B(n1), .Y(n15) );
  OAI21X1 U31 ( .A(N12), .B(n1), .C(n16), .Y(out[10]) );
  NAND2X1 U32 ( .A(in[10]), .B(n1), .Y(n16) );
  OAI21X1 U33 ( .A(N2), .B(n1), .C(n17), .Y(out[0]) );
  NAND2X1 U34 ( .A(in[0]), .B(n1), .Y(n17) );
  magnitude_DW01_dec_0 sub_3 ( .A(in[15:0]), .SUM({N17, N16, N15, N14, N13, 
        N12, N11, N10, N9, N8, N7, N6, N5, N4, N3, N2}) );
  INVX2 U2 ( .A(in[16]), .Y(n1) );
endmodule


module fir_filter ( clk, n_reset, sample_data, fir_coefficient, load_coeff, 
        data_ready, one_k_samples, modwait, fir_out, err );
  input [15:0] sample_data;
  input [15:0] fir_coefficient;
  output [15:0] fir_out;
  input clk, n_reset, load_coeff, data_ready;
  output one_k_samples, modwait, err;
  wire   dr_sync, lc_sync, overflow, cnt_up;
  wire   [2:0] op;
  wire   [3:0] src1;
  wire   [3:0] src2;
  wire   [3:0] dest;
  wire   [16:0] raw_out;

  sync_low_1 sdr ( .clk(clk), .n_rst(n_reset), .async_in(data_ready), 
        .sync_out(dr_sync) );
  sync_low_0 slc ( .clk(clk), .n_rst(n_reset), .async_in(load_coeff), 
        .sync_out(lc_sync) );
  controller c ( .clk(clk), .n_rst(n_reset), .dr(dr_sync), .lc(lc_sync), 
        .overflow(overflow), .cnt_up(cnt_up), .modwait(modwait), .op(op), 
        .src1(src1), .src2(src2), .dest(dest), .err(err) );
  datapath p ( .clk(clk), .n_reset(n_reset), .op(op), .src1(src1), .src2(src2), 
        .dest(dest), .ext_data1(sample_data), .ext_data2(fir_coefficient), 
        .outreg_data(raw_out), .overflow(overflow) );
  counter sc ( .clk(clk), .n_rst(n_reset), .cnt_up(cnt_up), .clear(1'b0), 
        .one_k_samples(one_k_samples) );
  magnitude mag ( .in(raw_out), .out(fir_out) );
endmodule

