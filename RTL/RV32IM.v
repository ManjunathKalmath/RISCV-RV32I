//Top module
module RV32IM(clock);
  input clock;
  reg [31:0] PC,IR;
  input [31:0] A,B;
  RISCV_ALU(ALU_Ctrl,A,B.ALU_Out);
 endmodule

//RISCV ALU - need to be edited while merging the entire code
module RISCV_ALU(ALU_Ctrl,A,B.ALU_Out);
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
  
//RISCV Register File
module Register_File(Read_Reg1,Read_Reg2,Read_Data1,Read_data2,Clock,Write_Reg,Write_Data,Write);
 input [5:0] Read_Reg1,Read_Reg2,Write_Reg;
 input [31:0] Write_Data;
 input Write,clock;//here write is the Control to Register File
 reg [31:0] Reg_File [31:0];//32 registres each of 32 bit long
 
 assign Read_Data1 = Reg_File[Read_reg1];
 assign Read_Data2 = Reg_File[Read_reg2];
 always @(posedge clock)
  begin
  if(Write)
   Reg_File[Write_reg] <= Write_Data;
  end
endmodule


//Arithmetic Instructions
ADD = 11'b0_000_0110011;
ADDI = 11'bx_000_0010011;
OR = 11'b0_110_0110011;
ORI = 11'bx_110_0010011;
XOR = 11'b0_100_0110011;
XORI = 11'bx_100_0010011;
AND = 11'b0_111_0110011;
ANDI = 11'bx_111_0110011;
SUB = 11'b1_000_0110011;
SLT = 11'b0_010_0110011;
SLTI = 11'bx_010_0010011;
SLTU = 11'b0_011_0110011;
SLTIU = 11'bx_011_0010011;
SLLI =  11'b0_001_0010011;
SRLI = 11'b0_101_0010011;
SRAI = 11'b1_101_0010011;
SLL = 11'b0_001_0110011;
SRL =  11'b0_101_0110011;
SRA =  11'b1_101_0110011;

//Load Instruction
 LOAD = 11'bx_xxx_0000011;

//Store Instruction
SB = 11'bx_000_0100011;
SH = 11'bx_001_0100011;
SW = 11'bx_010_0100011;

//Jump Instructions
LUI = 11'bx_xxx_0110111;
AUIPC = 11'bx_xxx_0010111;
JAL = 11'bx_xxx_1101111;
JALR = 11'bx_000_1100111;

//Branch Instructions
BEQ = 11'bx_000_1100011;
BNE = 11'bx_001_1100011;
BLT = 11'bx_100_1100011;
BGE = 11'bx_101_1100011;
BLTU = 11'bx_110_1100011;
BGEU = 11'bx_111_1100011;
