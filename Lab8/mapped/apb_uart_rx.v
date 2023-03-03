/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Fri Mar  3 16:34:33 2023
/////////////////////////////////////////////////////////////


module rx_data_buff ( clk, n_rst, load_buffer, packet_data, data_read, rx_data, 
        data_ready, overrun_error );
  input [7:0] packet_data;
  output [7:0] rx_data;
  input clk, n_rst, load_buffer, data_read;
  output data_ready, overrun_error;
  wire   n30, n31, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n15, n17, n19,
         n21, n23, n25, n27, n29;

  DFFSR \rx_data_reg[7]  ( .D(n15), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[7]) );
  DFFSR \rx_data_reg[6]  ( .D(n17), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[6]) );
  DFFSR \rx_data_reg[5]  ( .D(n19), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[5]) );
  DFFSR \rx_data_reg[4]  ( .D(n21), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[4]) );
  DFFSR \rx_data_reg[3]  ( .D(n23), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[3]) );
  DFFSR \rx_data_reg[2]  ( .D(n25), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[2]) );
  DFFSR \rx_data_reg[1]  ( .D(n27), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[1]) );
  DFFSR \rx_data_reg[0]  ( .D(n29), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[0]) );
  DFFSR data_ready_reg ( .D(n31), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_ready) );
  DFFSR overrun_error_reg ( .D(n30), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        overrun_error) );
  INVX1 U3 ( .A(n1), .Y(n15) );
  MUX2X1 U4 ( .B(rx_data[7]), .A(packet_data[7]), .S(load_buffer), .Y(n1) );
  INVX1 U5 ( .A(n2), .Y(n17) );
  MUX2X1 U6 ( .B(rx_data[6]), .A(packet_data[6]), .S(load_buffer), .Y(n2) );
  INVX1 U7 ( .A(n3), .Y(n19) );
  MUX2X1 U8 ( .B(rx_data[5]), .A(packet_data[5]), .S(load_buffer), .Y(n3) );
  INVX1 U9 ( .A(n4), .Y(n21) );
  MUX2X1 U10 ( .B(rx_data[4]), .A(packet_data[4]), .S(load_buffer), .Y(n4) );
  INVX1 U11 ( .A(n5), .Y(n23) );
  MUX2X1 U12 ( .B(rx_data[3]), .A(packet_data[3]), .S(load_buffer), .Y(n5) );
  INVX1 U13 ( .A(n6), .Y(n25) );
  MUX2X1 U14 ( .B(rx_data[2]), .A(packet_data[2]), .S(load_buffer), .Y(n6) );
  INVX1 U15 ( .A(n7), .Y(n27) );
  MUX2X1 U16 ( .B(rx_data[1]), .A(packet_data[1]), .S(load_buffer), .Y(n7) );
  INVX1 U17 ( .A(n8), .Y(n29) );
  MUX2X1 U18 ( .B(rx_data[0]), .A(packet_data[0]), .S(load_buffer), .Y(n8) );
  OAI21X1 U19 ( .A(data_read), .B(n9), .C(n10), .Y(n31) );
  INVX1 U20 ( .A(load_buffer), .Y(n10) );
  INVX1 U21 ( .A(data_ready), .Y(n9) );
  NOR2X1 U22 ( .A(data_read), .B(n11), .Y(n30) );
  AOI21X1 U23 ( .A(data_ready), .B(load_buffer), .C(overrun_error), .Y(n11) );
endmodule


