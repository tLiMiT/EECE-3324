// EECE3324 Computer Architecture
// Advanced Project
// Tim Liming

// Hazard Detection Unit

`timescale 1ns / 1ns

module HazardDetectUnit(FRegRs, DRegRt, FRegRt, DMemRead,
                        WritePC, FWrite, HazMuxSel);
  
  input [4:0] FRegRs, FRegRt, DRegRt;
  input DMemRead;
  output reg WritePC, FWrite, HazMuxSel;
  
  // initialize
  initial begin
    WritePC = 0;
    FWrite = 0;
    HazMuxSel = 0;
  end
  
  always @ (FRegRs or DRegRt or FRegRt or DMemRead) begin
    
    if (DMemRead && ((DRegRt == FRegRs) || (DRegRt == FRegRt)))
      // stall
      begin
        WritePC = 0;
        FWrite = 0;
        HazMuxSel = 1;
      end
    else
      // no stall
      begin
        WritePC = 1;
        FWrite = 1;
        HazMuxSel = 0;
      end
  end
  
endmodule