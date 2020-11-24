module Instruction_Memory(PC_current,IR);
 input [31:0] PC_current;
output [31:0] IR;
reg [31:0] Memory [0:1023];

initial begin
 $readmemh("prog.txt",Memory);
end

assign IR = Memory [PC_current>>2];

endmodule
