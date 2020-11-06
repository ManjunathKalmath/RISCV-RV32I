module ALU_Control(ALU_OP,funct_code,ALU_Ctrl);
  input [1:0] ALU_OP;
  input [10:0] funct_code;
  Output reg [3:0] ALU_Ctrl;
  
always begin
  case (funct_code)
     11'b0_000_0110011 : ALU_OP <= 1; // ADD
     11'bx_000_0010011 : ALU_OP <= 2; //ADDI
     11'b0_110_0110011 : ALU_OP <= 3; //OR
     11'bx_110_0010011 : ALU_OP <= 4; //ORI
     11'b0_100_0110011 : ALU_OP <= 5; //XOR
     11'bx_100_0010011 : ALU_OP <= 6; //XORI
     11'b0_111_0110011 : ALU_OP <= 7; //AND
     11'bx_111_0110011 : ALU_OP <= 8; //ANDI
     11'b1_000_0110011 : ALU_OP <= 9; //SUB
     11'b0_010_0110011 : ALU_OP <= 10; //SLT
     11'bx_010_0010011 : ALU_OP <= 11; //SLTI
     11'b0_011_0110011 : ALU_OP <= 12; //SLTU
     11'b0_011_0110011 : ALU_OP <= 13; //SLTIU
     11'b0_001_0010011 : ALU_OP <= 14; //SLLI
     11'b0_101_0010011 : ALU_OP <= 15; //SRLI
     11'b1_101_0010011 : ALU_OP <= 16; //SRAI
     11'b0_001_0110011 : ALU_OP <= 17; //SLL
     11'b0_101_0110011 : ALU_OP <= 18; //SRL
     11'b1_101_0110011 : ALU_OP <= 19; //SRA
  endcase
 end
endmodule
