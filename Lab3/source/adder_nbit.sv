`timescale 1ns / 100ps

module adder_nbit #(parameter BIT_WIDTH = 4) (input logic [BIT_WIDTH-1:0] a, input logic [BIT_WIDTH-1:0] b, input logic carry_in, output logic [BIT_WIDTH-1:0] sum, output logic overflow);

wire [BIT_WIDTH-1:0] carry;
assign overflow = carry[BIT_WIDTH-1];
generate
    genvar i;

    adder_1bit n0 (a[0], b[0], carry_in, sum[0], carry[0]);
    always @ (a[0], b[0]) begin
            #2 assert(sum[0] == (a[0] + b[0] + carry_in) % 2)
            else $error("Incorrect sum @ bit %d; expected: %d + %d + %d = %d; actual: = %d", 0, a[0], b[0], carry_in, a[0] + b[0] + carry_in, sum[0]);
        end

    for(i = 1; i < BIT_WIDTH; i++) begin
        adder_1bit ni (a[i], b[i], carry[i-1], sum[i], carry[i]);
        always @ (a[i], b[i]) begin
            #2 assert(sum[i] == (a[i] + b[i] + carry[i-1]) % 2)
            else $error("Incorrect sum @ bit %d; expected: %d + %d + %d = %d; actual: = %d", i, a[i], b[i], carry[i-1], a[i] + b[i] + carry[i-1], sum[i]);
        end
    end
endgenerate

endmodule