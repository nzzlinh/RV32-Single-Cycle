// PC module
module pc(in, clk, out);
input [31:0] in; 
input clk;
output reg [31:0] out;
reg temp = 0; 
always @(posedge clk) begin
	if (temp == 0) begin
		out = temp;
		temp = 1;
	end
	else out = in;
end
	
endmodule 