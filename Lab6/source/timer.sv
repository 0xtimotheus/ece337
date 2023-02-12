module timer (
    input logic clk, 
    input logic n_rst, 
    input logic enable_timer, 
    output logic shift_strobe, 
    output logic packet_done
);
    logic [6:0] val;
    assign shift_strobe = ~val[0] & val[1] & ~val[2] & val[3];
    flex_counter #(.NUM_CNT_BITS(7)) fc (
        .clk(clk),
        .n_rst(n_rst),
        .clear(0),
        .count_enable(enable_timer),
        .rollover_val(7'h5A),
        .count_out(val),
        .rollover_flag(packet_done)
    );
endmodule