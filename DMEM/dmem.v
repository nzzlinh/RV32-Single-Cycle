module Dmem(Addr, DataW, DataR, MemRW, clk);

output reg [31:0] DataR;
input clk;
input [31:0] Addr,DataW;
input MemRW;

reg [7:0] datafile [0:1023];

always @(posedge clk) begin
	if(MemRW) begin
		datafile[Addr] <= DataW[7:0];//theo quy tac little edian
		datafile[Addr+1] <= DataW[15:8];
		datafile[Addr+2] <= DataW[23:16];
		datafile[Addr+3] <= DataW[31:24];
		end
	else 	begin
		DataR[7:0] <= datafile[Addr];
		DataR[15:8] <= datafile[Addr+1];
		DataR[23:16] <= datafile[Addr+2];
		DataR[31:24] <= datafile[Addr+3];
		end
	end
endmodule
