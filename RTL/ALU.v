module RISCV_ALU(ALU_Ctl,A,B,ALU_Out);
 input [31:0] A,B;
 input [3:0] ALU_Ctl;
 output reg [31:0] ALU_Out;
 outut zero;
 if(ALU_Out == 0)
  zero = ALU_Out;
 always @(*)
  begin
   case(ALU_Ctl)
    2 : ALU_Out <= A + B;
    6 : ALU_Out <= A - B;
    1 : ALU_Out <= A | B;
    0 : ALU_Out <= A & B;
    7 : ALU_Out <= A < B ? 1 : 0;
   12 : ALU_Out <= ~ (A | B);
    default ALU_Out <= 0;
   endcase
  end
endmodule
