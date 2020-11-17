module Data_Memory(Address,MemRW,clock);
input Address,MemRW;

reg [31:0] Memory [0:63];

always @(posedge clock)
begin

end
endmodule
