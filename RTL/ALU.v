module RISCV_ALU(ALU_Ctrl,Asel,Bsel,PC,Read_Data1,Read_Data2,Imm,ALU_Out);
 input [31:0] Read_Data1,Read_Data2,Imm,PC;
 input Asel,Bsel;
 input [4:0] ALU_Ctrl;
 wire [31:0] A,B;
 output reg [31:0] ALU_Out;
 output zero;
 
 assign A = (Asel == 1'b1) ? PC : Read_Data1;
 assign B = (Bsel == 1'b1) ? Imm : Read_Data2;
 
 if(ALU_Out == 0)
  zero = ALU_Out;
 always @(Read_Data1,Read_Data2,Imm)
  begin
   case(ALU_Ctrl)
    1 : ALU_Out <= A + B;              //ADD
    2 : ALU_Out <= A + Imm;            //ADDI
    3 : ALU_Out <= A | B;              //OR
    4 : ALU_Out <= A | Imm;            //ORI;
    5 : ALU_Out <= A ^ B;              //XOR
    6 : ALU_Out <= A ^ Imm;            //XORI;
    7 : ALU_Out <= A & B;              //AND
    8 : ALU_Out <= A & Imm;           //ANDI;
    9 : ALU_Out <= A - B;             //SUB
   10 : ALU_Out <= A < B ? 1 : 0;      //SLT
   11 : ALU_Out <= A < Imm ? 1 : 0;   //SLTI
   12 : ALU_Out <= A < B ? 1 : 0;     //SLTU
   13 : ALU_Out <= A < Imm ? 1 : 0;    //SLTIU
   14 : ALU_Out <= A << Imm;          //SLLI
   15 : ALU_Out <= A >> Imm;          //SRLI
   16 : ALU_Out <= A >> Imm;         //SRAI
   17 : ALU_Out <= A << B;           //SLL
   18 : ALU_Out <= A >> B;           //SRL
   19 : ALU_Out <= A >> B;           //SRA
   default ALU_Out <= 0;
   endcase
  end
endmodule
