// PC module
module pc(in, clk, out);
input [31:0] in; 
input clk;
output reg [31:0] out =0;

always @(posedge clk) begin
	out <= in;
end
	
endmodule 