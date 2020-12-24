module NextPC(pc, addr, insIn, jump, br, zero, nextpc);
input [31:0] pc, insIn;
input [25:0] addr;
input jump, br, zero;
output [31:0] nextpc;
wire [31:0] plus4, sl2, shift, bran, jumpW;
wire brmux;

assign brmux = br && zero;

add p4(.x(pc), .y(4), .out(plus4));

SL Sbr(.x(insIn), .y(shift));

add Abr(.x(plus4), .y(shift), .out(bran));

mux2 Mbr(.d0(plus4), .d1(bran), .s(brmux), .y(jumpW));

mux2 Mju(.d0(jumpW), .d1({plus4[31:28], addr[25:0], 2'b00}), .s(jump), .y(nextpc));

endmodule