module regmodule (clk, R1, R2, W, WDat, regWr, RD1, RD2);
input [31:0] WDat;
input [4:0] R1, R2, W;
input clk, regWr;
output [31:0] RD1, RD2;
reg [31:0] rf[31:0];

always @ (posedge clk)
	if (regWr) rf[W] <= WDat;
	assign RD1 = (R1 != 0) ? rf[R1] : 0;
	assign RD2 = (R2 != 0) ? rf[R2] : 0;

endmodule
