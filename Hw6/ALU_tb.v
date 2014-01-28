// EECE3324 Computer Architecture
// Hw 6
// Tim Liming

// Testbench: ALU 

`timescale 1ns / 1ns

module ALU_tb;
  
  wire [31:0] ALUresult;  // output: ALU result
  wire Zero;              // output: zero
  reg [31:0] i0, i1;      // inputs to ALU
  reg [3:0] ALUoperation;    // input: ALU operation
  reg clk;                // clock
  
  // instantiate DUT (device under test)
  ALU DUT(ALUoperation, i0, i1, ALUresult, Zero);
  
  // generate a clock pulse 
  always
    #10 clk = ~clk;
    
  // set inputs
  initial begin
    $timeformat(-9, 1, " ns", 6);
    clk = 1'b0;
    ALUoperation = 4'b0110;  // sub
    i0 = 32'b00000000000000000000000000000101; // 5
    i1 = 32'b00000000000000000000000000000011; // 3
    
    // add
    @ (negedge clk)
      ALUoperation = 4'b0010;
      
    // slt
    @ (negedge clk)
      ALUoperation = 4'b0111;
      
  end
  
  // display inputs and outputs
  always @ (i0 or i1 or ALUoperation)
    #1 $display("At t=%t Zero=%b ALUoperation=%b",
                $time,   Zero,   ALUoperation);
                
endmodule
