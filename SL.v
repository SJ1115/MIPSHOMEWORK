module SL (x, y);
input [31:0] x;
output [31:0] y;

  assign y = {x[29:2], 2'b00};

endmodule