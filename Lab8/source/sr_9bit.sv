module sr_9bit(
    input logic clk,
    input logic n_rst,
    input logic shift_strobe,
    input logic serial_in,
    input logic [3:0] data_size,
    output logic [7:0] packet_data,
    output logic stop_bit
);

    logic [8:0] parallel_out;
    assign packet_data = parallel_out[7:0] >> (8 - data_size);
    assign stop_bit = parallel_out[8];

    flex_stp_sr #(.NUM_BITS(9), .SHIFT_MSB(0)) sr (
        .clk(clk), 
        .n_rst(n_rst), 
        .shift_enable(shift_strobe),
        .serial_in(serial_in),
        .parallel_out(parallel_out)
    );
endmodule