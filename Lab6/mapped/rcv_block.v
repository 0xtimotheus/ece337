/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Tue Feb 14 15:43:58 2023
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


module flex_counter_NUM_CNT_BITS7_DW01_inc_0 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  HAX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  HAX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  HAX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  HAX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  HAX1 U1_1_1 ( .A(A[1]), .B(A[0]), .YC(carry[2]), .YS(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
endmodule


module flex_counter_NUM_CNT_BITS7 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [6:0] rollover_val;
  output [6:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20,
         n31, n32, n33, n34, n35, n36, n37, n38, n1, n2, n3, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30;

  DFFSR \count_out_reg[0]  ( .D(n38), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(n36), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(n35), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(n34), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR \count_out_reg[4]  ( .D(n33), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[4]) );
  DFFSR \count_out_reg[5]  ( .D(n32), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[5]) );
  DFFSR rollover_flag_reg ( .D(n37), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  DFFSR \count_out_reg[6]  ( .D(n31), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[6]) );
  flex_counter_NUM_CNT_BITS7_DW01_inc_0 add_26 ( .A({N13, N12, N11, N10, N9, 
        N8, N7}), .SUM({N20, N19, N18, N17, N16, N15, N14}) );
  INVX1 U6 ( .A(n1), .Y(n38) );
  AOI22X1 U12 ( .A(n2), .B(count_out[0]), .C(n3), .D(N14), .Y(n1) );
  OAI22X1 U13 ( .A(n12), .B(n13), .C(n14), .D(n15), .Y(n37) );
  NAND3X1 U14 ( .A(n16), .B(n17), .C(n18), .Y(n15) );
  NOR2X1 U15 ( .A(n19), .B(n20), .Y(n18) );
  XOR2X1 U16 ( .A(rollover_val[4]), .B(N18), .Y(n20) );
  XOR2X1 U17 ( .A(rollover_val[3]), .B(N17), .Y(n19) );
  XNOR2X1 U18 ( .A(N19), .B(rollover_val[5]), .Y(n17) );
  XNOR2X1 U19 ( .A(N20), .B(rollover_val[6]), .Y(n16) );
  NAND3X1 U20 ( .A(n21), .B(n3), .C(n22), .Y(n14) );
  NOR2X1 U21 ( .A(n23), .B(n24), .Y(n22) );
  XOR2X1 U22 ( .A(rollover_val[2]), .B(N16), .Y(n24) );
  XOR2X1 U23 ( .A(rollover_val[1]), .B(N15), .Y(n23) );
  XNOR2X1 U24 ( .A(N14), .B(rollover_val[0]), .Y(n21) );
  INVX1 U25 ( .A(n2), .Y(n12) );
  INVX1 U26 ( .A(n25), .Y(n36) );
  AOI22X1 U27 ( .A(n2), .B(count_out[1]), .C(n3), .D(N15), .Y(n25) );
  INVX1 U28 ( .A(n26), .Y(n35) );
  AOI22X1 U29 ( .A(n2), .B(count_out[2]), .C(n3), .D(N16), .Y(n26) );
  INVX1 U30 ( .A(n27), .Y(n34) );
  AOI22X1 U31 ( .A(n2), .B(count_out[3]), .C(n3), .D(N17), .Y(n27) );
  INVX1 U32 ( .A(n28), .Y(n33) );
  AOI22X1 U33 ( .A(n2), .B(count_out[4]), .C(n3), .D(N18), .Y(n28) );
  INVX1 U34 ( .A(n29), .Y(n32) );
  AOI22X1 U35 ( .A(n2), .B(count_out[5]), .C(n3), .D(N19), .Y(n29) );
  INVX1 U36 ( .A(n30), .Y(n31) );
  AOI22X1 U37 ( .A(n2), .B(count_out[6]), .C(n3), .D(N20), .Y(n30) );
  NOR2X1 U38 ( .A(n2), .B(clear), .Y(n3) );
  NOR2X1 U39 ( .A(count_enable), .B(clear), .Y(n2) );
  AND2X1 U40 ( .A(n13), .B(count_out[2]), .Y(N9) );
  AND2X1 U41 ( .A(n13), .B(count_out[1]), .Y(N8) );
  AND2X1 U42 ( .A(n13), .B(count_out[0]), .Y(N7) );
  AND2X1 U43 ( .A(n13), .B(count_out[6]), .Y(N13) );
  AND2X1 U44 ( .A(n13), .B(count_out[5]), .Y(N12) );
  AND2X1 U45 ( .A(n13), .B(count_out[4]), .Y(N11) );
  AND2X1 U46 ( .A(n13), .B(count_out[3]), .Y(N10) );
  INVX1 U47 ( .A(rollover_flag), .Y(n13) );
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


module timer ( clk, n_rst, enable_timer, shift_strobe, packet_done );
  input clk, n_rst, enable_timer;
  output shift_strobe, packet_done;


  flex_counter_NUM_CNT_BITS7 fc0 ( .clk(clk), .n_rst(n_rst), .clear(1'b0), 
        .count_enable(enable_timer), .rollover_val({1'b1, 1'b0, 1'b1, 1'b1, 
        1'b0, 1'b1, 1'b0}), .rollover_flag(packet_done) );
  flex_counter_NUM_CNT_BITS4 fc1 ( .clk(clk), .n_rst(n_rst), .clear(1'b0), 
        .count_enable(enable_timer), .rollover_val({1'b1, 1'b0, 1'b1, 1'b0}), 
        .rollover_flag(shift_strobe) );
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


module rcv_block ( clk, n_rst, serial_in, data_read, rx_data, data_ready, 
        overrun_error, framing_error );
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
        .shift_strobe(strobe), .packet_done(packet_done) );
  start_bit_det det ( .clk(clk), .n_rst(n_rst), .serial_in(syncing[1]), 
        .new_packet_detected(new_packet_detected) );
  stop_bit_chk chker ( .clk(clk), .n_rst(n_rst), .sbc_clear(sbc_clear), 
        .sbc_enable(sbc_enable), .stop_bit(stop_bit), .framing_error(
        framing_error) );
endmodule

