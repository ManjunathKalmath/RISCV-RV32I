module RV32IM_Datapath(clock);
  input clock;
  input Write,Bsel,Immsel,WBsel;
  
  reg [31:0] PC_current,PC_next,IR,ALU_Out;
  
  wire [31:0] A,B,Imm;
  wire zero,funct3,funct7,opcode,rd,rs1,rs2,Write_Data,Read_Data2,Write_back;
  wire [4:0] ALU_Ctrl;
  
 if(Immsel == I)
    begin
      assign Imm = {{20{IR[31]}}, IR[30:20]}; //sign extension of IR[31] to upper Imm value
    end
  
 initial begin
  PC_current <= 31'd0;
 end
  
 always @(posedge clk)
 begin 
   PC_current <= PC_next;
 end
  
  //assign pc2 = pc_current + 32'd;
  
  Instruction_Memory RV_IM(PC_current,IR);
  
  assign funct3 = IR[14:12];
  assign funct7 = IR[31:25]; 
  assign opcode = IR[6:0];
  assign rd = IR[11:7];
  assign rs1 = IR[19:15];
  assign rs2 = IR[24:20];
  
//  PC <= PC + 4;
  Register_File RF_RV(rs1,rs2,A,B,Clock,Write_Reg,Write_Data,Write);
  
  assign Imm = {{20{IR[31]}}, IR[30:20]}; //sign extension of IR[31] to upper Imm value
  
  RISCV_ALU ALU_RV(ALU_Ctrl,A,B,Imm,ALU_Out);
  
  assign Write_back = (WBsel == 1'b1) ? ALU_Out : Mem_read_data; //Write a control signal
  
  if(Write == 1'b1)
      assign Write_Data = Write_back;
  else
    assign Mem_write_data = Read_Data2;
      
 
  Register_File RF_RV(rs1,rs2,A,B,Clock,rd,Write_Data,Write);
  
  
endmodule
