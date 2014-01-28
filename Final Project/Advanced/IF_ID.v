// EECE3324 Computer Architecture
// Advanced Project
// Tim Liming

// IF/ID Pipeline Register

`timescale 1ns / 1ns

module IF_ID(Instruction, PC4in, en, clk, rst, 
             InstructionReg, PC4out);
  
  input [31:0] Instruction, PC4in;
  input en, clk, rst;
  output reg [31:0] InstructionReg, PC4out;
  
  // initialize
  initial begin
    InstructionReg = 0;
    PC4out = 0;
  end
  
  always @ (posedge clk or posedge rst) begin
    if (en) begin
      if (!rst) begin
        InstructionReg <= Instruction;
        PC4out <= PC4in;
      end
      else begin
        InstructionReg <= 32'b11111100000000000000000000000000;
        PC4out <= 0;
      end
    end
  end
  
endmodule
