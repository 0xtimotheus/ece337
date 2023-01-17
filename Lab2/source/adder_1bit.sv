
module adder_1bit (input logic a, input logic b, input logic carry_in, output logic sum, output logic carry_out);

assign sum = carry_in ^ (a ^ b);
assign carry_out = (~carry_in & b & a) | (carry_in & (b | a));

endmodule