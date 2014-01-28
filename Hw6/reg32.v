// EECE3324 Computer Architecture
// Hw 6
// Tim Liming

// 32-bit register with asynchronous reset and load-enable. 

`timescale 1ns / 1ns

module reg32(clk, rst, en, D, Q);
  
  input clk;            // clock
  input rst, en;        // reset, enable
  input [31:0] D;       // 32-bit input
  output reg [31:0] Q;  // 32-bit output
  
  always @ (posedge clk)
  begin
    if (!rst)
      Q <= 32'b00000000000000000000000000000000;
    else
      begin
        if (en)
          Q <= D;
      end
  end
  
endmodule