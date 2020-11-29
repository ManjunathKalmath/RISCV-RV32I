//RISCV Register File
module Register_File(Read_Reg1,Read_Reg2,Read_Data1,Read_data2,clock,Write_Reg,Write_Data,Write);
 input [5:0] Read_Reg1,Read_Reg2,Write_Reg;
 input [31:0] Write_Data;
 input Write,clock;//here write is the Control to Register File
 output [31:0] Read_Data1,Read_Data2;
 reg [31:0] Reg_File [31:0];//32 registres each of 32 bit long
 
 assign Read_Data1 = Reg_File[Read_reg1];
 assign Read_Data2 = Reg_File[Read_reg2];
 always @(posedge clock)
  begin
  if(Write)
   Reg_File[Write_reg] <= Write_Data;
  end
endmodule
