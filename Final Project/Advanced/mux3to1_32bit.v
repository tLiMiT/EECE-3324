// EECE3324 Computer Architecture
// Advanced Project
// Tim Liming

// 3-to-1 MUX  (32-bit inputs)

`timescale 1ns / 1ns

module mux3to1_32bit(i0, i1, i2, sel, out);
  
  input [31:0] i0, i1, i2;  // input 1 and 2
  input [1:0] sel;          // select bits
  output reg [31:0] out;    // output
  
  // loop for mux operation
  always @ (sel or i0 or i1 or i2) begin
    case(sel)
      // if sel is 0...
      2'b00: begin
        // select input 0
        out <= i0;
      end
      
      // if sel is 1...
      2'b01: begin
        // select input 1
        out <= i1;
      end
      
      // if sel is 2...
      2'b10: begin
        // select input 2
        out <= i2;
      end
    endcase
  end

endmodule