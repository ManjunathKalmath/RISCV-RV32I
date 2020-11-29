module RV32IM_Datapath(clock);
  input clock;
  input Write,Bsel,Immsel,WBsel,Asel,PCsel;
  
  reg [31:0] IR,ALU_Out,PC_current;
  
  wire [31:0] A,B,Imm,rd,rs1,rs2,Write_Data,Read_Data2,Read_Data1,Write_back,PC_next,PC2;
  wire zero;
  wire [2:0] funct3,
  wire [6:0]funct7,opcode; 
  wire [4:0] ALU_Ctrl;
  
  initial begin
    PC_current <= 32'd0;
  end
  
  always@ (posedge clock)
    begin
          PC_current <= PC_next;
    end
  begin
  assign PC2 = PC_current + 4;
  
  //Instruction Memory
  Instruction_Memory RV_IM(.PC_current(PC_current),.IR(IR));
  
  //Add Shift logic
  //Instantiate Control Logic
  if(Immsel == I)
    begin
      assign Imm = {{20{IR[31]}}, IR[30:20]}; //sign extension of IR[31] to upper Imm value
    end
  
  assign funct3 = IR[14:12];
  assign funct7 = IR[31:25]; 
  assign opcode = IR[6:0];
  assign rd = IR[11:7];
  assign rs1 = IR[19:15];
  assign rs2 = IR[24:20];
  
//Instantiating Register file
  Register_File RF_RV(rs1(.rs1(rs1),.rs2(.rs2),A(.A),B(.B),clock(.clock),.Write_Reg(Write_Reg),.Write_Data(Write_Data),.Write(Write));
  
  assign Imm = {{20{IR[31]}}, IR[30:20]}; //sign extension of IR[31] to upper Imm value
  
  //Instantiating ALU
  RISCV_ALU ALU_RV(.ALU_Ctrl(ALU_Ctrl),.A(A),.B(B),.Imm(Imm),.ALU_Out(ALU_Out));
  
  //assign Write_back = (WBsel == 1'b1) ? ALU_Out : Mem_read_data; //Write a control signal
  
  if(WBsel == 1'd0)
    assign Write_back = Mem_read_data;
  else if(WBsel == 1'd1)
    assign Write_back = ALU_Out;
  else if(WBsel == 1'd2)
    assign Write_back = PC + 4;
  
  if(Write == 1'b1)
      assign Write_Data = Write_back;
  else
    assign Mem_write_data = Read_Data2;
      
  //Register_File RF_RV(rs1,rs2,A,B,Clock,rd,Write_Data,Write);
  //Instatiating the Branch Comparator
  Branch_Comparator RV_BRC(.Read_Data1(Read_Data1),.Read_Data2(Read_Data2),.BrUn(BrUn),.BrEq(BrEq),.BrLT(BrLT),.BrGE(BrGE));
  
  assign PC = (PCsel == 1'b1) ? ALU_Out : PC+4;
 end
endmodule
