// Edittor: N.D LINH.
// Last edit: 31/10/2019.
//------------------------
module regfile32x32
	(input clk,
	input reset,
	input write,
	input [31:0] instr,
	input [31:0] wrDataD,
	output [31:0] rdDataA,
	output [31:0] rdDataB);

	wire [4:0] wrAddrD, rdAddrA, rdAddrB;
	// Instruction decode 
	assign wrAddrD = instr[11:7];
	assign rdAddrA = instr[19:15];
	assign wrAddrB = instr[24:20];
	
	reg [31:0] regfile [0:31];

	assign rdDataA = regfile[rdAddrA];
	assign rdDataB = regfile[rdAddrB];

	integer i;
	always @(negedge clk) begin
	if (reset) begin
		for (i = 0; i < 32; i = i + 1) begin
			regfile[i] <= 0;
		end
	end else begin
			if (write) begin
				if (wrAddrD != 0)
					regfile[wrAddrD] <= wrDataD;
			end
		end // else: !if(reset)
	// x0 always is zero;
	regfile[0] <= 0;
	end
endmodule 