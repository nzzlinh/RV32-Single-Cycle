module pc(input in, input clk, output out);

always @(posedge clk) begin
	in <= out;
end
	
endmodule 