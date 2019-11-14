module decoder(
	input [31:0] instr,
	output [4:0] rd,
	output [4:0] rs1,
	output [4:0] rs2,
	input clk);

	assign rs1 = instr[19:15];
	assign rs2 = instr[24:20];
	assign rd = instr[11:7];

endmodule
