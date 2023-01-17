
module adder_nbit #(parameter NUM_BITS = 4) (input logic [NUM_BITS-1:0] a, input logic [NUM_BITS-1:0] b, input logic carry_in, output logic [NUM_BITS-1:0] sum, output logic overflow);

wire [NUM_BITS-1:0] carry;
assign carry_out = carry[NUM_BITS-1];

adder_1bit(a[0], b[0], carry_in, sum[0], carry[0]);

for(i = 1; i < NUM_BITS-1; i++) begin
    adder_1bit(a[i], b[i], carry[i -1], sum[i], carry[i])
end

endmodule