// EECE3324 Computer Architecture
// Hw 6
// Tim Liming

// A register file consisting of 32 32-bit registers designed in problem 2. The register file 
// has two read ports and one write port, and one write enable port

`timescale 1ns / 1ns

module registerfile(ra0, ra1, wreg, wdata, en, clk, rst, rd0, rd1);
  
  input [4:0] ra0, ra1, wreg;
  input [31:0] wdata;
  input en, clk, rst;
  output [31:0] rd0, rd1;
  
  reg [31:0] registers [0:31];
  reg [31:0] rd_reg0, rd_reg1;
  
  // set outputs
  assign rd0 = registers[ra0];
  assign rd1 = registers[ra1];
  
  // set registers to zero on reset
  always @ (negedge rst)
  begin
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
    
    // set to zero on reset 
    rd_reg0 = 0;
    rd_reg1 = 0;
  end
  
  // handle register data
  always @ (negedge clk)
  begin
    rd_reg0 = registers[ra0];
    rd_reg1 = registers[ra1];
    
    // on enable, write data in register
    if (en && (wreg != 0))
      registers [wreg] <= wdata;
      
    registers[ra0] = rd_reg0;
    registers[ra1] = rd_reg1;
  end
   
endmodule