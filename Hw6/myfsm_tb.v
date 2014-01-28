`timescale 1 ns /100 ps 
// timeunit =1ns; precision=1/10ns;
module my_fsm_tb; 
reg clk, rst, x;
wire z;

/**** DESIGN TO SIMULATE (my_fsm) INSTANTIATION ****/
myfsm dut1(clk, rst, x, z);

/****RESET AND CLOCK SECTION****/
initial 
begin
clk=0; 
rst=0;
#1rst=1; /*The delay gives rst a posedge for sure.*/
#200 rst=0; //Deactivate reset after two clock cycles +1ns*/
end

always #50clk=~clk; /* 10MHz clock (50*1ns*2) with 50% duty-cycle */

/****SPECIFY THE INPUT WAVEFORM x ****/
initial begin
  #1 x=0;
  #400 x=1;
  $display("Output z: %b", z);
  #100 x=0;
  @(posedge clk) x=1;
  
   #1000  $finish;  //stop simulation
   //without this, it will not stop
end
endmodule
