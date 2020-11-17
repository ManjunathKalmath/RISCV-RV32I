module RISCV_ALU(ALU_Ctrl,A,B,Imm,ALU_Out);
 input [31:0] A,B,Imm;
 input [4:0] ALU_Ctrl;
 output reg [31:0] ALU_Out;
 outut zero;
 if(ALU_Out == 0)
  zero = ALU_Out;
 always @(*)
  begin
   case(ALU_Ctrl)
    1 : ALU_Out <= A + B; //ADD
    2 : ALU_Out <= A + Imm; //ADDI
    3 : ALU_Out <= A | B; //OR
    4 : ALU_Out <= A | Imm; //ORI;
    5 : ALU_Out <= A ^ B; //XOR
    6 : ALU_Out <= A ^ Imm; //XORI;
    7 : ALU_Out <= A & B; //AND
    8 : ALU_Out <= A & Imm; //ANDI;
    9 : ALU_Out <= A - B; //SUB
   10 : ALU_Out <= A < B ? 1 : 0; //SLT
   11 : ALU_Out <=  //SLTI
   12 : ALU_Out <= //SLTU
   13 : ALU_Out <= //SLTIU
   14 : ALU_Out <= //SLLI
   15 : ALU_Out <= //SRLI
   16 : ALU_Out <= //SRAI
   17 : ALU_Out <= //SLL
   18 : ALU_Out <= //SRL
   19 : ALU_Out <= //SRA
   default ALU_Out <= 0;
   endcase
  end
endmodule
