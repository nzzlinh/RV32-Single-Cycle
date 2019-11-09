module control(
	input [31:0] instr,
	input breq,
	input brlt,
	output reg [14:0] data_out);

	// Chu thich:
	// Data_out la ngo ra 20bits bao gom theo thu tu:
	// {PCSel, ImmSel, RegWEn, BrUn, Bsel, Asel, ALUSel, MemRW, WBSel}

	// Define control words 
	// R type instructions
	parameter ADD 	= 11'b000001100??;
	parameter SUB 	= 11'b100001100??;
	parameter SLL 	= 11'b000101100??;
	parameter SLT 	= 11'b001001100??;
	parameter SLTU 	= 11'b001101100??;
	parameter XOR 	= 11'b010001100??;
	parameter SRL 	= 11'b010101100??;
	parameter SRA	= 11'b110101100??;
	parameter OR 	= 11'b011001100??;
	parameter AND	= 11'b011101100??;
	// I type instructions
	parameter ADDI 	= 11'b?00000100??;
	parameter SLTI 	= 11'b?01000100??;
	parameter SLTIU	= 11'b?01100100??;
	parameter XORI 	= 11'b?10000100??;
	parameter ORI 	= 11'b?11000100??;
	parameter ANDI	= 11'b?11100100??;
	parameter SLLI 	= 11'b000100100??;
	parameter SRLI 	= 11'b010100100??;
	parameter SRAI 	= 11'b110100100??;
	parameter LW 	= 11'b?01000000??;
	// S type instructions
	parameter SW	= 11'b?01001000??;
	// B type instructions
	parameter BEQ_TRUE  = 11'b?000110000?;
	parameter BEQ_FALSE = 11'b?000110001?;
	parameter BNE_TRUE  = 11'b?001110000?;
	parameter BNE_FALSE = 11'b?001110001?;
	parameter BLT 	= 11'b?10011000?1;
	parameter BLTU 	= 11'b?11011000?1;
	// J type instructions
	parameter JAL  	= 11'b????11011??;
	parameter JALR 	= 11'b????11001??;
	// U type instructions 
	parameter LUI  	= 11'b????01101??;
	parameter AUIPC	= 11'b????00101??;


	// 11 bits control.

	wire [10:0] control_word;
	assign control_word = {instr[30], instr[14:12], instr[6:2], breq, brlt};

	always @*
		casez ({instr[30], instr[14:12], instr[6:2], breq, brlt})
		// R
		ADD: 	data_out = 15'b0xxx1x000000001;
		SUB:	data_out = 15'b0xxx1x000001001;
		SLL:	data_out = 15'b0xxx1x000010001;
		SLT:	data_out = 15'b0xxx1x000011001;
		SLTU:	data_out = 15'b0xxx1x000100001;
		XOR:	data_out = 15'b0xxx1x000101001;
		SRL:	data_out = 15'b0xxx1x000110001;
		SRA:	data_out = 15'b0xxx1x000111001;
		OR: 	data_out = 15'b0xxx1x001000001;
		AND:	data_out = 15'b0xxx1x001001001;
		// I
		ADDI:	data_out = 15'b00001x100000001;
		SLTI:	data_out = 15'b00001x100011001;
		SLTIU:	data_out = 15'b00001x100100001;
		XORI: 	data_out = 15'b00001x100101001;
		ORI: 	data_out = 15'b00001x101000001;
		ANDI:	data_out = 15'b00001x101001001;
		SLLI: 	data_out = 15'b00001x100010001;
		SRLI: 	data_out = 15'b00001x100110001;
		SRAI: 	data_out = 15'b00001x100111001;
		LW:	data_out = 15'b00001x100000000;
		// S
		SW:	data_out = 15'b00010x1000001xx;
		// B
		BEQ_TRUE: 
			data_out = 15'b0010001100000xx;
		BEQ_FALSE: 
			data_out = 15'b1010001100000xx;
		BNE_TRUE: 
			data_out = 15'b1010001100000xx;
		BNE_FALSE:
			data_out = 15'b0010001100000xx;
		BLT:	data_out = 15'b1010001100000xx;
		BLTU:	data_out = 15'b1010011100000xx;
		// J
		JAL:	data_out = 15'b11001x110000010;
		JALR:	data_out = 15'b11001x100000010;
		// U
		LUI:	data_out = 15'b00111x1x1011001;
		AUIPC:	data_out = 15'b00111x110000001; 
		endcase
endmodule 
