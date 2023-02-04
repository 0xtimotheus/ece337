module flex_stp_sr 
#(
    parameter NUM_BITS = 4, 
    parameter SHIFT_MSB = 1
) (
    input logic clk, 
    input logic n_rst, 
    input logic shift_enable, 
    input logic serial_in,
    output logic [NUM_BITS-1:0] parallel_out
);

logic [NUM_BITS-1:0] state;
logic [NUM_BITS-1:0] nstate;

assign parallel_out = state;

always_ff @( posedge clk, negedge n_rst ) begin
    if(~n_rst) state <= (2 ** NUM_BITS)- 1;
    else state <= nstate;
end

always_comb begin
    if(shift_enable) nstate = SHIFT_MSB ? { state[NUM_BITS-2:0], serial_in } : { serial_in, state[NUM_BITS-1:1] };
    else nstate = state;
end


endmodule