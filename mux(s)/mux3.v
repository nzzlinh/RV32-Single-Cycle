module mux2(out,in0,in1,in2,sel);
output reg [31:0]out;
input [31:0]in0,in1,in2;
input [1:0]sel;
always @(*)
	begin
	 case(sel)
		2'b00: out = in0;
		2'b01: out = in1;
		2'b10: out = in2;
	 endcase
	end
endmodule
