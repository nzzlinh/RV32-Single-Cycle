module BranchComp(
	input [31:0] dataA, 
	input [31:0] dataB,
	input BrUn, 
	output reg BrEq,
	output reg BrLT); 

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
	else if (BrUn == 1 )begin
		if ($unsigned(dataA) == $unsigned(dataB)) begin
			BrEq <= 1;
			BrLT <= 0;
		end
		if ($unsigned(dataA) < $unsigned(dataB)) begin
			BrEq <= 0;
			BrLT <= 1;
		end
	end
	else begin
		BrEq <= 1'bx;
		BrLT<= 1'bx;
	end
	end
end
endmodule 