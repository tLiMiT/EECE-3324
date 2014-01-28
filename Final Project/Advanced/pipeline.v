// EECE3324 Computer Architecture
// Advanced Project
// Tim Liming

// Pipeline processor

`timescale 1ns / 1ns

module pipeline(clk, rst);
  
  input clk, rst;
  
  // Wires
  wire [31:0] PCin, PCout, PC4, Jaddr, PCmux1out;
  wire [31:0] Instruction, InstructionOut, DPC4;
  wire [31:0] WriteData, DRD1, DRD2, XRD1, XRD2, ALUA, ALUB;
  wire [31:0] mux1out, ALUresult, MReadData, MWriteData;
  wire [31:0] SignExOut, XSEout, SL2out, PCaddOut;
  wire [31:0] MaddiOut, XaddiOut, Maddress, Xadd4out;
  wire [31:0] WReadData, Waddress, XALUout, randomVar;
  wire [25:0] SL2input;
  wire [15:0] SignExIn;
  wire [9:0] ctrlMuxIn, ctrlMuxOut;
  wire [5:0] ctlInput, ALUcntrl;
  wire [4:0] ReadReg1, ReadReg2, XWriteReg, MWriteReg, WWriteReg;
  wire [4:0] FRegRs, FRegRt, FRegRd, DRegRs, DRegRt, DRegRd;
  wire [3:0] ALUctrlop;
  wire [1:0] ForwardA, ForwardB;
  wire Xzero, Mzero;
  
  // Control Signals
  wire IDRegDst, DXRegDst, EXRegDst;
  wire IDBranch, DXBranch, EXBranch, MBranch;
  wire IDMemRead, DXMemRead, EXMemRead, MMemRead;
  wire IDMemtoReg, DXMemtoReg, EXMemtoReg, MMemtoReg, WMemtoReg;
  wire [1:0] IDALUop, DXALUop, EXALUop;
  wire IDMemWrite, DXMemWrite, EXMemWrite, MMemWrite;
  wire IDALUsrc, DXALUsrc, EXALUsrc;
  wire IDRegWrite, DXRegWrite, EXRegWrite, MRegWrite, WRegWrite;
  wire IDaddi, DXaddi, EXaddi, Jump, HLT;
  wire hazFwrite, hazPCwrite, ctrlMuxSel;
  
  // Decode Instruction
  assign SL2input = Instruction[25:0];
  assign ctlInput = Instruction[31:26];
  assign ReadReg1 = Instruction[25:21];
  assign ReadReg2 = Instruction[20:16];
  assign WrRMuxIn = Instruction[15:11];
  assign SignExIn = Instruction[15:0];
  assign ALUcntrl = Instruction[5:0];
  
  assign FRegRs = Instruction[25:21];
  assign FRegRt = Instruction[20:16];
  assign FRegRd = Instruction[15:11];
  
  // Other assigns
  assign PCsel = MBranch & Mzero;
  assign ALUcntrl = XSEout[5:0];
  assign ctrlMuxIn = {IDRegDst, IDALUsrc, IDMemtoReg, IDRegWrite,
                      IDMemRead, IDMemWrite, IDBranch, IDALUop,
                      IDaddi};
  assign ctrlMuxOut = {DXRegDst, DXALUsrc, DXMemtoReg, DXRegWrite,
                       DXMemRead, DXMemWrite, DXBranch, DXALUop,
                       DXaddi};
  
  
  /****** Instruction Fetch (F) *************************************/
  ProgramCounter PC(PCin, clk, rst, PCout);
  add4 ADD4(PCout, PC4);
  mux2to1 FMUX1(PC4, MaddiOut, PCsel, PCmux1out);
  mux2to1 FMUX2(PCmux1out, Jaddr, Jump, PCin);
  ShiftLeft2PC SL2PC(SL2input, PC4, Jaddr);
  /******************************************************************/
  
  //===== IF/ID Register ===========================================//
  IF_ID IFID(Instruction, PC4, hazFwrite, clk, rst, 
             InstructionOut, DPC4);
  //================================================================//
  
  /****** Instruction Decode (D) ************************************/
  control_unit CtrlU(ctlInput, rst, IDRegDst, Jump, IDBranch, 
                     IDMemRead, IDMemtoReg, IDMemWrite, IDALUsrc, 
                     IDRegWrite, IDALUop, addi, HLT);
  SignExtend SE(SignExIn, SignExOut);
  ShiftLeft2 SL2(SignExOut, SL2out);
  registerfile Registers(ReadReg1, ReadReg2, WWriteReg, WriteData,
                         WRegWrite, clk, rst, DRD1, DRD2);
  HazardDetectUnit HDU(FRegRs, DRegRt, FRegRt, EXMemRead, 
                       hazPCwrite, hazFwrite, ctrlMuxSel);
  ControlMux CMUX(ctrlMuxIn, ctrlMuxSel, ctrlMuxOut);
  /******************************************************************/
  
  //===== ID/EX Register ===========================================//
  ID_EX IDEX(PC4, DRD1, DRD2, SignExOut, FRegRs, FRegRt, FRegRd,
             DXALUop, DXRegWrite, DXMemtoReg, DXBranch, DXMemRead, 
             DXMemWrite, DXRegDst, DXALUsrc, DXaddi, clk, rst, 
             Xadd4out, XRD1, XRD2, XSEout, DRegRs, DRegRt, DRegRd, 
             EXALUop, EXRegWrite, EXMemtoReg, EXBranch, EXMemRead, 
             EXMemWrite, EXRegDst, EXALUsrc, EXaddi);
  //================================================================//
  
  /****** Execution (X) *********************************************/
  ALU_control_unit ALUctrl(EXALUop, EXaddi, ALUcntrl, ALUctrlop);
  ALU alu(ALUctrlop, ALUA, ALUB, XALUout, Xzero);
  adder add(Xadd4out, SL2out, XaddiOut);
  mux2to1_5bit MX5b(DRegRt, DRegRd, EXRegDst, XWriteReg);
  mux2to1 XMUX1(randomVar, XSEout, EXALUsrc, ALUB);
  ForwardingUnit FWD(DRegRs, DRegRt, MWriteReg, WWriteReg,
                     MRegWrite, WRegWrite, ForwardA, ForwardB);
  mux3to1_32bit MUX3FA(XRD1, Maddress, WriteData, ForwardA, ALUA);
  mux3to1_32bit MUX3FB(XRD2, Maddress, WriteData, ForwardB, 
                       randomVar);
  /******************************************************************/
  
  //===== EX/MEM Register ==========================================//
  EX_MEM EXMEM(XALUout, randomVar, XaddiOut, XWriteReg, EXRegWrite,
               EXMemtoReg, EXBranch, EXMemRead, EXMemWrite, Xzero,
               clk, rst, Maddress, MWriteData, MaddiOut, MWriteReg,
               MRegWrite, MMemtoReg, MBranch, MMemRead, MMemWrite,
               Mzero);
  //================================================================//
  
  /****** Read/Write Memory (M) *************************************/
  Memory MEM(PCout, InstructionOut, Maddress, MWriteData, MMemRead,
             MMemWrite, MReadData);
  /******************************************************************/
  
  //===== MEM/WB Register ==========================================//
  MEM_WB MEMWB(MReadData, Maddress, MWriteReg, MRegWrite, MMemtoReg,
               clk, rst, WReadData, Waddress, WWriteReg, WRegWrite,
               WMemtoReg);
  //================================================================//
  
  /****** Write Back (W) ********************************************/
  mux2to1 WMUX1(Waddress, WReadData, WMemtoReg, WriteData);
  /******************************************************************/
  
endmodule
