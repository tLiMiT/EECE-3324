// EECE3324 Computer Architecture
// Hw 6
// Tim Liming

// Testbench: registerfile

`timescale 1ns / 1ns

module registerfile_tb;
  
  wire [31:0] rd0, rd1;     // output: read data 1 & 2
  reg [31:0] wdata;         // input: write data
  reg [4:0] ra0, ra1, wreg; // input: read address 1 & 2, write register
  reg rst, en;              // input: rest, enable
  reg clk;                  // clock
  
  // instantiate DUT (device under test)
  registerfile DUT(ra0, ra1, wreg, wdata, en, clk, rst, rd0, rd1);
  
  // generate a clock pulse 
  always
    #10 clk = ~clk;
    
  // set inputs
  initial begin
    $timeformat(-9, 1, " ns", 6);
    clk = 1'b0;
    rst = 1'b0;   // reset: 0
    en = 1'b1;    // enable: 1
    wdata = 32'b00000000000000000000000000000011; // 3
    
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
      wdata = 32'b00000000000000000000000000000101; // 5
      
    // reset the register
    @ (negedge clk)
      rst = 1'b1;
      
  end
  
  // display inputs and outputs
  always @ (wdata or en or rst)
    #1 $display("At t=%t rst=%b wdata=%b en=%b readdata0=%b readdata1",
                $time,   rst,   wdata,   en,   rd0,         rd1);
                
endmodule
      
