module ALU_Control(funct_code,Bsel,ALU_Ctrl);
  input [10:0] funct_code;
  input Bsel;
  output reg [4:0] ALU_Ctrl;
  
always begin
  if(Bsel == 1)
    begin
      case(funct_code)
         11'bx_000_0010011 : ALU_Ctrl <= 2; //ADDI
         11'bx_110_0010011 : ALU_Ctrl <= 4; //ORI
         11'bx_100_0010011 : ALU_Ctrl <= 6; //XORI
         11'bx_111_0110011 : ALU_Ctrl <= 8; //ANDI
         11'bx_010_0010011 : ALU_Ctrl <= 11; //SLTI 
      endcase
    end
  else
    begin
      case (funct_code)
        11'b0_000_0110011 : ALU_Ctrl <= 1; // ADD
        11'b0_110_0110011 : ALU_Ctrl <= 3; //OR
        11'b0_100_0110011 : ALU_Ctrl <= 5; //XOR
        11'b0_111_0110011 : ALU_Ctrl <= 7; //AND
        11'b1_000_0110011 : ALU_Ctrl <= 9; //SUB
        11'b0_010_0110011 : ALU_Ctrl <= 10; //SLT
        11'b0_011_0110011 : ALU_Ctrl <= 12; //SLTU
        11'b0_011_0110011 : ALU_Ctrl <= 13; //SLTIU
        11'b0_001_0010011 : ALU_Ctrl <= 14; //SLLI
        11'b0_101_0010011 : ALU_Ctrl <= 15; //SRLI
        11'b1_101_0010011 : ALU_Ctrl <= 16; //SRAI
        11'b0_001_0110011 : ALU_Ctrl <= 17; //SLL
        11'b0_101_0110011 : ALU_Ctrl <= 18; //SRL
        11'b1_101_0110011 : ALU_Ctrl <= 19; //SRA
    endcase
  end
endmodule
