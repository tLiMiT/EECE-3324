// EECE3324 Computer Architecture
// Advanced Project
// Tim Liming

// 32-bit adder

module adder(in0, in1, out0);
  input [31:0] in0, in1;
  output reg [31:0] out0;
  
  always @ (in0 or in1) begin
    out0 = in0 + in1;
  end
  
endmodule
