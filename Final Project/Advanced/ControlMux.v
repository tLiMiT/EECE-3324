// EECE3324 Computer Architecture
// Advanced Project
// Tim Liming

// Pass-thru for the control signals

`timescale 1ns / 1ns

module ControlMux(in1, sel, out1);
  
  input [9:0] in1;
  input sel;
  output reg [9:0] out1;
  
  always @ (in1 or sel) begin
    if (!sel) begin
      out1 <= in1;
    end
    else begin
      out1 <= 10'b0;
    end
  end
  
endmodule
