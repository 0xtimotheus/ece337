module timer (
    input logic clk, 
    input logic n_rst, 
    input logic enable_timer, 
    input logic [13:0] bit_period,
    input logic [3:0] data_size,
    output logic shift_strobe, 
    output logic packet_done
);
    logic [4:0] adjusted_data_size;
    assign adjusted_data_size = data_size + 1;

    flex_counter #(.NUM_CNT_BITS(14)) fc0 (
        .clk(clk),
        .n_rst(n_rst),
        .clear(~enable_timer),
        .count_enable(enable_timer),
        .rollover_val(bit_period),
        .rollover_flag(shift_strobe)
    );

    //assign shift_strobe = strobe[2] & ~strobe[1] & strobe[0];
    flex_counter #(.NUM_CNT_BITS(5)) fc1 (
        .clk(clk),
        .n_rst(n_rst),
        .clear(~enable_timer),
        .count_enable(shift_strobe),
        .rollover_val(adjusted_data_size),
        .rollover_flag(packet_done)
    );

   
endmodule