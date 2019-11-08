module controller(
	input [31:0] instr,
	input breq,
	input brlt,
	output reg [14:0] data_out);

	// Chu thich:
	// Data_out la ngo ra 20bits bao gom theo thu tu:
	// {PCSel, ImmSel, RegWEn, BrUn, Bsel, Asel, ALUSel, MemRW, WBSel}

	// Define control words 
	// R type instructions
	parameter ADD 	= 11'b000001100__;
	parameter SUB 	= 11'b100001100__;
	parameter SLL 	= 11'b000101100__;
	parameter SLT 	= 11'b001001100__;
	parameter SLTU 	= 11'b001101100__;
	parameter XOR 	= 11'b010001100__;
	parameter SRL 	= 11'b010101100__;
	parameter SRA	= 11'b110101100__;
	parameter OR 	= 11'b011001100__;
	parameter AND	= 11'b011101100__;
	// I type instructions
	parameter ADDI 	= 11'b_00000100__;
	parameter SLTI 	= 11'b_01000100__;
	parameter SLTIU	= 11'b_01100100__;
	parameter XORI 	= 11'b_10000100__;
	parameter ORI 	= 11'b_11000100__;
	parameter ANDI	= 11'b_11100100__;
	parameter SLLI 	= 11'b000100100__;
	parameter SRLI 	= 11'b010100100__;
	parameter SRAI 	= 11'b110100100__;
	parameter LW 	= 11'b_01100000__;
	// S type instructions
	parameter SW	= 11'b_01001000__;
	// B type instructions
	parameter BEQ_TRUE  = 11'b_000110000_;
	parameter BEQ_FALSE = 11'b_000110001_;
	parameter BNE_TRUE  = 11'b_001110000_;
	parameter BNE_FALSE = 11'b_001110001_;
	parameter BLT 	= 11'b_10011000_1;
	parameter BLTU 	= 11'b_11011000_1;
	// J type instructions
	parameter JAL  	= 11'b____11011__;
	parameter JALR 	= 11'b____11001__;
	// U type instructions 
	parameter LUI  	= 11'b____01101__;
	parameter AUIPC	= 11'b____00101__;


	// 11 bits control.
	wire [10:0] control_word;
	
	// Ghep 11 bit lay tu instruction ghep thanh control word.
	assign control_word = {instr[30], instr[14:12], instr[6:2], breq, brlt};

	always @(instr) begin
		case (control_word)
		// R
		ADD: 	data_out = 15'b0___1_000000001;
		SUB:	data_out = 15'b0___1_000001001;
		SLL:	data_out = 15'b0___1_000010001;
		SLT:	data_out = 15'b0___1_000011001;
		SLTU:	data_out = 15'b0___1_000100001;
		XOR:	data_out = 15'b0___1_000101001;
		SRL:	data_out = 15'b0___1_000110001;
		SRA:	data_out = 15'b0___1_000111001;
		OR: 	data_out = 15'b0___1_001000001;
		AND:	data_out = 15'b0___1_001001001;
		// I
		ADDI:	data_out = 15'b00001_100000001;
		SLTI:	data_out = 15'b00001_100011001;
		SLTIU:	data_out = 15'b00001_100100001;
		XORI: 	data_out = 15'b00001_100101001;
		ORI: 	data_out = 15'b00001_101000001;
		ANDI:	data_out = 15'b00001_101001001;
		SLLI: 	data_out = 15'b00001_100010001;
		SRLI: 	data_out = 15'b00001_100110001;
		SRAI: 	data_out = 15'b00001_100111001;
		LW:	data_out = 15'b00001_100000000;
		// S
		SW:	data_out = 15'b00010_1000001__;
		// B
		BEQ_TRUE: 
			data_out = 15'b0010001100000__;
		BEQ_FALSE: 
			data_out = 15'b1010001100000__;
		BNE_TRUE: 
			data_out = 15'b1010001100000__;
		BNE_FALSE:
			data_out = 15'b0010001100000__;
		BLT:	data_out = 15'b1010001100000__;
		BLTU:	data_out = 15'b1010011100000__;
		// J
		JAL:	data_out = 15'b11001_110000010;
		JALR:	data_out = 15'b11001_100000010;
		// U
		LUI:	data_out = 15'b00111_1_1011001;
		AUIPC:	data_out = 15'b00111_110000001;
		endcase
	end

endmodule 
