module sync_low(input reg clk, input reg n_rst, input reg async_in, output wire sync_out);

reg q0;
reg q1;

assign sync_out = q1;

always_ff @ (posedge clk, negedge n_rst ) begin
    if(~n_rst) begin 
        q0 <= 1'b0;
        q1 <= 1'b0;
    end else begin 
        q0 <= async_in;
        q1 <= q0;
    end
end

endmodule