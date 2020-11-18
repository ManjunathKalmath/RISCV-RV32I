module Data_Memory(Address,Mem_write_data,MemRW,Mem_read_data,clock);
  input clock,MemRW;
  input [31:0] Address,Mem_write_data;  
  output [31:0] Mem_read_data;
  
  reg [31:0] Memory [0:1023];//test it while writing test bench and make changes
  
  always @(posedge clock)
    begin
      if(MemRW == 1)
        Memory[Address] <= Mem_write_data;
      else
        Mem_read_data <= Memory[Address];
    end
endmodule
