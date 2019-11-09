module top_module(input clk);
// Tin hieu giua cac khoi
wire [31:0] pc_in, pc_out;
wire [31:0] pc_plus4_out;
wire [4:0] rs1, rs2, rd;
wire [31:0] rs1_out, rs2_out;
wire [31:0] imm_in, imm_out;
wire [31:0] alumux1_out, alumux2_out;
wire [31:0] alu_out, dmem_out, wb_out;

// Tin hieu dua vao khoi control
wire brlt;
wire breq;
// Tin hieu tu khoi control toi cac khoi con lai
wire pcmux_sel;
wire [2:0] imm_sel;
wire regfilemux_sel;
wire cmpop;
wire alumux1_sel;
wire alumux2_sel;
wire [3:0] aluop;
wire dmem_sel;
wire [1:0] wbmux_sel;

// 20bit bus
wire [14:0] ctrl_out;


// Ket noi cac module

mux2 	PCmux(.out(pc_in), .in0(pc_plus4_out), .in1(alu_out), .sel(pcmux_sel));

pc 	PC(.in(pc_in), .clk(clk), .out(pc_out));

add_4	ADD(.in(pc_out), .out(pc_plus4_out));

IMEM	InstrMem(.inst(imm_in), .PC(pc_out));

control Controller(.instr(imm_in), .breq(breq), .brlt(brlt), .data_out(ctrl_out));

assign pcmux_sel = ctrl_out[14];
assign imm_sel = ctrl_out[13:11];
assign regfilemux_sel = ctrl_out[10];
assign cmop = ctrl_out[9];
assign alumux2_sel = ctrl_out[8];
assign alumux1_sel = ctrl_out[7];
assign aluop = ctrl_out[6:3];
assign dmem_sel = ctrl_out[2];
assign wbmux_sel = ctrl_out[1:0];

decoder RegDecoder(.instr(imm_in), .rd(rd), .rs1(rs1), .rs2(rs2));

regfile RegFile(.clk(clk), .reset(), .write(regfilemux_sel), .wrAddrD(rd), .rdAddrA(rs1), 
		.rdAddrB(rs2), .wrDataD(wb_out), .rdDataA(rs1_out), .rdDataB(rs2_out));

ImmGen	ImmGen(.immSel(imm_sel), .instr(imm_in), .imm(imm_out));

BranchComp BrComp(.dataA(rs1_out), .dataB(rs2_out), .BrUn(cmpop), .BrEq(breq), .BrLT(brlt));

mux2	ALUmux1(.out(alumux1_out), .in0(rs1_out), .in1(pc_out), .sel(alumux1_sel));

mux2	ALUmux2(.out(alumux2_out), .in0(rs2_out), .in1(imm_out), .sel(alumux2_sel));

ALU	ALU(.alu_sel(aluop), .dataA(alumux1_out), .dataB(alumux2_out), .alu_out(alu_out));

DMEM	DataMem(.Addr(alu_out), .DataW(rs2_out), .DataR(dmem_out), .MemRW(dmem_sel), .clk(clk));

wbmux	WBMux(.out(wb_out), .in0(dmem_out), .in1(alu_out), .in2(pc_plus4_out), .sel(wbmux_sel));




endmodule 