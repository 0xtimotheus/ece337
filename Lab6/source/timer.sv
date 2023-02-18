module timer (
    input logic clk, 
    input logic n_rst, 
    input logic enable_timer, 
    output logic shift_strobe, 
    output logic packet_done
);
    reg [6:0] val;
    //reg [3:0] strobe;
    
    flex_counter #(.NUM_CNT_BITS(7)) fc0 (
        .clk(clk),
        .n_rst(n_rst),
        .clear(1'b0),
        .count_enable(enable_timer),
        .rollover_val(7'h5A),
        .count_out(val),
        .rollover_flag(packet_done)
    );

    //assign shift_strobe = strobe[2] & ~strobe[1] & strobe[0];
    flex_counter #(.NUM_CNT_BITS(4)) fc1 (
        .clk(clk),
        .n_rst(n_rst),
        .clear(1'b0),
        .count_enable(enable_timer),
        .rollover_val(4'hA),
        .rollover_flag(shift_strobe)
    );

   
endmodule