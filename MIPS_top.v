module MIPS_top(clk, rst, pc, datashow);
input clk, rst;
output wire [31:0] pc, datashow;//UDDUKHAZI
wire Nclk, regDst, jump, br, memRe, mem2reg, memWr, aluSrc, regWr, zero;
wire [1:0] aluop;
wire [31:0] pcnew, inst, aluout, immed, data0, data1;

//Divide Clock 

InsFet IF(.clk(clk), .rst(rst), .n_clk(Nclk), .pc(pc),
	 .n_pc(pcnew), .inst(inst));

op_control OC(.opcode(inst[31:26]), .regWr(regWr), .regDst(regDst),
	 .aluSrc(aluSrc), .br(br), .memRe(memRe),
	 .memWr(memWr), .mem2reg(mem2reg), .aluop(aluop), .jump(jump));

REGBlock RB(.clk(Nclk), .RegR1(inst[25:21]), .RegR2(inst[20:16]), .regDst(regDst),
	 .RegW(inst[15:11]), .regWr(regWr), .WriteDat(datashow),
	 .DatR1(data0), .DatR2(data1));

ALUBlock AB(.datR1(data0), .datR2(data1), .aluop(aluop),
	 .aluSrc(aluSrc), .insIn(inst[15:0]), .insOut(immed),
	 .zero(zero), .aluout(aluout));

DatAcc DA(.fromalu(aluout), .WriteDat(data1), .memWr(memWr), .memRe(memRe),
	 .mem2reg(mem2reg), .DatOut(datashow));

NextPC NP(.pc(pcnew), .addr(inst[25:0]), .insIn(immed),
	 .jump(jump), .br(br), .zero(zero), .nextpc(pc));


endmodule