module rcu ( clk, n_rst, new_packet_detected, packet_done, framing_error, 
        sbc_clear, sbc_enable, load_buffer, enable_timer );
  input clk, n_rst, new_packet_detected, packet_done, framing_error;
  output sbc_clear, sbc_enable, load_buffer, enable_timer;
  wire   n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20;
  wire   [31:0] state;
  wire   [2:0] nstate;

  DFFSR \state_reg[0]  ( .D(nstate[0]), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        state[0]) );
  DFFSR \state_reg[1]  ( .D(nstate[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[1]) );
  DFFSR \state_reg[2]  ( .D(nstate[2]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[2]) );
  OAI21X1 U6 ( .A(n4), .B(n5), .C(n6), .Y(nstate[2]) );
  AND2X1 U7 ( .A(n7), .B(n8), .Y(n6) );
  INVX1 U8 ( .A(packet_done), .Y(n5) );
  NAND3X1 U9 ( .A(n8), .B(n9), .C(n10), .Y(nstate[1]) );
  INVX1 U10 ( .A(n11), .Y(n10) );
  OAI22X1 U11 ( .A(n12), .B(n13), .C(n4), .D(packet_done), .Y(n11) );
  INVX1 U12 ( .A(new_packet_detected), .Y(n12) );
  OR2X1 U13 ( .A(n14), .B(n15), .Y(nstate[0]) );
  OAI22X1 U14 ( .A(packet_done), .B(n4), .C(new_packet_detected), .D(n13), .Y(
        n15) );
  MUX2X1 U15 ( .B(framing_error), .A(n16), .S(n8), .Y(n14) );
  NAND3X1 U16 ( .A(state[2]), .B(n17), .C(state[0]), .Y(n8) );
  NAND2X1 U17 ( .A(n13), .B(n4), .Y(n16) );
  NAND3X1 U18 ( .A(n17), .B(n18), .C(state[0]), .Y(n13) );
  INVX1 U19 ( .A(n9), .Y(sbc_clear) );
  NAND3X1 U20 ( .A(n19), .B(n18), .C(state[1]), .Y(n9) );
  INVX1 U21 ( .A(n7), .Y(sbc_enable) );
  NOR2X1 U22 ( .A(n17), .B(n20), .Y(load_buffer) );
  NAND2X1 U23 ( .A(state[0]), .B(state[2]), .Y(n20) );
  NAND2X1 U24 ( .A(n7), .B(n4), .Y(enable_timer) );
  NAND3X1 U25 ( .A(state[0]), .B(n18), .C(state[1]), .Y(n4) );
  INVX1 U26 ( .A(state[2]), .Y(n18) );
  NAND3X1 U27 ( .A(n19), .B(n17), .C(state[2]), .Y(n7) );
  INVX1 U28 ( .A(state[1]), .Y(n17) );
  INVX1 U29 ( .A(state[0]), .Y(n19) );
endmodule


module flex_stp_sr_NUM_BITS9_SHIFT_MSB0 ( clk, n_rst, shift_enable, serial_in, 
        parallel_out );
  output [8:0] parallel_out;
  input clk, n_rst, shift_enable, serial_in;
  wire   n13, n15, n17, n19, n21, n23, n25, n27, n29, n1, n2, n3, n4, n5, n6,
         n7, n8, n9;

  DFFSR \state_reg[8]  ( .D(n29), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[8]) );
  DFFSR \state_reg[7]  ( .D(n27), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[7]) );
  DFFSR \state_reg[6]  ( .D(n25), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[6]) );
  DFFSR \state_reg[5]  ( .D(n23), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[5]) );
  DFFSR \state_reg[4]  ( .D(n21), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[4]) );
  DFFSR \state_reg[3]  ( .D(n19), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[3]) );
  DFFSR \state_reg[2]  ( .D(n17), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[2]) );
  DFFSR \state_reg[1]  ( .D(n15), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[1]) );
  DFFSR \state_reg[0]  ( .D(n13), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[0]) );
  INVX1 U2 ( .A(n1), .Y(n29) );
  MUX2X1 U3 ( .B(parallel_out[8]), .A(serial_in), .S(shift_enable), .Y(n1) );
  INVX1 U4 ( .A(n2), .Y(n27) );
  MUX2X1 U5 ( .B(parallel_out[7]), .A(parallel_out[8]), .S(shift_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n25) );
  MUX2X1 U7 ( .B(parallel_out[6]), .A(parallel_out[7]), .S(shift_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n23) );
  MUX2X1 U9 ( .B(parallel_out[5]), .A(parallel_out[6]), .S(shift_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n21) );
  MUX2X1 U11 ( .B(parallel_out[4]), .A(parallel_out[5]), .S(shift_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n19) );
  MUX2X1 U13 ( .B(parallel_out[3]), .A(parallel_out[4]), .S(shift_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n17) );
  MUX2X1 U15 ( .B(parallel_out[2]), .A(parallel_out[3]), .S(shift_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n15) );
  MUX2X1 U17 ( .B(parallel_out[1]), .A(parallel_out[2]), .S(shift_enable), .Y(
        n8) );
  INVX1 U18 ( .A(n9), .Y(n13) );
  MUX2X1 U19 ( .B(parallel_out[0]), .A(parallel_out[1]), .S(shift_enable), .Y(
        n9) );
endmodule


module sr_9bit ( clk, n_rst, shift_strobe, serial_in, packet_data, stop_bit );
  output [7:0] packet_data;
  input clk, n_rst, shift_strobe, serial_in;
  output stop_bit;


  flex_stp_sr_NUM_BITS9_SHIFT_MSB0 sr ( .clk(clk), .n_rst(n_rst), 
        .shift_enable(shift_strobe), .serial_in(serial_in), .parallel_out({
        stop_bit, packet_data}) );
endmodule


