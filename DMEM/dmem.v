module DMEM(Addr, DataW, DataR, MemRW, clk);

output [31:0] DataR;
input clk;
input [31:0] Addr,DataW;
input MemRW;

reg [7:0] datafile [0:1023];

/*initial begin
	datafile[40]<=8'h00;
	datafile[41]<=8'h00;
	datafile[42]<=8'h00;
	datafile[43]<=8'h00;
	datafile[44]<=8'h00;
	datafile[45]<=8'h00;
	datafile[46]<=8'h00;
	datafile[47]<=8'h02;
	datafile[48]<=8'h00;
	datafile[49]<=8'h00;
	datafile[50]<=8'h00;
	datafile[51]<=8'h03;
	datafile[52]<=8'h00;
	datafile[53]<=8'h00;
	datafile[54]<=8'h00;
	datafile[55]<=8'h04;
	datafile[56]<=8'h00;
	datafile[57]<=8'h00;
	datafile[58]<=8'h00;
	datafile[59]<=8'h05;
	datafile[60]<=8'h00;
	datafile[61]<=8'h00;
	datafile[62]<=8'h00;
	datafile[63]<=8'h06;
	datafile[64]<=8'h00;
	datafile[65]<=8'h00;
	datafile[66]<=8'h00;
	datafile[67]<=8'h07;
	datafile[68]<=8'h00;
	datafile[69]<=8'h00;
	datafile[70]<=8'h00;
	datafile[71]<=8'h08;
	datafile[72]<=8'h00;
	datafile[73]<=8'h00;
	datafile[74]<=8'h00;
	datafile[75]<=8'h09;
	datafile[76]<=8'h00;
	datafile[77]<=8'h00;
	datafile[78]<=8'h00;
	datafile[79]<=8'h0a;
end */
	
	assign DataR[7:0] = datafile[Addr];
	assign DataR[15:8] = datafile[Addr+1];
	assign DataR[23:16] = datafile[Addr+2];
	assign DataR[31:24] = datafile[Addr+3];

	always @(negedge clk) begin
	if(MemRW == 1) begin
		datafile[Addr] <= DataW[7:0];	//theo quy tac little edian
		datafile[Addr+1] <= DataW[15:8];
		datafile[Addr+2] <= DataW[23:16];
		datafile[Addr+3] <= DataW[31:24];
		end
	end
endmodule
