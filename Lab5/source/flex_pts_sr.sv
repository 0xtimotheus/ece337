module flex_pts_sr 
#(
    parameter NUM_BITS = 4,
    parameter SHIFT_MSB = 1
) (
    input logic clk,
    input logic n_rst,
    input logic load_enable,
    input logic shift_enable,
    input logic [NUM_BITS-1:0] parallel_in,
    output logic serial_out
);

logic [NUM_BITS-1:0] state;
logic [NUM_BITS-1:0] nstate;

assign serial_out = state[SHIFT_MSB ? NUM_BITS-1 : 0];

always_ff @( posedge clk, negedge n_rst ) begin
    if(~n_rst) state <= (2 ** NUM_BITS) - 1;
    else state <= nstate;
end

always_comb begin
    if(load_enable) nstate = parallel_in;
    else if(shift_enable) nstate = SHIFT_MSB ? ~(~state << 1) : ~(~state >> 1);
    else nstate = state;
end

endmodule