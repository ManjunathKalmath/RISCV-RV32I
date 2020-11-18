module Data_Memory(Address,Mem_write_data,MemRW,DataR,clock);
  input clock,MemRW;
  input [31:0] Address,Mem_write_data;  
  output [31:0] DataR;
  
  reg [31:0] Memory [0:1023];//test it while writing test bench and make changes
  
  always @(posedge clock)
    begin
      if(MemRW == 1)
        Memory[Address] <= Mem_write_data;
      else
        DataR <= Memory[Address];
    end
endmodule
