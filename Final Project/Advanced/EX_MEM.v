// EECE3324 Computer Architecture
// Advanced Project
// Tim Liming

// EX/MEM Pipeline Register

`timescale 1ns / 1ns

module EX_MEM(XALUout, XALUB, XaddiOut, XWriteReg, XRegWrite, XMemtoReg, 
              XBranch, XMemRead, XMemWrite, Xzero, clk, rst, 
              MALUout, MALUB, MaddiOut, MWriteReg, MRegWrite, MMemtoReg, 
              MBranch, MMemRead, MMemWrite, Mzero);
  
  input [31:0] XALUout, XALUB, XaddiOut;
  input [4:0] XWriteReg;
  input XRegWrite, XMemtoReg, XBranch, XMemRead, XMemWrite, Xzero;
  input clk, rst;
  output reg [31:0] MALUout, MALUB, MaddiOut;
  output reg [4:0] MWriteReg;
  output reg MRegWrite, MMemtoReg, MBranch, MMemRead, MMemWrite, Mzero;
  
  // initialize
  initial begin
    MALUout = 0;
    MALUB = 0;
    MaddiOut = 0;
    MWriteReg = 0;
    MRegWrite = 0;
    MMemtoReg = 0;
    MBranch = 0;
    MMemRead = 0;
    MMemWrite = 0;
    Mzero = 0;
  end
  
  // Pass through values
  always @ (posedge clk or posedge rst) begin
    if (!rst) begin
      MALUout <= XALUout;
      MALUB <= XALUB;
      MaddiOut <= XaddiOut;
      MWriteReg <= XWriteReg;
      MRegWrite <= XRegWrite;
      MMemtoReg <= XMemtoReg;
      MBranch <= XBranch;
      MMemRead <= XMemRead;
      MMemWrite <= XMemWrite;
      Mzero <= Xzero;
    end
    else begin
      MALUout <= 0;
      MALUB <= 0;
      MaddiOut <= 0;
      MWriteReg <= 0;
      MRegWrite <= 0;
      MMemtoReg <= 0;
      MBranch <= 0;
      MMemRead <= 0;
      MMemWrite <= 0;
      Mzero <= 0;
    end
  end
  
endmodule
