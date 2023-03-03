module timer (
    input logic clk, 
    input logic n_rst, 
    input logic enable_timer, 
    input logic [13:0] bit_period,
    input logic [3:0] data_size,
    output logic shift_strobe, 
    output logic packet_done
);
    flex_counter #(.NUM_CNT_BITS(14)) fc0 (
        .clk(clk),
        .n_rst(n_rst),
        .clear(1'b0),
        .count_enable(enable_timer),
        .rollover_val(bit_period),
        .rollover_flag(packet_done)
    );

    //assign shift_strobe = strobe[2] & ~strobe[1] & strobe[0];
    flex_counter #(.NUM_CNT_BITS(4)) fc1 (
        .clk(clk),
        .n_rst(n_rst),
        .clear(1'b0),
        .count_enable(enable_timer),
        .rollover_val(data_size),
        .rollover_flag(shift_strobe)
    );

   
endmodule