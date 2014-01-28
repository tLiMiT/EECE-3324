// EECE3324 Computer Architecture
// Basic Project
// Tim Liming & Wing Tung Yuen

// cpu module
`timescale 1ns/1ns

module CPU(clk, rst, rstPC);
  input clk;
  input rst, rstPC;  
  
  // Wires
  wire [31:0] PCin, PCout, PC4, Jaddr, PCmux1out;
  wire [31:0] Instruction;
  wire [31:0] Reg_read_data1, Reg_read_data2, Reg_Write_Data;
  wire [31:0] mux1out, ALUresult, Mem_read_data;
  wire [31:0] SignExOut, SL2out, PCaddOut;
  wire [25:0] SL2input;
  wire [15:0] SignExIn;
  wire [5:0] ctlInput, ALUcntrl;
  wire [4:0] Reg_Write_reg, ReadReg1, ReadReg2, WrRMuxIn;
  wire [3:0] ALUctrlop;
  wire Zero;
  
  // Control Signals
  wire RegDst;
  wire Jump;
  wire Branch;
  wire MemRead;
  wire MemtoReg;
  wire [1:0] ALUOp;
  wire MemWrite;
  wire ALUSrc;
  wire RegWrite;
  wire addi;
  wire HLT;
  
  // Decode Instruction
  assign SL2input = Instruction[25:0];
  assign ctlInput = Instruction[31:26];
  assign ReadReg1 = Instruction[25:21];
  assign ReadReg2 = Instruction[20:16];
  assign WrRMuxIn = Instruction[15:11];
  assign SignExIn = Instruction[15:0];
  assign ALUcntrl = Instruction[5:0];
  
  assign PCmux1sel = Branch & Zero;
  
  // Connect Modules
  ProgramCounter PC(PCin, clk, rstPC, PCout);
  add4 Add4(PCout, PC4);
  ShiftLeft2PC slPC(SL2input, PC4, Jaddr);
  mux2to1 PCMux1(PC4, PCaddOut, PCmux1sel, PCmux1out);
  mux2to1 PCMux2(PCmux1out, Jaddr, Jump, PCin);
  control_unit CtrlU(ctlInput, rst, RegDst, Jump, Branch, MemRead, MemtoReg, 
                     MemWrite, ALUSrc, RegWrite, ALUOp, addi, HLT);
  SignExtend SE(SignExIn, SignExOut);
  ShiftLeft2 SL2(SignExOut, SL2out);
  mux2to1_5bit MX0(ReadReg2, WrRMuxIn, RegDst, Reg_Write_reg);
  registerfile Registers(ReadReg1, ReadReg2, Reg_Write_reg, Reg_Write_Data, 
                         RegWrite, clk, rst, Reg_read_data1, Reg_read_data2);
  ALU_control_unit ALUctrl(ALUOp, addi, ALUcntrl, ALUctrlop);
  mux2to1 MX1(Reg_read_data2, SignExOut, ALUSrc, mux1out);
  ALU alu(ALUctrlop, Reg_read_data1, mux1out, ALUresult, Zero);
  adder add(PC4, SL2out, PCaddOut);
  Memory MEM(PCout, Instruction, ALUresult, Reg_read_data2,
             MemRead, MemWrite, Mem_read_data);
  mux2to1 MX2(ALUresult, Mem_read_data, MemtoReg, Reg_Write_Data);
  
endmodule