`timescale 1ns / 100ps
// 337 TA Provided Lab 2 8-bit adder wrapper file template
// This code serves as a template for the 8-bit adder design wrapper file 
// STUDENT: Replace this message and the above header section with an
// appropriate header based on your other code files

module adder_16bit
(
	input wire [15:0] a,
	input wire [15:0] b,
	input wire carry_in,
	output wire [15:0] sum,
	output wire overflow
);

	// STUDENT: Fill in the correct port map with parameter override syntax for using your n-bit ripple carry adder design to be an 8-bit ripple carry adder design
	adder_nbit #(16) n0 (a, b, carry_in, sum, overflow);
	
	always @ (carry_in) begin
		assert((carry_in == 1'b1) || (carry_in == 1'b0))
		else $error("Input \"carry_in\" of adder_1bit is not a logic value");
	end

	always @ (a) begin
		assert((a >= 16'h0) && (a <= 16'hffff))
		else $error("Invalid input \"a\" to adder_16bit");
	end

	always @ (b) begin
		assert((b >= 16'h0) || (b <= 16'hffff))
		else $error("Invalid input \"b\" to adder_16bit");
	end

endmodule
