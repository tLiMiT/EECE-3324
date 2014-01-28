// EECE3324 Computer Architecture
// Advanced Project
// Tim Liming

// Program Counter file

module ProgramCounter(in1, clk, rst, out1);
  
  input [31:0] in1;
  input clk, rst;
  output reg [31:0] out1;
  
  // handle output and reset case
  always @ (posedge clk or posedge rst) begin
    if (rst)
      out1 <= 4096;
    else
      out1 <= in1;
  end
  
endmodule
