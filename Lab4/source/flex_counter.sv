module flex_counter #(parameter NUM_CNT_BITS = 4) (
    input reg clk,
    input reg n_rst,
    input reg clear,
    input reg count_enable,
    input reg [NUM_CNT_BITS:0] rollover_val,
    output reg [NUM_CNT_BITS:0] count_out,
    output reg rollover_flag
);

always_ff @ (posedge clk, negedge n_rst) begin
    rollover_flag <= rollover_val - 1 == count_out ? 1'b1 : 'b0;
    count_out <= count_out;

    if(~n_rst) count_out <= 'b0;
    else if(clear) count_out <= 'b0;
    else if(count_enable) count_out <= ((rollover_val <= count_out) ? 'b0 + 1 : count_out + 1);
end

endmodule