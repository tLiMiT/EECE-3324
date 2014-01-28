// EECE3324 Computer Architecture
// Hw 6
// Tim Liming

// 5 to 32 bit decoder

`timescale 1ns / 1ps

module decoder5to32(i0,o0,o1,o2,o3,o4,o5,o6,o7,o8,o9,o10,o11,
                    o12,o13,o14,o15,o16,o17,o18,o19,o20,o21,
                    o22,o23,o24,o25,o26,o27,o28,o29,o30,o31);
  
  input [4:0] i0;
  output o0,o1,o2,o3,o4,o5,o6,o7,o8,o9,o10,o11,
          o12,o13,o14,o15,o16,o17,o18,o19,o20,o21,
          o22,o23,o24,o25,o26,o27,o28,o29,o30,o31;
  
  // declare input bits
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
  
  always @ (i0)
  begin
    case (i0)
      s0: begin o0 <= 1; end
      s1: begin o1 <= 1; end
      s2: begin o2 <= 1; end
      s3: begin o3 <= 1; end
      s4: begin o4 <= 1; end
      s5: begin o5 <= 1; end
      s6: begin o6 <= 1; end
      s7: begin o7 <= 1; end
      s8: begin o8 <= 1; end
      s9: begin o9 <= 1; end
      s10: begin o10 <= 1; end
      s11: begin o11 <= 1; end
      s12: begin o12 <= 1; end
      s13: begin o13 <= 1; end
      s14: begin o14 <= 1; end
      s15: begin o15 <= 1; end
      s16: begin o16 <= 1; end
      s17: begin o17 <= 1; end
      s18: begin o18 <= 1; end
      s19: begin o19 <= 1; end
      s20: begin o20 <= 1; end
      s21: begin o21 <= 1; end
      s22: begin o22 <= 1; end
      s23: begin o23 <= 1; end
      s24: begin o24 <= 1; end
      s25: begin o25 <= 1; end
      s26: begin o26 <= 1; end
      s27: begin o27 <= 1; end
      s28: begin o28 <= 1; end
      s29: begin o29 <= 1; end
      s30: begin o30 <= 1; end
      s31: begin o31 <= 1; end
    endcase
  end
  
endmodule