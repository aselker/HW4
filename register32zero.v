module register32zero(
	input clk,
	input [31:0] d,
	input wrenable,
	output reg [31:0] q
);
	assign q = 32'b0;
endmodule
