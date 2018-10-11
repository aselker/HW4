// 32 bit decoder with enable signal
//   enable=0: all output bits are 0
//   enable=1: out[address] is 1, all other outputs are 0
module decoder1to32
(
output[31:0]	out,
input		enable,
input[4:0]	address
);

    assign out = enable<<address; 

endmodule

// This works because Verilog implicitly extends buses.  enable is treated as whatever size it has to to fill
// all of out, and because it's shifted left by whatever number the address represents in binary, it ends up
// on the correct output.  If it's 1, then one output is on.  If it's 0, then they're all off.

