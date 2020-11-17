module Instruction_Memory(Address,IR);
input [31:0] Address;
output [31:0] IR;
reg [31:0] Memory [0:1023];

initial begin
 $readmemh("prog.txt",Memory);
end

assign IR = Memory [Address>>2];

endmodule
