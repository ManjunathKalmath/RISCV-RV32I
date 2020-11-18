module Branch_Comparator(Read_Data1,Read_Data2,BrUn,BrEq,BrLT,BrGE);
 input [31:0] Read_Data1,Read_Data2;
 input BrUn;
 output BrEq,BrLT,BrGE;
 
 begin
 if(Read_Data1 == Read_Data2)
  BrEq = 1;
 else if(Read_Data1 < Read_Data2)
  BrLT = 1;
 else if(!(Read_Data1 < Read_Data2))
  BrGE = 1;
 else
  $display("Error");
 end
 
endmodule
