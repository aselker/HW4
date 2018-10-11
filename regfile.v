//------------------------------------------------------------------------------
// MIPS register file
//   width: 32 bits
//   depth: 32 words (reg[0] is static zero register)
//   2 asynchronous read ports
//   1 synchronous, positive edge triggered write port
//------------------------------------------------------------------------------

`include "mux32to1by32.v"
`include "decoders.v"
`include "register32.v"
`include "register32zero.v"

module regfile
(
output reg [31:0] ReadData1, // Contents of first register read
output reg [31:0] ReadData2, // Contents of second register read
input[31:0] WriteData, // Contents to write to register
input[4:0] ReadRegister1, // Address of first register to read
input[4:0] ReadRegister2, // Address of second register to read
input[4:0] WriteRegister, // Address of register to write
input RegWrite, // Enable writing of register when High
input Clk  // Clock (Positive Edge Triggered)
);

	wire [31:0] wrens;
	decoder1to32 wrenDecoder(wrens, RegWrite, WriteRegister);

	wire [31:0] [31:0] memOuts;
	register32 mem[31:1] (Clk, WriteData, wrens[31:1], memOuts[31:1]); 
	register32zero memzero (Clk, WriteData, wrens[0], memOuts[0]);

	assign ReadData1 = memOuts[ReadRegister1];
	assign ReadData2 = memOuts[ReadRegister2];

endmodule
