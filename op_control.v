module op_control(opcode, regWr, regDst, aluSrc, br, memRe, memWr, mem2reg, aluop, jump);
input[5:0] opcode;
output reg regWr, regDst, aluSrc, br, memRe, memWr, mem2reg, jump;
output reg [1:0] aluop;

always @(opcode)
begin // regWr
    case(opcode)
      6'b000000: regWr = 1;
      6'b100011: regWr = 1;
      6'b001000: regWr = 1;
      6'b001101: regWr = 1;
	default: regWr = 0;
    endcase
end

always @(opcode)
begin //regDst
    case(opcode)
      6'b000000: regDst = 1;
     	default: regDst = 0;
    endcase
end

always @(opcode)
begin //aluSrc
    case(opcode)
      6'b000000: aluSrc = 0;
      6'b000100: aluSrc = 0;
      6'b000010: aluSrc = 0;
	default: aluSrc = 1;
    endcase
end

always @(opcode)
begin //br
    case(opcode)
      6'b000100: br = 1;
	default: br = 0;
    endcase
end

always @(opcode)
begin // memRe
    case(opcode)
      6'b100011: memRe = 1;
        default: memRe = 0;
    endcase
end

always @(opcode)
begin // memWr
    case(opcode)
      6'b101011: memWr = 1;
	default: memWr = 0;
    endcase
end

always @(opcode)
begin // mem2reg
    case(opcode)
      6'b100011: mem2reg = 1;
	default: mem2reg = 0;
    endcase
end

always @(opcode)
begin // jump
    case(opcode)
      6'b000010: jump = 1; 
      	default: jump = 0; 
    endcase
end

always @(opcode)
begin // aluop
    case(opcode)
      6'b000000: aluop = 2'b10; 
      6'b000100: aluop = 2'b01;
	default: aluop = 2'b00;
    endcase
end


endmodule
