// PC+4 module
module add_4(in,out);
input [31:0]in;
output reg [31:0]out;

always @(*)
	out = in+4;
endmodule
