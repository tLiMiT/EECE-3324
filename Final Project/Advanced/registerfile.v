// EECE3324 Computer Architecture
// Advanced Project
// Tim Liming

// A register file consisting of 32 32-bit registers designed in problem 2. 
// The register file has two read ports and one write port, and one write enable port

`timescale 1ns / 1ns

module registerfile(readReg1, readReg2, writeReg, writeData, 
                    en, clk, rst, readData1, readData2);
  
  input [4:0] readReg1, readReg2, writeReg;
  input [31:0] writeData;
  input en, clk, rst;
  output reg[31:0] readData1, readData2;
  
  reg [31:0] registers[31:0];
  
  // set registers to zero on reset
  always @ (posedge rst) begin
    registers [0] = 0;
    registers [1] = 0;
    registers [2] = 0;
    registers [3] = 0;
    registers [4] = 0;
    registers [5] = 0;
    registers [6] = 0;
    registers [7] = 0;
    registers [8] = 0;
    registers [9] = 0;
    registers [10] = 0;
    registers [11] = 0;
    registers [12] = 0;
    registers [13] = 0;
    registers [14] = 0;
    registers [15] = 0;
    registers [16] = 0;
    registers [17] = 0;
    registers [18] = 0;
    registers [19] = 0;
    registers [20] = 0;
    registers [21] = 0;
    registers [22] = 0;
    registers [23] = 0;
    registers [24] = 0;
    registers [25] = 0;
    registers [26] = 0;
    registers [27] = 0;
    registers [28] = 0;
    registers [29] = 0;
    registers [30] = 0;
    registers [31] = 0;
  end
  
  // handle register data
  always @ (readReg1 or readReg2) begin
    readData1 <= registers[readReg1];
    readData2 <= registers[readReg2];
  end
  
  // write back
  always @ (posedge clk) begin 
    // on enable, write data in register    
    if (en && (writeReg != 0))
      registers[writeReg] <= writeData;
  end
   
endmodule