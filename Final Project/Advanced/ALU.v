// EECE3324 Computer Architecture
// Advanced Project
// Tim Liming

// An ALU that support a set of MIPS instructions: add, addi, beq, j, lw and sw. The ALU 
// takes a 4-bit control signal and two 32-bit data inputs in, and generates two outputs 
// (32-bit ALUresult and 1-bit Zero).   

`timescale 1ns / 1ns

module ALU(ALUoperation, i0, i1, ALUresult, Zero);
  
  input [3:0] ALUoperation;
  input [31:0] i0, i1;
  output reg [31:0] ALUresult;
  output Zero;
  
  // set zero 
  assign Zero = (ALUresult == '0);
  
  // generate ALU result
  always @ (i0 or i1 or ALUoperation) begin
    
    case (ALUoperation)
      // and
      4'b0000: begin ALUresult = i0 & i1; end
      // or
      4'b0001: begin ALUresult = i0 | i1; end
      // add
      4'b0010: begin ALUresult = i0 + i1; end
      // sub
      4'b0110: begin ALUresult = i0 - i1; end
      // slt
      4'b0111: begin ALUresult = i0 < i1 ? 1 : 0; end
      // nor
      4'b1000: begin ALUresult = ~(i0 | i1); end
      default: begin ALUresult = 0; end
    endcase
  end
  
endmodule
