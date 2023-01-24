`timescale 1ns / 100ps

module adder_1bit (input logic a, input logic b, input logic carry_in, output logic sum, output logic carry_out);

assign sum = carry_in ^ (a ^ b);
assign carry_out = (~carry_in & b & a) | (carry_in & (b | a));

always @ (a) begin
    assert((a == 1'b1) || (a == 1'b0))
    else $error("Input \"a\" of adder_1bit is not a logic value");
end

always @ (b) begin
    assert((b == 1'b1) || (b == 1'b0))
    else $error("Input \"b\" of adder_1bit is not a logic value");
end

endmodule