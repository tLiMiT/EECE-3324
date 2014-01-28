// EECE3324 Computer Architecture
// Advanced Project
// Tim Liming

// Forwarding Unit

`timescale 1ns / 1ns

module ForwardingUnit(DRegRs, DRegRt, XRegRd, MRegRd, XRegWrite, 
                      MRegWrite, ForwardA, ForwardB);
   
   input [4:0] DRegRs, DRegRt, XRegRd, MRegRd;
   input XRegWrite, MRegWrite;
   output reg [1:0] ForwardA, ForwardB;
   
   // initialize
   initial begin
     ForwardA = 2'b00;
     ForwardB = 2'b00;
   end
   
   always @ (DRegRs or DRegRt or XRegRd or MRegRd or 
             XRegWrite or MRegWrite)
     begin
       // ForwardA
       if (XRegWrite && (XRegRd != 5'b0) && (XRegRd == DRegRs))
         begin
           ForwardA <= 2'b10;
         end
       else if (MRegWrite && (MRegRd != 5'b0) && (MRegRd == DRegRs))
         begin
           ForwardA <= 2'b01;
         end
       else
         // Rs not forwarded
         begin
           ForwardA <= 2'b00;
         end
       
       // ForwardB
       if (XRegWrite && (XRegRd != 5'b0) && (XRegRd == DRegRt))
         begin
           ForwardB <= 2'b10;
         end
       else if (MRegWrite && (MRegRd != 5'b0) && (MRegRd == DRegRt))
         begin
           ForwardB <= 2'b01;
         end
       else
         // Rt not forwarded
         begin
           ForwardB <= 2'b00;
         end
     end
   
endmodule