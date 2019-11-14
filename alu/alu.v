module ALU(
	input [3:0] alu_sel, 
	input signed [31:0] dataA, 
	input signed [31:0] dataB, 
	output reg [31:0] alu_out);
	
	parameter [3:0] ADD = 4'b0000;
	parameter [3:0] SUB = 4'b0001;
	parameter [3:0] SLL = 4'b0010;
	parameter [3:0] SLT = 4'b0011;
	parameter [3:0] SLTU = 4'b0100;
	parameter [3:0] XOR = 4'b0101;
	parameter [3:0] SRL = 4'b0110;
	parameter [3:0] SRA = 4'b0111;
	parameter [3:0] OR = 4'b1000;
	parameter [3:0] AND = 4'b1001;
	parameter [3:0] B_OUT = 4'b1011;
	
	always @(*) begin
		case (alu_sel)
			ADD: begin
				alu_out = dataA + dataB;
			end
			SUB: begin
				alu_out = dataA - dataB;
			end
			SLL: begin
				alu_out = dataA << $unsigned(dataB);
			end
			SLT: begin
				alu_out = (dataA < dataB) ? 1 : 0;
			end
			SLTU: begin
				alu_out = ($unsigned(dataA) < $unsigned(dataB)) ? 1 : 0;
			end
			XOR: begin
				alu_out = dataA ^ dataB;
			end
			SRL: begin
				alu_out = dataA >> $unsigned(dataB);
			end
			SRA: begin
				alu_out = dataA >>> $unsigned(dataB);
			end
			OR: begin
				alu_out = dataA | dataB;
			end
			AND: begin
				alu_out = dataA & dataB;
			end
			B_OUT:
				alu_out = dataB;
		endcase	
	end

endmodule
