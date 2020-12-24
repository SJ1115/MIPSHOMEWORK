module InsFet(clk, rst, n_clk, pc, n_pc, inst);
input clk, rst;
input [31:0] pc;
output wire n_clk;
output wire [31:0] n_pc, inst;

clk_dll div(.rst(rst), .clk(clk), .out_clk(n_clk));

pc p1(.rst(rst), .clk(n_clk), .pc(pc), .newpc(n_pc));

instruction_memory in(.pc(n_pc), .inst(inst));

endmodule
