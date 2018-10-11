module register32zero(
	input clk,
	input [31:0] d,
	input wrenable,
	output reg [31:0] q
);
	always @(posedge clk) begin
		if (wrenable) begin
			q <= {d[31:1], 1'b1};
		end
	end
endmodule
