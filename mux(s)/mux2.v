// PC mux, A_mux, B_mux module
module mux2(out,in0, in1, sel);
output reg[31:0]out;
input [31:0]in0,in1;
input sel;
always @(*)
	out = (sel)?in1:in0;
endmodule
