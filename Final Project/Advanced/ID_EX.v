// EECE3324 Computer Architecture
// Advanced Project
// Tim Liming

// ID/EX Pipeline Register

`timescale 1ns / 1ns

module ID_EX(Dadd4out, DRD1, DRD2, DSEout, DRegRs, DRegRt, DRegRd, 
             DALUop, DRegWrite, DMemtoReg, DBranch, DMemRead, DMemWrite, 
             DRegDst, DALUsrc, Daddi, clk, rst, 
             Xadd4out, XRD1, XRD2, XSEout, XRegRs, XRegRt, XRegRd, 
             XALUop, XRegWrite, XMemtoReg, XBranch, XMemRead, XMemWrite, 
             XRegDst, XALUsrc, Xaddi);
  
  input [31:0] Dadd4out, DRD1, DRD2, DSEout;
  input [4:0] DRegRs, DRegRt, DRegRd;
  input [1:0] DALUop;
  input DRegWrite, DMemtoReg, DBranch, DMemRead, DMemWrite;
  input DRegDst, DALUsrc, Daddi;
  input clk, rst;
  output reg [31:0] Xadd4out, XRD1, XRD2, XSEout;
  output reg [4:0] XRegRs, XRegRt, XRegRd;
  output reg [1:0] XALUop;
  output reg XRegWrite, XMemtoReg, XBranch, XMemRead, XMemWrite;
  output reg XRegDst, XALUsrc, Xaddi;
  
  // initialize
  initial begin
    Xadd4out = 0;
    XRD1 = 0;
    XRD2 = 0;
    XSEout = 0;
    XRegRs = 0;
    XRegRt = 0;
    XRegRd = 0;
    XALUop = 2'b00;
    XRegWrite = 0;
    XMemtoReg = 0;
    XBranch = 0;
    XMemRead = 0;
    XMemWrite = 0;
    XRegDst = 0;
    XALUsrc = 0;
    Xaddi = 0;
  end
  
  // 
  always @ (posedge clk or posedge rst) begin
    if (!rst)
      begin
        Xadd4out <= Dadd4out;
        XRD1 <= DRD1;
        XRD2 <= DRD2;
        XSEout <= DSEout;
        XRegRs <= DRegRs;
        XRegRt <= DRegRt;
        XRegRd <= DRegRd;
        XALUop <= DALUop;
        XRegWrite <= DRegWrite;
        XMemtoReg <= DMemtoReg;
        XBranch <= DBranch;
        XMemRead <= DMemRead;
        XMemWrite <= DMemWrite;
        XRegDst <= DRegDst;
        XALUsrc <= DALUsrc;
        Xaddi <= Daddi;
      end
    else begin
      Xadd4out <= 0;
      XRD1 <= 0;
      XRD2 <= 0;
      XSEout <= 0;
      XRegRs <= 0;
      XRegRt <= 0;
      XRegRd <= 0;
      XALUop <= 2'b00;
      XRegWrite <= 0;
      XMemtoReg <= 0;
      XBranch <= 0;
      XMemRead <= 0;
      XMemWrite <= 0;
      XRegDst <= 0;
      XALUsrc <= 0;
      Xaddi <= 0;
    end
  end
  
endmodule
