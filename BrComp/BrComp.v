module BranchComp(
	input [31:0] dataA, 
	input [31:0] dataB,
	input BrUn, 
	output BrEq,
	output BrLT); 

always @(*) begin
	if (BrUn == 0) begin
		if (dataA == dataB) begin
			BrEq <= 1;
			BrLT <= 0;
		end
		if (dataA < dataB) begin
			BrEq <= 0;
			BrLT <= 1;
		end
	else begin
		if ($unsigned(dataA) == $unsigned(dataB)) begin
			BrEq <= 1;
			BrLT <= 0;
		end
		if ($unsigned(dataA) < $unsigned(dataB)) begin
			BrEq <= 0;
			BrLT <= 1;
		end
	end
	end
end
endmodule 