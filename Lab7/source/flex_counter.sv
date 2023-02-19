module flex_counter #(parameter NUM_CNT_BITS = 4) (
    input reg clk,
    input reg n_rst,
    input reg clear,
    input reg count_enable,
    input reg [NUM_CNT_BITS-1:0] rollover_val,
    output reg [NUM_CNT_BITS-1:0] count_out,
    output reg rollover_flag
);

logic nrollover_flag;
logic [NUM_CNT_BITS-1:0] ncount_out;

always_ff @ (posedge clk, negedge n_rst) begin
    if(~n_rst) begin
        count_out <= 'b0;
        rollover_flag<= 'b0;
    end else begin
        count_out <= ncount_out;
        rollover_flag <= nrollover_flag;
    end
end

always_comb begin
    if(count_enable) begin
        ncount_out = (rollover_flag ? 'b0 : count_out) + 1;
        nrollover_flag = ncount_out == rollover_val;
    end else begin
        ncount_out = count_out;
        nrollover_flag = rollover_flag;
    end
    if(clear) begin 
        ncount_out = 'b0;
        nrollover_flag = 'b0;
    end
end

endmodule