module flex_counter_NUM_CNT_BITS14_DW01_inc_0 ( A, SUM );
  input [13:0] A;
  output [13:0] SUM;

  wire   [13:2] carry;

  HAX1 U1_1_12 ( .A(A[12]), .B(carry[12]), .YC(carry[13]), .YS(SUM[12]) );
  HAX1 U1_1_11 ( .A(A[11]), .B(carry[11]), .YC(carry[12]), .YS(SUM[11]) );
  HAX1 U1_1_10 ( .A(A[10]), .B(carry[10]), .YC(carry[11]), .YS(SUM[10]) );
  HAX1 U1_1_9 ( .A(A[9]), .B(carry[9]), .YC(carry[10]), .YS(SUM[9]) );
  HAX1 U1_1_8 ( .A(A[8]), .B(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  HAX1 U1_1_7 ( .A(A[7]), .B(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  HAX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  HAX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  HAX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  HAX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  HAX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  HAX1 U1_1_1 ( .A(A[1]), .B(A[0]), .YC(carry[2]), .YS(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[13]), .B(A[13]), .Y(SUM[13]) );
endmodule


module flex_counter_NUM_CNT_BITS14 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [13:0] rollover_val;
  output [13:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20,
         N21, N22, N23, N24, N25, N26, N27, N28, N29, N30, N31, N32, N33, N34,
         n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65,
         n66, n1, n2, n3, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n67, n68, n69, n70, n71,
         n72, n73, n74;

  DFFSR \count_out_reg[0]  ( .D(n66), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(n64), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(n63), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(n62), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR \count_out_reg[4]  ( .D(n61), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[4]) );
  DFFSR \count_out_reg[5]  ( .D(n60), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[5]) );
  DFFSR \count_out_reg[6]  ( .D(n59), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[6]) );
  DFFSR \count_out_reg[7]  ( .D(n58), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[7]) );
  DFFSR \count_out_reg[8]  ( .D(n57), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[8]) );
  DFFSR \count_out_reg[9]  ( .D(n56), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[9]) );
  DFFSR \count_out_reg[10]  ( .D(n55), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[10]) );
  DFFSR \count_out_reg[11]  ( .D(n54), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[11]) );
  DFFSR \count_out_reg[12]  ( .D(n53), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[12]) );
  DFFSR rollover_flag_reg ( .D(n65), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  DFFSR \count_out_reg[13]  ( .D(n52), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[13]) );
  flex_counter_NUM_CNT_BITS14_DW01_inc_0 add_26 ( .A({N20, N19, N18, N17, N16, 
        N15, N14, N13, N12, N11, N10, N9, N8, N7}), .SUM({N34, N33, N32, N31, 
        N30, N29, N28, N27, N26, N25, N24, N23, N22, N21}) );
  BUFX2 U6 ( .A(n20), .Y(n1) );
  INVX2 U19 ( .A(n21), .Y(n2) );
  INVX1 U20 ( .A(n3), .Y(n66) );
  AOI22X1 U21 ( .A(n2), .B(count_out[0]), .C(n1), .D(N21), .Y(n3) );
  OAI21X1 U22 ( .A(n21), .B(n22), .C(n23), .Y(n65) );
  NAND2X1 U23 ( .A(n24), .B(n25), .Y(n23) );
  NOR2X1 U24 ( .A(n26), .B(n27), .Y(n25) );
  NAND3X1 U25 ( .A(n28), .B(n29), .C(n30), .Y(n27) );
  NOR2X1 U26 ( .A(n31), .B(n32), .Y(n30) );
  XOR2X1 U27 ( .A(rollover_val[10]), .B(N31), .Y(n32) );
  XOR2X1 U28 ( .A(rollover_val[9]), .B(N30), .Y(n31) );
  XNOR2X1 U29 ( .A(N32), .B(rollover_val[11]), .Y(n29) );
  XNOR2X1 U30 ( .A(N33), .B(rollover_val[12]), .Y(n28) );
  NAND3X1 U31 ( .A(n33), .B(n1), .C(n34), .Y(n26) );
  NOR2X1 U32 ( .A(n35), .B(n36), .Y(n34) );
  XOR2X1 U33 ( .A(rollover_val[8]), .B(N29), .Y(n36) );
  XOR2X1 U34 ( .A(rollover_val[7]), .B(N28), .Y(n35) );
  XNOR2X1 U35 ( .A(N27), .B(rollover_val[6]), .Y(n33) );
  NOR2X1 U36 ( .A(n37), .B(n38), .Y(n24) );
  NAND3X1 U37 ( .A(n39), .B(n40), .C(n41), .Y(n38) );
  XNOR2X1 U38 ( .A(N25), .B(rollover_val[4]), .Y(n41) );
  XNOR2X1 U39 ( .A(N26), .B(rollover_val[5]), .Y(n40) );
  XNOR2X1 U40 ( .A(N24), .B(rollover_val[3]), .Y(n39) );
  NAND3X1 U41 ( .A(n42), .B(n43), .C(n44), .Y(n37) );
  NOR2X1 U42 ( .A(n45), .B(n46), .Y(n44) );
  XOR2X1 U43 ( .A(rollover_val[1]), .B(N22), .Y(n46) );
  XOR2X1 U44 ( .A(rollover_val[0]), .B(N21), .Y(n45) );
  XNOR2X1 U45 ( .A(N23), .B(rollover_val[2]), .Y(n43) );
  XNOR2X1 U46 ( .A(N34), .B(rollover_val[13]), .Y(n42) );
  INVX1 U47 ( .A(n19), .Y(n21) );
  INVX1 U48 ( .A(n47), .Y(n64) );
  AOI22X1 U49 ( .A(n2), .B(count_out[1]), .C(n1), .D(N22), .Y(n47) );
  INVX1 U50 ( .A(n48), .Y(n63) );
  AOI22X1 U51 ( .A(n2), .B(count_out[2]), .C(n1), .D(N23), .Y(n48) );
  INVX1 U52 ( .A(n49), .Y(n62) );
  AOI22X1 U53 ( .A(n19), .B(count_out[3]), .C(n1), .D(N24), .Y(n49) );
  INVX1 U54 ( .A(n50), .Y(n61) );
  AOI22X1 U55 ( .A(n19), .B(count_out[4]), .C(n1), .D(N25), .Y(n50) );
  INVX1 U56 ( .A(n51), .Y(n60) );
  AOI22X1 U57 ( .A(n19), .B(count_out[5]), .C(n1), .D(N26), .Y(n51) );
  INVX1 U58 ( .A(n67), .Y(n59) );
  AOI22X1 U59 ( .A(n19), .B(count_out[6]), .C(n1), .D(N27), .Y(n67) );
  INVX1 U60 ( .A(n68), .Y(n58) );
  AOI22X1 U61 ( .A(n19), .B(count_out[7]), .C(n1), .D(N28), .Y(n68) );
  INVX1 U62 ( .A(n69), .Y(n57) );
  AOI22X1 U63 ( .A(n19), .B(count_out[8]), .C(n1), .D(N29), .Y(n69) );
  INVX1 U64 ( .A(n70), .Y(n56) );
  AOI22X1 U65 ( .A(n19), .B(count_out[9]), .C(n1), .D(N30), .Y(n70) );
  INVX1 U66 ( .A(n71), .Y(n55) );
  AOI22X1 U67 ( .A(n19), .B(count_out[10]), .C(n1), .D(N31), .Y(n71) );
  INVX1 U68 ( .A(n72), .Y(n54) );
  AOI22X1 U69 ( .A(n19), .B(count_out[11]), .C(n1), .D(N32), .Y(n72) );
  INVX1 U70 ( .A(n73), .Y(n53) );
  AOI22X1 U71 ( .A(n19), .B(count_out[12]), .C(n1), .D(N33), .Y(n73) );
  INVX1 U72 ( .A(n74), .Y(n52) );
  AOI22X1 U73 ( .A(n19), .B(count_out[13]), .C(n1), .D(N34), .Y(n74) );
  NOR2X1 U74 ( .A(n2), .B(clear), .Y(n20) );
  NOR2X1 U75 ( .A(count_enable), .B(clear), .Y(n19) );
  AND2X1 U76 ( .A(n22), .B(count_out[2]), .Y(N9) );
  AND2X1 U77 ( .A(n22), .B(count_out[1]), .Y(N8) );
  AND2X1 U78 ( .A(n22), .B(count_out[0]), .Y(N7) );
  AND2X1 U79 ( .A(n22), .B(count_out[13]), .Y(N20) );
  AND2X1 U80 ( .A(n22), .B(count_out[12]), .Y(N19) );
  AND2X1 U81 ( .A(n22), .B(count_out[11]), .Y(N18) );
  AND2X1 U82 ( .A(n22), .B(count_out[10]), .Y(N17) );
  AND2X1 U83 ( .A(n22), .B(count_out[9]), .Y(N16) );
  AND2X1 U84 ( .A(n22), .B(count_out[8]), .Y(N15) );
  AND2X1 U85 ( .A(n22), .B(count_out[7]), .Y(N14) );
  AND2X1 U86 ( .A(n22), .B(count_out[6]), .Y(N13) );
  AND2X1 U87 ( .A(n22), .B(count_out[5]), .Y(N12) );
  AND2X1 U88 ( .A(n22), .B(count_out[4]), .Y(N11) );
  AND2X1 U89 ( .A(n22), .B(count_out[3]), .Y(N10) );
  INVX1 U90 ( .A(rollover_flag), .Y(n22) );
