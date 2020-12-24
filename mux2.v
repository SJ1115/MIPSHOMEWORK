module mux2 (d0, d1, s, y);
input [31:0] d0, d1;
input s;
output reg [31:0] y;

// assign y = s ? d1 : d0;
always @(*)
begin
  case(s)
    1: y = d1;
    default: y = d0;
  endcase
end

endmodule