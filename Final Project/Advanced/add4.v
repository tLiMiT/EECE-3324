// EECE3324 Computer Architecture
// Advanced Project
// Tim Liming

// adds 4 to the input

module add4(in0, out0);
  input [31:0] in0;
  output reg [31:0] out0;
  
  always @ (in0) begin
    out0 = in0 + 4;
  end
  
endmodule
