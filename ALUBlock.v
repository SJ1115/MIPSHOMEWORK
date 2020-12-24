module ALUBlock(datR1, datR2, aluop, aluSrc, insIn, insOut, zero, aluout);
input [31:0] datR1, datR2;
input [15:0] insIn;
input [1:0] aluop;
input aluSrc;
output [31:0] aluout;
output wire [31:0] insOut;
output zero;
wire [31:0] datR3;
wire [3:0] aluctrl;

sign_ex SE(.in(insIn), .out(insOut));

mux2 M1(.d0(datR2), .d1(insOut), .s(aluSrc), .y(datR3));

aludec A1(.func(insIn[5:0]), .aluop(aluop), .alucontrol(aluctrl));

ALU A2(.a(datR1), .b(datR3), .control(aluctrl), .zero(zero), .outalu(aluout));

endmodule