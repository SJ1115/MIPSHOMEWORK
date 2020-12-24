module memory (address, write, memWr, memRe, read);
input [31:0] address, write;
input memWr, memRe;
output reg [31:0] read;
reg [31:0] MEM[0:63];	
	
initial
begin
    $readmemb ("memory.mem",MEM);
end

always@(address)
begin
  if(memWr) MEM[address] = write;
  
  $writememb("memory.mem", MEM);
end

always@(address)
begin
  if(memRe) read = MEM[address];
end

endmodule
