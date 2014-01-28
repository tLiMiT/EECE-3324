// EECE3324 Computer Architecture
// Basic Project
// Tim Liming & Wing Tung Yuen

// Shift Left 2 module

`timescale 1ns/1ns

module ShiftLeft2(in1, out1);
  
  input [31:0] in1;       // output of sign-extend
  output reg [31:0] out1; // output of shift-left 2
  
  always @ (in1) begin
    // ignore first two bits and add two zeros to end
    out1 = {in1[29:0], 2'b00};
  end
endmodule  
