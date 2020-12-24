module DatAcc(fromalu, WriteDat, memWr, memRe, mem2reg, DatOut);
input [31:0] fromalu, WriteDat;
input memWr, memRe, mem2reg;
output [31:0] DatOut;
wire [31:0] ReadData;

memory m(.address(fromalu), .write(WriteDat),
	 .memWr(memWr), .memRe(memRe), .read(ReadData));

mux2 out(.d0(fromalu), .d1(ReadData), .s(mem2reg), .y(DatOut));

endmodule