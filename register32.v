module register32(
	input clk,
	input [31:0] d,
	input wrenable,
	output reg [31:0] q
);
	always @(posedge clk) begin
		if (wrenable) begin
			q <= d;
		end
	end
endmodule
