// EECE3324 Computer Architecture
// Advanced Project
// Tim Liming

// The small ALU control unit that takes the ALUop and 6-bit function code in and 
// generates 4-bit ALU_operation signal for the ALU.

// Taken from Figure 4.13 (Pg. 318) 

`timescale 1ns / 1ns

module ALU_control_unit(ALUop, addi, func, ALUoperation);
  
  input [1:0] ALUop;
  input addi;
  input [5:0] func;
  output reg [3:0] ALUoperation;
  
  // initialize
  initial begin
    ALUoperation = 4'b0000;
  end
  
  always @ (ALUop or func) begin
    
    case (ALUop)
      
      // lw & sw (add)
      2'b00: begin ALUoperation = 4'b0010; end
      
      // beq (sub)
      2'b01: begin ALUoperation = 4'b0110; end
      
      // ALUOp1 == 1
      2'b10: begin
        // allow for addi
        case (addi)
          1'b1: begin ALUoperation = 4'b0010; end
          
          1'b0: begin
            case (func[3:0]) // func[5:4] is don't care
              // add
              4'b0000: begin ALUoperation = 4'b0010; end
              // sub
              4'b0010: begin ALUoperation = 4'b0110; end
              // and
              4'b0100: begin ALUoperation = 4'b0000; end
              // or
              4'b0101: begin ALUoperation = 4'b0001; end
              // slt
              4'b1010: begin ALUoperation = 4'b0111; end
            endcase
          end
        endcase
      end
      
      // handle alternate don't care cases
      2'b11: begin
        case (func[3:0]) // func[5:4] is don't care
          // sub
          4'b0010: begin ALUoperation = 4'b0110; end
          // slt
          4'b1010: begin ALUoperation = 4'b0111; end
        endcase
      end
    endcase
  end
  
endmodule
            
      
