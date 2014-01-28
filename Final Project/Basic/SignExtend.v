// EECE3324 Computer Architecture
// Basic Project
// Tim Liming & Wing Tung Yuen

// Sign Extend module

module SignExtend(instr, se_out);
  
  input [15:0] instr;       // Instruction [15-0]
  output reg [31:0] se_out; // Sign extend output [31-0]
  
  // extend the MSB
  always @ (instr) begin
    se_out <= $signed(instr);
  end
  
endmodule
