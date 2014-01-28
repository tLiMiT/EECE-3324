// EECE3324 Computer Architecture
// Advanced Project
// Tim Liming

// 2-to-1 MUX  (5-bit inputs)

`timescale 1ns / 1ns

module mux2to1_5bit(i0, i1, sel, out);
  
  input [4:0] i0, i1;   // input 1 and 2
  input sel;            // select bit
  output reg [4:0] out; // output
  
  // loop for mux operation
  always @ (sel or i0 or i1)
  begin
    case(sel)
      // if sel is 0...
      1'b0: begin
        // select input 1
        out <= i0;
      end
      // if sel is 1...
      1'b1: begin
        // select input 2
        out <= i1;
      end
    endcase
  end
  
endmodule

