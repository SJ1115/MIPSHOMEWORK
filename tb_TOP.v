`timescale 1ns/1ns
module tb_TOP();
reg clk, rst;
wire[31:0] pc, datashow;

MIPS_top tb(clk, rst, pc, datashow);

initial
begin
rst=0;
#55; rst=1;
end

initial
begin
clk=0;
forever #5 clk=~clk;
end


endmodule
