// EECE3324 Computer Architecture
// Hw 6
// Tim Liming

// Testbench: control_unit

`timescale 1ns / 1ns

module control_unit_tb;
  
  // outputs
  wire RegDst, Jump, Branch, MemRead, MemtoReg, MemWrite, 
        ALUsrc, RegWrite, addi;
  wire [1:0] ALUop;   // output: ALUop
  reg [5:0] opcode;   // input: opcode
  reg rst;            // input: reset
  reg clk;            // clock
  
  // instantiate DUT (device under test)
  control_unit DUT(opcode, rst, RegDst, Jump, Branch, 
                    MemRead, MemtoReg, MemWrite, ALUsrc, 
                    RegWrite, ALUop, addi);
  
  // generate a clock pulse 
  always
    #10 clk = ~clk;
    
  // set inputs
  initial begin
    $timeformat(-9, 1, " ns", 6);
    clk = 1'b0;
    rst = 1'b0;   // reset: 0
    opcode = 6'b000010; // jump
    
    // addi
    @ (negedge clk)
      opcode = 6'b001000;
      
    // lw
    @ (negedge clk)
      opcode = 6'b100011;
      
    // beq
    @ (negedge clk)
      opcode =  6'b000100;
      
  end
  
  // display inputs and outputs
  always @ (opcode or rst)
    #1 $display("At t=%t rst=%b opcode=%b addi=%b jump=%b MemtoReg=%b branch=%b",
                $time,   rst,   opcode,   addi,   Jump,   MemtoReg,   Branch);
                
endmodule
