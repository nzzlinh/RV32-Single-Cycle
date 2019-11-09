module ImmGen(
	input [2:0] immSel, 
	input [31:0] instr, 
	output reg [31:0] imm);

always @(immSel or instr) begin
case (immSel)
	3'b000://I
		begin
		imm[10:0] <= instr[30:20];
		// Arithmetic shift right 20 bits 
		if (instr[31])
			imm[31:11] <= 21'h1fffff;
		else imm[31:11] <= 21'h000000;
		end
	3'b001://S
		begin
		imm[10:5] <= instr[30:25];
		imm[4:0] <= instr[11:7];
		if (instr[31])
			imm[31:11] <= 21'h1fffff;
		else imm[31:11] <= 21'h000000;
		end
	3'b010://B
		begin
		imm[0] <= 0;
		imm[11] <= instr[7];
		imm[4:1] <= instr[11:8];
		imm[10:5] <= instr[30:25];
		if (instr[31])
			imm[31:11] <= 21'h1fffff;
		else imm[31:11] <= 21'h000000;
		end
	3'b011: //U
		begin
		imm <= 0;
		imm[31:12] <= instr[31:12];
		end
	3'b100: //J
		begin
		// JAL
		if (instr[6:2] == 5'b11011) begin
			imm[20] <= instr[31];
			imm[10:1] <= instr[30:21];
			imm[11] <= instr[20];
			imm[19:12] <= instr[19:12];
			if (instr[31])
				imm[31:11] <= 21'h1fffff;
			else imm[31:11] <= 21'h000000;
		end
		// JALR
		else begin
		 	imm[31:20] <= instr[31:20];
			imm <= imm >>> 20;
		end
		end
endcase
end
endmodule
					
