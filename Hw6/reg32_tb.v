// EECE3324 Computer Architecture
// Hw 6
// Tim Liming

// Testbench: 32-bit register with asynchronous reset and load-enable. 

`timescale 1ns / 1ns

module reg32_tb;
  
  wire [31:0] regout; // output
  reg [31:0] i0;      // input
  reg rst, en;        // reset bit, enable bit, 
  reg clk;            // clock
  
  // instantiate DUT (device under test)
  reg32 DUT(clk, rst, en, i0, regout);
  
  // generate a clock pulse 
  always
    #10 clk = ~clk;
    
  // set inputs
  initial begin
    $timeformat(-9, 1, " ns", 6);
    clk = 1'b0;
    rst = 1'b0;   // reset: 0
    en = 1'b1;    // enable: 1
    i0 = 32'b00000000000000000000000000000011; // 3
    
    // reset the register
    @ (negedge clk)
      rst = 1'b1;
      
    // enable off
    @ (negedge clk)
      en = 1'b0;
    
    // enable on
    @ (negedge clk)
      en = 1'b1;
    
    // change value
    @ (negedge clk)
      i0 = 32'b00000000000000000000000000000101; // 5
      
    // reset the register
    @ (negedge clk)
      rst = 1'b1;
      
  end
  
  // display inputs and outputs
  always @ (i0 or en or rst)
    #1 $display("At t=%t rst=%b i0=%b en=%b regout=%b",
                $time,   rst,   i0,   en,   regout);
                
endmodule
      
