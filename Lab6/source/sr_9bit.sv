module sr_9bit(
    input logic clk,
    input logic n_rst,
    input logic shift_strobe,
    input logic serial_in,
    output logic [7:0] packet_data,
    output logic stop_bit
);
    assign stop_bit = packet_data[7];
    flex_stp_sr #(.NUM_BITS(8)) sr (
        .clk(clk), 
        .n_rst(n_rst), 
        .shift_enable(shift_strobe),
        .serial_in(serial_in),
        .parallel_out(packet_data)
    );
endmodule