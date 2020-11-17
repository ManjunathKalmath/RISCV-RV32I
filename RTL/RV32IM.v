//Top module
module RV32IM_Core(clock);
  input clock;
  reg [31:0] PC,IR;
  input [31:0] A,B;
  RISCV_ALU(ALU_Ctrl,A,B.ALU_Out);
 endmodule


