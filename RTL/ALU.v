module RISCV_ALU(ALU_Ctrl,A,B,ALU_Out);
 input [31:0] A,B;
 input ALU_Ctrl;
 output reg [31:0] ALU_Out;
 outut zero;
 if(ALU_Out == 0)
  zero = ALU_Out;
 always @(*)
  begin
   case(ALU_Ctrl)
    0: ALU_Out <= A + B;
    1: ALU_Out <= A - B;
    2: ALU_Out <= A | B;
    3: ALU_Out <= A & B;
    4: ALU_Out <= A < B ? 1 : 0;
    default ALU_Out <= 0;
   endcase
  end
endmodule
