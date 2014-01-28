// EECE3324 Computer Architecture
// Hw 6
// Tim Liming

// The control unit that takes 6-bit opcode in and generate a set of 9 control signals, 
// including RegDst, Jump, Branch, MemRead, MemtoReg, MemWrite, ALUsrc, RegWrite, 
// ALUop (which will be an input to the small ALU Control unit). 

`timescale 1ns / 1ns

module control_unit(opcode, rst, RegDst, Jump, Branch, 
                    MemRead, MemtoReg, MemWrite, ALUsrc, 
                    RegWrite, ALUOp, addi);
  
  input [5:0] opcode;
  input rst;
  output reg RegDst, Jump, Branch, MemRead, MemtoReg, 
              MemWrite, ALUsrc, RegWrite, addi;
  output reg [1:0] ALUOp;
  
  // initialize
  initial begin
    RegDst = 0;
    ALUsrc = 0;
    MemtoReg = 0;      
    RegWrite = 0;
    MemRead = 0;
    MemWrite = 0;
    Branch = 0;      
    ALUOp <= 2'b00;
    Jump = 0;
	  addi = 0;
  end
  
  // get outputs
  always @ (opcode) begin
    
    RegDst = 0;
    ALUsrc = 0;
    MemtoReg = 0;      
    RegWrite = 0;
    MemRead = 0;
    MemWrite = 0;
    Branch = 0;      
    ALUOp <= 2'b00;
    Jump = 0;
	  addi = 0;
	  
	  // generate control signals
	  case (opcode)
	    // add
	    6'b000000: begin
	      RegDst = 1;
	      RegWrite = 1;
	      ALUOp <= 2'b10;
	      MemWrite = 0;
      end
      
      // addi
      6'b001000: begin
        ALUsrc = 1;
        RegWrite = 1;
        MemWrite = 0;
        ALUOp <= 2'b10;
        addi = 1;
      end
        
      // lw
      6'b100011: begin
        MemWrite = 0;
        ALUsrc = 1;
        MemtoReg = 1;
        RegWrite = 1;
        MemRead = 1;
      end
        
      // sw
      6'b101011: begin
        ALUsrc = 1;
        MemWrite = 1;
		  end
		  
		  // jump
      6'b000010: begin
        Jump = 1;
        RegWrite = 0;
        MemWrite = 0;          
      end
        
      // beq
      6'b000100: begin
        Branch = 1;
        ALUOp <= 2'b01;
        MemWrite = 0;
      end
        
      // NULL op
      6'b111111: begin
        RegDst = 0;
        ALUsrc = 0;
        MemtoReg = 0;
        RegWrite = 0;
        MemRead = 0;
        MemWrite = 0;
        Branch = 0;
        ALUOp <= 2'b00;
        Jump = 0;
        addi = 0;
      end
      
      default: begin
        RegDst = 0;
        ALUsrc = 0;
        MemtoReg = 0;
        RegWrite = 0;
        MemRead = 0;
        MemWrite = 0;
        Branch = 0;
        ALUOp <= 2'b00;
        Jump = 0;
        addi	= 0;
      end
    endcase
  end
  
endmodule