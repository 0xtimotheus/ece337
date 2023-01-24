
module adder_4bit (input logic [3:0] a, input logic [3:0] b, input logic carry_in, output logic [3:0] sum, output logic overflow);

logic [2:0] carry;

adder_1bit a0 (a[0], b[0], carry_in, sum[0], carry[0]);
adder_1bit a1 (a[1], b[1], carry[0], sum[1], carry[1]);
adder_1bit a2 (a[2], b[2], carry[1], sum[2], carry[2]);
adder_1bit a3 (a[3], b[3], carry[2], sum[3], overflow);

endmodule