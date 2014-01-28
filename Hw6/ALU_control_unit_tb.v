// EECE3324 Computer Architecture
// Hw 6
// Tim Liming

// Testbench: ALU_control_unit 

`timescale 1ns / 1ns

module ALU_control_unit_tb;
  
  wire [3:0] ALUoperation; // output: ALU control signal
  reg [5:0] func;       // input: function
  reg [1:0] ALUop;      // input: ALUop
  reg addi;             // input: addi
  reg clk;              // clock
  
  // instantiate DUT (device under test)
  ALU_control_unit DUT(ALUop, addi, func, ALUoperation);
  
  // generate a clock pulse 
  always
    #10 clk = ~clk;
    
  // set inputs
  initial begin
    $timeformat(-9, 1, " ns", 6);
    clk = 1'b0;
    addi = 1'b0;    // switch function
    func = 4'b0010; // sub
    ALUop = 2'b01;  // beq
    
    // lw & sw
    @ (negedge clk)
      ALUop = 2'b00;
      
    // R-type
    @ (negedge clk)
      ALUop = 2'b11;
    
  end
  
  // display inputs and outputs
  always @ (ALUop or func or addi)
    #1 $display("At t=%t ALUop=%b func=%b addi=%b ALUoperation=%b",
                $time,   ALUop,   func,   addi,   ALUoperation);
                
endmodule
