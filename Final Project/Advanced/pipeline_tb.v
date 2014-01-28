// EECE3324 Computer Architecture
// Advanced Project
// Tim Liming

// Testbench: Pipeline processor

`timescale 1ns / 1ns

module pipeline_tb;
  
  reg clk;  // clock
  reg rst;  // reset
  
  integer cycles;
  
  // instantiate DUT (device under test)
  pipeline DUT(clk, rst);
  
  initial begin
    $timeformat(-9, 1, " ns", 6);
    
    clk = 1'b0;
    
    cycles = 0;
    
    rst = 1;
    #10 rst = 0;
  end
  
  // generate a clock pulse
  always #10 clk = ~clk;
  
  always @ (posedge clk) begin
    if (!rst)
      cycles = cycles + 1;
  end
  
  // Display data
  always #2000 $display("Total # of cycles: %d \n", cycles);
  //always #2000 $display("Total # of instructions: %d \n", instrs);
  //always #2000 $display("CPI: %d \n", cycles/instrs)
  
  always #2000 $display("Register file contents: \n");
  always #2000 $display("R0: %h R1: %h \n", DUT.Registers.registers[0], DUT.Registers.registers[1]);
  always #2000 $display("R2: %h R3: %h \n", DUT.Registers.registers[2], DUT.Registers.registers[3]);
  always #2000 $display("R4: %h R5: %h \n", DUT.Registers.registers[4], DUT.Registers.registers[5]);
  always #2000 $display("R6: %h R7: %h \n", DUT.Registers.registers[6], DUT.Registers.registers[7]);
  always #2000 $display("R8: %h R9: %h \n", DUT.Registers.registers[8], DUT.Registers.registers[9]);
  always #2000 $display("R10: %h R11: %h \n", DUT.Registers.registers[10], DUT.Registers.registers[11]);
  always #2000 $display("R12: %h R13: %h \n", DUT.Registers.registers[12], DUT.Registers.registers[13]);
  always #2000 $display("R14: %h R15: %h \n", DUT.Registers.registers[14], DUT.Registers.registers[15]);
  always #2000 $display("R16: %h R17: %h \n", DUT.Registers.registers[16], DUT.Registers.registers[17]);
  always #2000 $display("R18: %h R19: %h \n", DUT.Registers.registers[18], DUT.Registers.registers[19]);
  always #2000 $display("R20: %h R21: %h \n", DUT.Registers.registers[20], DUT.Registers.registers[21]);
  always #2000 $display("R22: %h R23: %h \n", DUT.Registers.registers[22], DUT.Registers.registers[23]);
  always #2000 $display("R24: %h R25: %h \n", DUT.Registers.registers[24], DUT.Registers.registers[25]);
  always #2000 $display("R26: %h R27: %h \n", DUT.Registers.registers[26], DUT.Registers.registers[27]);
  always #2000 $display("R28: %h R29: %h \n", DUT.Registers.registers[28], DUT.Registers.registers[29]);
  always #2000 $display("R30: %h R31: %h \n", DUT.Registers.registers[30], DUT.Registers.registers[31]);
endmodule
