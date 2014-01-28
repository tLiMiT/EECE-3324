// EECE3324 Computer Architecture
// Basic Project
// Tim Liming & Wing Tung Yuen

// Program Counter file

module ProgramCounter(in1, clk, rstPC, out1);
  
  input [31:0] in1;
  input clk, rstPC;
  output reg [31:0] out1;
  
  // handle output and reset case
  always @ (posedge clk or posedge rstPC) begin
    if (rstPC)
      out1 <= 4096;
    else
      out1 <= in1;
  end
  
endmodule
