module ALU(a, b, control, zero, outalu);
input [31:0] a, b;
input [3:0] control;
output zero;
output [31:0] outalu=0;
reg [31:0] outalu;
reg zero;

always@(a or b or control)
begin
 case(control)
  4'b0000 : outalu = a & b;
  4'b0001 : outalu = a | b;
  4'b0010 : outalu = a + b;
  4'b0110 : outalu = a - b;
  4'b0111 : outalu = a < b;
  4'b1100 : outalu = ~(a | b);
 endcase
end

always@(outalu)
begin
 if(outalu==0) zero = 1;
 else zero = 0;
end

endmodule
