module RV32IM(clock);
  input clock;
  input Write
  
  reg [31:0] PC,IR,ALU_Out;
  reg [31:0] Memory [0:1023];
  
  wire [31:0] A,B;
  wire zero;
  wire [4:0] ALU_Ctrl;
  
  assign funct3 = IR[14:12];
  assign funct7 = IR[31:25]; 
  assign opcode = IR[6:0];
  assign rd = IR[11:7];
  assign rs1 = IR[19:15];
  assign rs2 = IR[24:20];
  
  Fetch = Memory[PC];
  PC <= PC + 4;
  Register_File RF_RV(rs1,rs2,A,B,Clock,Write_Reg,Write_Data,Write=0);
  RISCV_ALU ALU_RV(ALU_Ctrl,A,B,ALU_Out);
  Register_File RF_RV(rs1,rs2,A,B,Clock,rd,Write_Data,Write=1);
  
  
  
  
  
endmodule
