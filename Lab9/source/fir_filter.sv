module fir_filter(
    input logic clk,
    input logic n_reset,
    input logic [15:0] sample_data,
    input logic [15:0] fir_coefficient,
    input logic load_coeff,
    input logic data_ready,
    output logic one_k_samples,
    output logic modwait,
    output logic [15:0] fir_out,
    output logic err
);

wire dr_sync;
wire lc_sync;

wire [15:0] ext_data1;
wire [15:0] ext_data2;
assign ext_data1 = sample_data;
assign ext_data2 = fir_coefficient;

sync_low sdr (.clk(clk), .n_rst(n_reset), .async_in(data_ready), .sync_out(dr_sync));
sync_low slc (.clk(clk), .n_rst(n_reset), .async_in(load_coeff), .sync_out(lc_sync));

wire overflow;
wire cnt_up;
wire clear;

wire [2:0] op;
wire [3:0] src1;
wire [3:0] src2;
wire [3:0] dest;

wire [16:0] raw_out;

controller c (
    .clk(clk), 
    .n_rst(n_reset), 
    .dr(dr_sync), 
    .lc(lc_sync), 
    .overflow(overflow),
    .cnt_up(cnt_up),
    .clear(clear),
    .modwait(modwait),
    .op(op),
    .src1(src1),
    .src2(src2),
    .dest(dest),
    .err(err)
);

/**
 * Registers:
 * 0x0     : out
 * 0x1-0x4 : s0, s1, s2, s3
 * 0x5-0x8 : f0, f1, f2, f3
 * 0x9     : accumulator
 * 0xA     : tmp (used to store scaled samples)
 * 0x-
 * 0xF     : 0
**/

datapath p(
    .clk(clk),
    .n_reset(n_reset),
    .op(op),
    .src1(src1),
    .src2(src2),
    .dest(dest),
    .ext_data1(sample_data),
    .ext_data2(fir_coefficient),
    .outreg_data(raw_out),
    .overflow(overflow)
);

counter sc (
    .clk(clk),
    .n_rst(n_reset),
    .cnt_up(cnt_up),
    .clear(clear),
    .one_k_samples(one_k_samples)
);

magnitude mag (
    .in(raw_out),
    .out(fir_out)
);

endmodule