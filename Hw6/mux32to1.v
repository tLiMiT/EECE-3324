// EECE3324 Computer Architecture
// Hw 6
// Tim Liming

// 32-to-1 MUX  (32-bit inputs)

`timescale 1ns / 1ps

module mux32to1(i0,i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,
                i12,i13,i14,i15,i16,i17,i18,i19,i20,i21,
                i22,i23,i24,i25,i26,i27,i28,i29,i30,i31,
                sel, out)
                
  input [31:0] i0,i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,
                i12,i13,i14,i15,i16,i17,i18,i19,i20,i21,
                i22,i23,i24,i25,i26,i27,i28,i29,i30,i31;
  input [4:0] sel;
  output [31:0] out;
  
  reg [31:0] out;
  
  // declare select bits
  parameter s0 = 5b'00000;
  parameter s1 = 5b'00001;
  parameter s2 = 5b'00010;
  parameter s3 = 5b'00011;
  parameter s4 = 5b'00100;
  parameter s5 = 5b'00101;
  parameter s6 = 5b'00110;
  parameter s7 = 5b'00111;
  parameter s8 = 5b'01000;
  parameter s9 = 5b'01001;
  parameter s10 = 5b'01010;
  parameter s11 = 5b'01011;
  parameter s12 = 5b'01100;
  parameter s13 = 5b'01101;
  parameter s14 = 5b'01110;
  parameter s15 = 5b'01111;
  parameter s16 = 5b'10000;
  parameter s17 = 5b'10001;
  parameter s18 = 5b'10010;
  parameter s19 = 5b'10011;
  parameter s20 = 5b'10100;
  parameter s21 = 5b'10101;
  parameter s22 = 5b'10110;
  parameter s23 = 5b'10111;
  parameter s24 = 5b'11000;
  parameter s25 = 5b'11001;
  parameter s26 = 5b'11010;
  parameter s27 = 5b'11011;
  parameter s28 = 5b'11100;
  parameter s29 = 5b'11101;
  parameter s30 = 5b'11110;
  parameter s31 = 5b'11111;
  
  always @ (sel or i0 or i1 or i2 or i3 or i4 or i5 or i6 or i7 or i8 or i9 or i10 or i11
            or i12 or i13 or i14 or i15 or i16 or i17 or i18 or i19 or i20 or i21
            or i22 or i23 or i24 or i25 or i26 or i27 or i28 or i29 or i30 or i31)
  begin
    case(sel)
      s0: begin out <= i0; end
      s1: begin out <= i1; end
      s2: begin out <= i2; end
      s3: begin out <= i3; end
      s4: begin out <= i4; end
      s5: begin out <= i5; end
      s6: begin out <= i6; end
      s7: begin out <= i7; end
      s8: begin out <= i8; end
      s9: begin out <= i9; end
      s10: begin out <= i10; end
      s11: begin out <= i11; end
      s12: begin out <= i12; end
      s13: begin out <= i13; end
      s14: begin out <= i14; end
      s15: begin out <= i15; end
      s16: begin out <= i16; end
      s17: begin out <= i17; end
      s18: begin out <= i18; end
      s19: begin out <= i19; end
      s20: begin out <= i20; end
      s21: begin out <= i21; end
      s22: begin out <= i22; end
      s23: begin out <= i23; end
      s24: begin out <= i24; end
      s25: begin out <= i25; end
      s26: begin out <= i26; end
      s27: begin out <= i27; end
      s28: begin out <= i28; end
      s29: begin out <= i29; end
      s30: begin out <= i30; end
      s31: begin out <= i31; end
    endcase
  end
  
endmodule