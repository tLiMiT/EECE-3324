// EECE3324 Computer Architecture
// Hw 6
// Tim Liming

// Testbench for: 2-to-1 MUX  (32-bit inputs)

`timescale 1ns / 1ns

module mux2to1_tb;
  
  wire [31:0] muxout; // output
  reg [31:0] i0, i1;  // inputs
  reg sel;            // select bit
  reg clk;            // clock
  
  // instantiate DUT (device under test)
  mux2to1 DUT(i0, i1, sel, muxout);
  
  // generate a clock pulse 
  always
    #10 clk = ~clk;
    
  // set inputs
  initial begin
    $timeformat(-9, 1, " ns", 6);
    clk = 1'b0;
    i0 = 32'b00000000000000000000000000000011; // 3
    i1 = 32'b00000000000000000000000000000101; // 5
    sel = 1'b0;   // select 0
    
    // wait for next negative edge of clock to switch select bit
    @ (negedge clk)
      sel = 1'b1; // select 1
      
  end
  
  // display inputs and outputs
  always @ (i0 or i1 or sel)
    #1 $display("At t=%t sel=%b i0=%b i1=%b muxout=%b",
                $time,   sel,   i0,   i1,   muxout);
                
endmodule