endmodule


module flex_counter_NUM_CNT_BITS4 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n33, n34, n35, n36, n37, n1, n2, n3, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30;

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
  INVX2 U8 ( .A(n18), .Y(n1) );
  OAI22X1 U9 ( .A(n2), .B(n3), .C(n9), .D(n10), .Y(n37) );
  OAI22X1 U10 ( .A(n3), .B(n11), .C(n10), .D(n12), .Y(n36) );
  OAI22X1 U11 ( .A(n3), .B(n13), .C(n14), .D(n10), .Y(n35) );
  OAI22X1 U12 ( .A(n3), .B(n15), .C(n16), .D(n10), .Y(n34) );
  INVX1 U13 ( .A(n17), .Y(n10) );
  INVX1 U14 ( .A(count_out[3]), .Y(n15) );
  OAI22X1 U15 ( .A(n3), .B(n18), .C(n19), .D(n20), .Y(n33) );
  NAND2X1 U16 ( .A(n21), .B(n22), .Y(n20) );
  XOR2X1 U17 ( .A(n16), .B(rollover_val[3]), .Y(n22) );
  XOR2X1 U18 ( .A(n23), .B(n24), .Y(n16) );
  NOR2X1 U19 ( .A(n13), .B(n25), .Y(n24) );
  NAND2X1 U20 ( .A(count_out[3]), .B(n18), .Y(n23) );
  XOR2X1 U21 ( .A(n14), .B(rollover_val[2]), .Y(n21) );
  XOR2X1 U22 ( .A(n25), .B(n26), .Y(n14) );
  NOR2X1 U23 ( .A(rollover_flag), .B(n13), .Y(n26) );
  INVX1 U24 ( .A(count_out[2]), .Y(n13) );
  NAND3X1 U25 ( .A(n17), .B(n27), .C(n28), .Y(n19) );
  XOR2X1 U26 ( .A(n12), .B(rollover_val[1]), .Y(n28) );
  OAI21X1 U27 ( .A(n9), .B(n29), .C(n25), .Y(n12) );
  NAND2X1 U28 ( .A(n9), .B(n29), .Y(n25) );
  NOR2X1 U29 ( .A(n11), .B(n1), .Y(n29) );
  INVX1 U30 ( .A(count_out[1]), .Y(n11) );
  XOR2X1 U31 ( .A(rollover_val[0]), .B(n9), .Y(n27) );
  NOR2X1 U32 ( .A(n2), .B(rollover_flag), .Y(n9) );
  INVX1 U33 ( .A(count_out[0]), .Y(n2) );
  NOR2X1 U34 ( .A(n30), .B(clear), .Y(n17) );
  INVX1 U35 ( .A(rollover_flag), .Y(n18) );
  INVX1 U36 ( .A(n30), .Y(n3) );
  NOR2X1 U37 ( .A(count_enable), .B(clear), .Y(n30) );
