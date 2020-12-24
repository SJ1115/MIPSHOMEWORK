module REGBlock(clk, RegR1, RegR2, regDst, RegW, regWr, WriteDat, DatR1, DatR2);
input [31:0] WriteDat;
input [4:0] RegR1, RegR2, RegW;
input clk, regDst, regWr;
output [31:0] DatR1, DatR2;
wire [4:0] WriteReg;

mux2_5b m1(.d0(RegR2), .d1(RegW), .s(regDst), .y(WriteReg));

regmodule r1(.clk(clk), .R1(RegR1), .R2(RegR2),
	 .W(WriteReg), .WDat(WriteDat), .regWr(regWr),
	 .RD1(DatR1), .RD2(DatR2));

endmodule