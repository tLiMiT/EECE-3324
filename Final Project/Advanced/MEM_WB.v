// EECE3324 Computer Architecture
// Advanced Project
// Tim Liming

// MEM/WB Pipeline Register

`timescale 1ns / 1ns

module MEM_WB(MReadData, Maddress, MWriteReg, MRegWrite, MMemtoReg, 
              clk, rst, 
              WReadData, Waddress, WWriteReg, WRegWrite, WMemtoReg);
  
  input [31:0] MReadData, Maddress;
  input [4:0] MWriteReg;
  input MRegWrite, MMemtoReg;
  input clk, rst;
  output reg [31:0] WReadData, Waddress;
  output reg [4:0] WWriteReg;
  output reg WRegWrite, WMemtoReg;
  
  // initialize
  initial begin
    WReadData = 0;
    Waddress = 0;
    WWriteReg = 0;
    WRegWrite = 0;
    WMemtoReg = 0;
  end
  
  always @ (posedge clk or posedge rst) begin
    if (!rst) begin
      WReadData <= MReadData;
      Waddress <= Maddress;
      WWriteReg <= MWriteReg;
      WRegWrite <= MRegWrite;
      WMemtoReg <= MMemtoReg;
    end
  end
  
endmodule