endmodule


module timer ( clk, n_rst, enable_timer, bit_period, data_size, shift_strobe, 
        packet_done );
  input [13:0] bit_period;
  input [3:0] data_size;
  input clk, n_rst, enable_timer;
  output shift_strobe, packet_done;


  flex_counter_NUM_CNT_BITS14 fc0 ( .clk(clk), .n_rst(n_rst), .clear(1'b0), 
        .count_enable(enable_timer), .rollover_val(bit_period), 
        .rollover_flag(packet_done) );
  flex_counter_NUM_CNT_BITS4 fc1 ( .clk(clk), .n_rst(n_rst), .clear(1'b0), 
        .count_enable(enable_timer), .rollover_val(data_size), .rollover_flag(
        shift_strobe) );
endmodule


module start_bit_det ( clk, n_rst, serial_in, start_bit_detected, 
        new_packet_detected );
  input clk, n_rst, serial_in;
  output start_bit_detected, new_packet_detected;
  wire   start_bit_detected, old_sample, new_sample, sync_phase, n4;
  assign new_packet_detected = start_bit_detected;

  DFFSR sync_phase_reg ( .D(serial_in), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        sync_phase) );
  DFFSR new_sample_reg ( .D(sync_phase), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        new_sample) );
  DFFSR old_sample_reg ( .D(new_sample), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        old_sample) );
  NOR2X1 U6 ( .A(new_sample), .B(n4), .Y(start_bit_detected) );
  INVX1 U7 ( .A(old_sample), .Y(n4) );
endmodule


module stop_bit_chk ( clk, n_rst, sbc_clear, sbc_enable, stop_bit, 
        framing_error );
  input clk, n_rst, sbc_clear, sbc_enable, stop_bit;
  output framing_error;
  wire   n5, n2, n3;

  DFFSR framing_error_reg ( .D(n5), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        framing_error) );
  NOR2X1 U3 ( .A(sbc_clear), .B(n2), .Y(n5) );
  MUX2X1 U4 ( .B(framing_error), .A(n3), .S(sbc_enable), .Y(n2) );
  INVX1 U5 ( .A(stop_bit), .Y(n3) );
endmodule


module rcv_block ( clk, n_rst, data_size, bit_period, serial_in, data_read, 
        rx_data, data_ready, overrun_error, framing_error );
  input [3:0] data_size;
  input [13:0] bit_period;
  output [7:0] rx_data;
  input clk, n_rst, serial_in, data_read;
  output data_ready, overrun_error, framing_error;
  wire   load_buffer, new_packet_detected, packet_done, sbc_clear, sbc_enable,
         enable_timer, strobe, stop_bit;
  wire   [1:0] syncing;
  wire   [7:0] packet_data;

  DFFSR \syncing_reg[0]  ( .D(serial_in), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        syncing[0]) );
  DFFSR \syncing_reg[1]  ( .D(syncing[0]), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        syncing[1]) );
  rx_data_buff buff ( .clk(clk), .n_rst(n_rst), .load_buffer(load_buffer), 
        .packet_data(packet_data), .data_read(data_read), .rx_data(rx_data), 
        .data_ready(data_ready), .overrun_error(overrun_error) );
  rcu rc ( .clk(clk), .n_rst(n_rst), .new_packet_detected(new_packet_detected), 
        .packet_done(packet_done), .framing_error(framing_error), .sbc_clear(
        sbc_clear), .sbc_enable(sbc_enable), .load_buffer(load_buffer), 
        .enable_timer(enable_timer) );
  sr_9bit sr ( .clk(clk), .n_rst(n_rst), .shift_strobe(strobe), .serial_in(
        syncing[1]), .packet_data(packet_data), .stop_bit(stop_bit) );
  timer t ( .clk(clk), .n_rst(n_rst), .enable_timer(enable_timer), 
        .bit_period(bit_period), .data_size(data_size), .shift_strobe(strobe), 
        .packet_done(packet_done) );
  start_bit_det det ( .clk(clk), .n_rst(n_rst), .serial_in(syncing[1]), 
        .new_packet_detected(new_packet_detected) );
  stop_bit_chk chker ( .clk(clk), .n_rst(n_rst), .sbc_clear(sbc_clear), 
        .sbc_enable(sbc_enable), .stop_bit(stop_bit), .framing_error(
        framing_error) );
endmodule


module apb_slave ( clk, n_rst, rx_data, data_ready, overrun_error, 
        framing_error, psel, paddr, penable, pwrite, pwdata, data_read, prdata, 
        pslverr, data_size, bit_period );
  input [7:0] rx_data;
  input [2:0] paddr;
  input [7:0] pwdata;
  output [7:0] prdata;
  output [3:0] data_size;
  output [13:0] bit_period;
  input clk, n_rst, data_ready, overrun_error, framing_error, psel, penable,
         pwrite;
  output data_read, pslverr;
  wire   \reading[0] , \data_status[0] , n116, n118, n127, n128, n131, n132,
         n133, n134, n135, n136, n139, n140, n141, n142, n143, n144, n1, n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73,
         n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n119, n120, n121,
         n122;
  wire   [15:14] bit_period_reg;
  wire   [7:0] error_status;
  wire   [7:0] data_buf;
  wire   [1:0] nerror_status;
  assign nerror_status[1] = overrun_error;

  DFFSR \reading_reg[0]  ( .D(n118), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \reading[0] ) );
  DFFSR \reading_reg[1]  ( .D(n116), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_read) );
  DFFSR \data_status_reg[0]  ( .D(data_ready), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\data_status[0] ) );
  DFFSR \error_status_reg[1]  ( .D(nerror_status[1]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(error_status[1]) );
  DFFSR \error_status_reg[0]  ( .D(nerror_status[0]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(error_status[0]) );
  DFFSR \data_size_reg_reg[3]  ( .D(n82), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_size[3]) );
  DFFSR \data_size_reg_reg[2]  ( .D(n83), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_size[2]) );
  DFFSR \data_size_reg_reg[1]  ( .D(n144), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_size[1]) );
  DFFSR \data_size_reg_reg[0]  ( .D(n143), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_size[0]) );
  DFFSR \bit_period_reg_reg[15]  ( .D(n142), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period_reg[15]) );
  DFFSR \bit_period_reg_reg[14]  ( .D(n141), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period_reg[14]) );
  DFFSR \bit_period_reg_reg[13]  ( .D(n140), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[13]) );
  DFFSR \bit_period_reg_reg[12]  ( .D(n139), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[12]) );
  DFFSR \bit_period_reg_reg[11]  ( .D(n119), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[11]) );
  DFFSR \bit_period_reg_reg[10]  ( .D(n120), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[10]) );
  DFFSR \bit_period_reg_reg[9]  ( .D(n136), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[9]) );
  DFFSR \bit_period_reg_reg[8]  ( .D(n135), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[8]) );
  DFFSR \bit_period_reg_reg[7]  ( .D(n134), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[7]) );
  DFFSR \bit_period_reg_reg[6]  ( .D(n133), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[6]) );
  DFFSR \bit_period_reg_reg[5]  ( .D(n132), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[5]) );
  DFFSR \bit_period_reg_reg[4]  ( .D(n131), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[4]) );
  DFFSR \bit_period_reg_reg[3]  ( .D(n121), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[3]) );
  DFFSR \bit_period_reg_reg[2]  ( .D(n122), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[2]) );
  DFFSR \bit_period_reg_reg[1]  ( .D(n128), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[1]) );
  DFFSR \bit_period_reg_reg[0]  ( .D(n127), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[0]) );
  DFFSR \data_buf_reg[7]  ( .D(rx_data[7]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_buf[7]) );
  DFFSR \data_buf_reg[6]  ( .D(rx_data[6]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_buf[6]) );
  DFFSR \data_buf_reg[5]  ( .D(rx_data[5]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_buf[5]) );
  DFFSR \data_buf_reg[4]  ( .D(rx_data[4]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_buf[4]) );
  DFFSR \data_buf_reg[3]  ( .D(rx_data[3]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_buf[3]) );
  DFFSR \data_buf_reg[2]  ( .D(rx_data[2]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_buf[2]) );
  DFFSR \data_buf_reg[1]  ( .D(rx_data[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_buf[1]) );
  DFFSR \data_buf_reg[0]  ( .D(rx_data[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_buf[0]) );
  OAI21X1 U3 ( .A(n1), .B(n2), .C(n3), .Y(pslverr) );
  INVX1 U4 ( .A(n4), .Y(n1) );
  OAI21X1 U5 ( .A(n5), .B(n6), .C(n7), .Y(n4) );
  AND2X1 U6 ( .A(n8), .B(n9), .Y(prdata[7]) );
  OAI21X1 U7 ( .A(n10), .B(n11), .C(n12), .Y(n9) );
  AOI22X1 U8 ( .A(data_buf[7]), .B(n13), .C(bit_period[7]), .D(n14), .Y(n12)
         );
  AND2X1 U9 ( .A(n8), .B(n15), .Y(prdata[6]) );
  OAI21X1 U10 ( .A(n10), .B(n16), .C(n17), .Y(n15) );
  AOI22X1 U11 ( .A(data_buf[6]), .B(n13), .C(bit_period[6]), .D(n14), .Y(n17)
         );
  AND2X1 U12 ( .A(n8), .B(n18), .Y(prdata[5]) );
  OAI21X1 U13 ( .A(n10), .B(n19), .C(n20), .Y(n18) );
  AOI22X1 U14 ( .A(data_buf[5]), .B(n13), .C(bit_period[5]), .D(n14), .Y(n20)
         );
  AND2X1 U15 ( .A(n8), .B(n21), .Y(prdata[4]) );
  OAI21X1 U16 ( .A(n10), .B(n22), .C(n23), .Y(n21) );
  AOI22X1 U17 ( .A(data_buf[4]), .B(n13), .C(bit_period[4]), .D(n14), .Y(n23)
         );
  INVX1 U18 ( .A(n24), .Y(n8) );
  AOI21X1 U19 ( .A(n25), .B(n26), .C(n24), .Y(prdata[3]) );
  AOI22X1 U20 ( .A(data_size[3]), .B(n27), .C(data_buf[3]), .D(n13), .Y(n26)
         );
  AOI22X1 U21 ( .A(bit_period[3]), .B(n14), .C(bit_period[11]), .D(n28), .Y(
        n25) );
  AOI21X1 U22 ( .A(n29), .B(n30), .C(n24), .Y(prdata[2]) );
  AOI22X1 U23 ( .A(data_size[2]), .B(n27), .C(data_buf[2]), .D(n13), .Y(n30)
         );
  INVX1 U24 ( .A(n31), .Y(n27) );
  AOI22X1 U25 ( .A(bit_period[2]), .B(n14), .C(bit_period[10]), .D(n28), .Y(
        n29) );
  AOI21X1 U26 ( .A(n32), .B(n33), .C(n24), .Y(prdata[1]) );
  AOI21X1 U27 ( .A(data_buf[1]), .B(n13), .C(n34), .Y(n33) );
  OAI21X1 U28 ( .A(n31), .B(n35), .C(n36), .Y(n34) );
  NAND3X1 U29 ( .A(error_status[1]), .B(paddr[0]), .C(n37), .Y(n36) );
  NOR2X1 U30 ( .A(paddr[2]), .B(paddr[1]), .Y(n37) );
  AOI22X1 U31 ( .A(bit_period[1]), .B(n14), .C(bit_period[9]), .D(n28), .Y(n32) );
  AOI21X1 U32 ( .A(n38), .B(n39), .C(n24), .Y(prdata[0]) );
  NAND2X1 U33 ( .A(n40), .B(n2), .Y(n24) );
  AOI21X1 U34 ( .A(data_buf[0]), .B(n13), .C(n41), .Y(n39) );
  OAI22X1 U35 ( .A(n31), .B(n42), .C(n43), .D(n44), .Y(n41) );
  NAND2X1 U36 ( .A(n45), .B(n46), .Y(n44) );
  MUX2X1 U37 ( .B(\data_status[0] ), .A(error_status[0]), .S(paddr[0]), .Y(n43) );
  NAND3X1 U38 ( .A(n47), .B(n45), .C(paddr[2]), .Y(n31) );
  INVX1 U39 ( .A(n6), .Y(n13) );
  AOI22X1 U40 ( .A(bit_period[0]), .B(n14), .C(bit_period[8]), .D(n28), .Y(n38) );
  INVX1 U41 ( .A(n48), .Y(n82) );
  MUX2X1 U42 ( .B(data_size[3]), .A(pwdata[3]), .S(n49), .Y(n48) );
  INVX1 U43 ( .A(n50), .Y(n83) );
  MUX2X1 U44 ( .B(data_size[2]), .A(pwdata[2]), .S(n49), .Y(n50) );
  INVX1 U45 ( .A(n51), .Y(n119) );
  MUX2X1 U46 ( .B(bit_period[11]), .A(pwdata[3]), .S(n52), .Y(n51) );
  INVX1 U47 ( .A(n53), .Y(n120) );
  MUX2X1 U48 ( .B(bit_period[10]), .A(pwdata[2]), .S(n52), .Y(n53) );
  INVX1 U49 ( .A(n54), .Y(n121) );
  MUX2X1 U50 ( .B(bit_period[3]), .A(pwdata[3]), .S(n55), .Y(n54) );
  INVX1 U51 ( .A(n56), .Y(n122) );
  MUX2X1 U52 ( .B(bit_period[2]), .A(pwdata[2]), .S(n55), .Y(n56) );
  NOR2X1 U53 ( .A(nerror_status[1]), .B(n57), .Y(nerror_status[0]) );
  INVX1 U54 ( .A(framing_error), .Y(n57) );
  MUX2X1 U55 ( .B(n35), .A(n58), .S(n49), .Y(n144) );
  INVX1 U56 ( .A(pwdata[1]), .Y(n58) );
  INVX1 U57 ( .A(data_size[1]), .Y(n35) );
  MUX2X1 U58 ( .B(n42), .A(n59), .S(n49), .Y(n143) );
  NOR2X1 U59 ( .A(n60), .B(n61), .Y(n49) );
  NAND3X1 U60 ( .A(n40), .B(n62), .C(pwrite), .Y(n61) );
  NAND3X1 U61 ( .A(n10), .B(n6), .C(n63), .Y(n60) );
  AND2X1 U62 ( .A(n3), .B(n7), .Y(n63) );
  NAND3X1 U63 ( .A(n40), .B(paddr[2]), .C(paddr[0]), .Y(n3) );
  NAND3X1 U64 ( .A(paddr[1]), .B(n47), .C(paddr[2]), .Y(n6) );
  INVX1 U65 ( .A(pwdata[0]), .Y(n59) );
  INVX1 U66 ( .A(data_size[0]), .Y(n42) );
  MUX2X1 U67 ( .B(n11), .A(n64), .S(n52), .Y(n142) );
  INVX1 U68 ( .A(pwdata[7]), .Y(n64) );
  INVX1 U69 ( .A(bit_period_reg[15]), .Y(n11) );
  MUX2X1 U70 ( .B(n16), .A(n65), .S(n52), .Y(n141) );
  INVX1 U71 ( .A(pwdata[6]), .Y(n65) );
  INVX1 U72 ( .A(bit_period_reg[14]), .Y(n16) );
  MUX2X1 U73 ( .B(n19), .A(n66), .S(n52), .Y(n140) );
  INVX1 U74 ( .A(pwdata[5]), .Y(n66) );
  INVX1 U75 ( .A(bit_period[13]), .Y(n19) );
  MUX2X1 U76 ( .B(n22), .A(n67), .S(n52), .Y(n139) );
  INVX1 U77 ( .A(pwdata[4]), .Y(n67) );
  INVX1 U78 ( .A(bit_period[12]), .Y(n22) );
  INVX1 U79 ( .A(n68), .Y(n136) );
  MUX2X1 U80 ( .B(bit_period[9]), .A(pwdata[1]), .S(n52), .Y(n68) );
  INVX1 U81 ( .A(n69), .Y(n135) );
  MUX2X1 U82 ( .B(bit_period[8]), .A(pwdata[0]), .S(n52), .Y(n69) );
  NOR2X1 U83 ( .A(n70), .B(n14), .Y(n52) );
  INVX1 U84 ( .A(n62), .Y(n14) );
  NAND3X1 U85 ( .A(n47), .B(n46), .C(paddr[1]), .Y(n62) );
  INVX1 U86 ( .A(paddr[0]), .Y(n47) );
  INVX1 U87 ( .A(n71), .Y(n134) );
  MUX2X1 U88 ( .B(bit_period[7]), .A(pwdata[7]), .S(n55), .Y(n71) );
  INVX1 U89 ( .A(n72), .Y(n133) );
  MUX2X1 U90 ( .B(bit_period[6]), .A(pwdata[6]), .S(n55), .Y(n72) );
  INVX1 U91 ( .A(n73), .Y(n132) );
  MUX2X1 U92 ( .B(bit_period[5]), .A(pwdata[5]), .S(n55), .Y(n73) );
  INVX1 U93 ( .A(n74), .Y(n131) );
  MUX2X1 U94 ( .B(bit_period[4]), .A(pwdata[4]), .S(n55), .Y(n74) );
  INVX1 U95 ( .A(n75), .Y(n128) );
  MUX2X1 U96 ( .B(bit_period[1]), .A(pwdata[1]), .S(n55), .Y(n75) );
  INVX1 U97 ( .A(n76), .Y(n127) );
  MUX2X1 U98 ( .B(bit_period[0]), .A(pwdata[0]), .S(n55), .Y(n76) );
  NOR2X1 U99 ( .A(n70), .B(n28), .Y(n55) );
  INVX1 U100 ( .A(n10), .Y(n28) );
  NAND3X1 U101 ( .A(paddr[1]), .B(n46), .C(paddr[0]), .Y(n10) );
  NAND3X1 U102 ( .A(n7), .B(n46), .C(n77), .Y(n70) );
  NOR2X1 U103 ( .A(n5), .B(n2), .Y(n77) );
  INVX1 U104 ( .A(pwrite), .Y(n2) );
  NAND3X1 U105 ( .A(n45), .B(n46), .C(n40), .Y(n7) );
  INVX1 U106 ( .A(paddr[2]), .Y(n46) );
  INVX1 U107 ( .A(paddr[1]), .Y(n45) );
  MUX2X1 U108 ( .B(n78), .A(n79), .S(n40), .Y(n118) );
  NAND2X1 U109 ( .A(data_ready), .B(n80), .Y(n79) );
  INVX1 U110 ( .A(data_read), .Y(n80) );
  INVX1 U111 ( .A(\reading[0] ), .Y(n78) );
  MUX2X1 U112 ( .B(n81), .A(n40), .S(data_read), .Y(n116) );
  NAND2X1 U113 ( .A(\reading[0] ), .B(n40), .Y(n81) );
  INVX1 U114 ( .A(n5), .Y(n40) );
  NAND2X1 U115 ( .A(psel), .B(penable), .Y(n5) );
endmodule


module apb_uart_rx ( clk, n_rst, serial_in, psel, paddr, penable, pwrite, 
        pwdata, prdata, pslverr );
  input [2:0] paddr;
  input [7:0] pwdata;
  output [7:0] prdata;
  input clk, n_rst, serial_in, psel, penable, pwrite;
  output pslverr;
  wire   data_read, data_ready, overrun_error, framing_error;
  wire   [3:0] data_size;
  wire   [13:0] bit_period;
  wire   [7:0] rx_data;

  rcv_block rcv ( .clk(clk), .n_rst(n_rst), .data_size(data_size), 
        .bit_period(bit_period), .serial_in(serial_in), .data_read(data_read), 
        .rx_data(rx_data), .data_ready(data_ready), .overrun_error(
        overrun_error), .framing_error(framing_error) );
  apb_slave apb ( .clk(clk), .n_rst(n_rst), .rx_data(rx_data), .data_ready(
        data_ready), .overrun_error(overrun_error), .framing_error(
        framing_error), .psel(psel), .paddr(paddr), .penable(penable), 
        .pwrite(pwrite), .pwdata(pwdata), .data_read(data_read), .prdata(
        prdata), .pslverr(pslverr), .data_size(data_size), .bit_period(
        bit_period) );
endmodule

