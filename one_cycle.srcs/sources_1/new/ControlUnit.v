`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/06/30 11:08:46
// Design Name: 
// Module Name: ControlUnit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ControlUnit(
    input [31:0] instr,
    output [23:0] Signal
    );
     
     wire [5:0] op0_5;
     wire [5:0] op26_31;
     wire [4:0] rt;
     wire [4:0] rs;
     wire [4:0] rd;
     wire [25:0] addr;
     wire [15:0] imm; 
    //instruction split
   Instr_Splitter InsSplit(
          .instr(instr),
          .op0_5(op0_5),
          .op26_31(op26_31),
          .rt(rt),
          .rs(rs),
          .rd(rd),
          .addr(addr),
          .imm(imm)   
   ); 
   wire op0 = op0_5[0];
   wire op1 = op0_5[1];
   wire op2 = op0_5[2];
   wire op3 = op0_5[3];
   wire op4 = op0_5[4];
   wire op5 = op0_5[5];
   
   wire op26 = op26_31[0];
   wire op27 = op26_31[1];
   wire op28 = op26_31[2];
   wire op29 = op26_31[3];
   wire op30 = op26_31[4];
   wire op31 = op26_31[5];
   
   parameter RegWriteData0 = 0;
   parameter RegWriteData1 = 1;
   parameter MemWrite = 2;
   parameter Branch0 = 3;
   parameter Branch1 = 4;
   parameter ALUControl0 = 5;
   parameter ALUControl1 = 6;
   parameter ALUControl2 = 7;
   parameter ALUControl3 = 8;
   parameter ALU_D1_0 = 9;
   parameter ALU_D1_1 = 10;
   parameter ALU_D2_0 = 11;
   parameter ALU_D2_1 = 12;
   parameter RF_R1_0 = 13;
   parameter RF_R1_1 = 14;
   parameter RF_R2 = 15;
   parameter ext_0 = 16;
   parameter ext_1 = 17;
   parameter RegWrite = 18;
   parameter ClkEn = 19;
   parameter beq_0 = 20;
   parameter beq_1 = 21;
   parameter RF_W_0 = 22;
   parameter RF_W_1 = 23;
   
   assign Signal[RegWriteData0] = op26 & op27 & ~op28 & ~op29 & ~op30 & op31;
   assign Signal[RegWriteData1] = (~op26 & ~op27 & ~op28 & ~op29 & ~op30 & op31);
   assign Signal[MemWrite] = (op26 & op27 & ~op28 & op29 & ~op30 & op31);
   assign Signal[Branch0] = (~op26 & ~op27 & op28 & ~op29 & ~op30 & ~op31) | (op26 & ~op27 & op28 & ~op29 & ~op30 & ~op31) | (~op0 & ~op1 & ~op2 & op3 & ~op4 & ~op5 & ~op26 & ~op27 & ~op28 & ~op29 & ~op30 & ~op31);
   assign Signal[Branch1] = (op26 & op27 & ~op28 & ~op29 & ~op30 & ~op31) | (~op26 & op27 & ~op28 & ~op29 & ~op30 & ~op31) | (~op0 & ~op1 & ~op2 & op3 & ~op4 & ~op5 & ~op26 & ~op27 & ~op28 & ~op29 & ~op30 & ~op31);
   assign Signal[ALUControl0] = (~op0 & ~op1 & ~op2 & ~op3 & ~op4 & op5 & ~op26 & ~op27 & ~op28 & ~op29 & ~op30 & ~op31) | (~op26 & ~op27 & ~op28 & op29 & ~op30 & ~op31) | (op0 & ~op1 & ~op2 & ~op3 & ~op4 & op5 & ~op26 & ~op27 & ~op28 & ~op29 & ~op30 & ~op31) | (~op0 & ~op1 & op2 & ~op3 & ~op4 & op5 & ~op26 & ~op27 & ~op28 & ~op29 & ~op30 & ~op31) | (~op26 & ~op27 & op28 & op29 & ~op30 & ~op31) | (op0 & op1 & ~op2 & ~op3 & ~op4 & ~op5 & ~op26 & ~op27 & ~op28 & ~op29 & ~op30 & ~op31) | (op26 & op27 & ~op28 & ~op29 & ~op30 & op31) | (op26 & op27 & ~op28 & op29 & ~op30 & op31) | (~op0 & op1 & ~op2 & op3 & ~op4 & op5 & ~op26 & ~op27 & ~op28 & ~op29 & ~op30 & ~op31) | (~op26 & op27 & ~op28 & op29 & ~op30 & ~op31) | (op26 & op27 & ~op28 & ~op29 & ~op30 & ~op31) | (op26 & ~op27 & ~op28 & op29 & ~op30 & ~op31) | (op26 & ~op27 & ~op28 & op29 & ~op30 & ~op31);
   assign Signal[ALUControl1] = (~op0 & ~op1 & op2 & ~op3 & ~op4 & op5 & ~op26 & ~op27 & ~op28 & ~op29 & ~op30 & ~op31) | (~op26 & ~op27 & op28 & op29 & ~op30 & ~op31) | (~op0 & op1 & ~op2 & ~op3 & ~op4 & ~op5 & ~op26 & ~op27 & ~op28 & ~op29 & ~op30 & ~op31) | (~op0 & op1 & ~op2 & ~op3 & ~op4 & op5 & ~op26 & ~op27 & ~op28 & ~op29 & ~op30 & ~op31) | (op0 & op1 & op2 & ~op3 & ~op4 & op5 & ~op26 & ~op27 & ~op28 & ~op29 & ~op30 & ~op31) | (~op26 & ~op27 & op28 & ~op29 & ~op30 & ~op31) | (op26 & ~op27 & op28 & ~op29 & ~op30 & ~op31) | (~op0 & op1 & ~op2 & op3 & ~op4 & op5 & ~op26 & ~op27 & ~op28 & ~op29 & ~op30 & ~op31) | (~op26 & op27 & ~op28 & op29 & ~op30 & ~op31);
   assign Signal[ALUControl2] = (~op0 & ~op1 & ~op2 & ~op3 & ~op4 & op5 & ~op26 & ~op27 & ~op28 & ~op29 & ~op30 & ~op31) | (op26 & ~op27 & ~op28 & op29 & ~op30 & ~op31) | (~op26 & ~op27 & ~op28 & op29 & ~op30 & ~op31) | (op0 & ~op1 & ~op2 & ~op3 & ~op4 & op5 & ~op26 & ~op27 & ~op28 & ~op29 & ~op30 & ~op31) | (~op0 & ~op1 & op2 & ~op3 & ~op4 & op5 & ~op26 & ~op27 & ~op28 & ~op29 & ~op30 & ~op31) | (~op26 & ~op27 & op28 & op29 & ~op30 & ~op31) | (~op0 & op1 & ~op2 & ~op3 & ~op4 & op5 & ~op26 & ~op27 & ~op28 & ~op29 & ~op30 & ~op31) | (op26 & op27 & ~op28 & ~op29 & ~op30 & op31) | (op26 & op27 & ~op28 & op29 & ~op30 & op31) | (~op26 & ~op27 & op28 & ~op29 & ~op30 & ~op31) | (op26 & ~op27 & op28 & ~op29 & ~op30 & ~op31) | (op0 & op1 & ~op2 & op3 & ~op4 & op5) | (op26 & op27 & ~op28 & ~op29 & ~op30 & ~op31);
   assign Signal[ALUControl3] = (op0 & ~op1 & op2 & ~op3 & ~op4 & op5 & ~op26 & ~op27 & ~op28 & ~op29 & ~op30 & ~op31) | (op26 & ~op27 & op28 & op29 & ~op30 & ~op31) | (op0 & op1 & op2 & ~op3 & ~op4 & op5 & ~op26 & ~op27 & ~op28 & ~op29 & ~op30 & ~op31) | (~op0 & op1 & ~op2 & op3 & ~op4 & op5 & ~op26 & ~op27 & ~op28 & ~op29 & ~op30 & ~op31) | (~op26 & op27 & ~op28 & op29 & ~op30 & ~op31) | (op0 & op1 & ~op2 & op3 & ~op4 & op5 & ~op26 & ~op27 & ~op28 & ~op29 & ~op30 & ~op31);
   assign Signal[ALU_D1_0] = (~op0 & ~op1 & ~op2 & ~op3 & ~op4 & ~op5 & ~op26 & ~op27 & ~op28 & ~op29 & ~op30 & ~op31) | (op0 & op1 & ~op2 & ~op3 & ~op4 & ~op5 & ~op26 & ~op27 & ~op28 & ~op29 & ~op30 & ~op31) | (~op0 & op1 & ~op2 & ~op3 & ~op4 & ~op5 & ~op26 & ~op27 & ~op28 & ~op29 & ~op30 & ~op31) | (~op0 & ~op1 & op2 & op3 & ~op4 & ~op5 & ~op26 & ~op27 & ~op28 & ~op29 & ~op30 & ~op31);
   assign Signal[ALU_D1_1] = (op26 & op27 & ~op28 & ~op29 & ~op30 & ~op31) | (~op0 & ~op1 & op2 & op3 & ~op4 & ~op5 & ~op26 & ~op27 & ~op28 & ~op29 & ~op30 & ~op31);
   assign Signal[ALU_D2_0] = (~op26 & ~op27 & ~op28 & op29 & ~op30 & ~op31) | (~op26 & ~op27 & op28 & op29 & ~op30 & ~op31) | (~op0 & ~op1 & ~op2 & ~op3 & ~op4 & ~op5 & ~op26 & ~op27 & ~op28 & ~op29 & ~op30 & ~op31) | (op0 & op1 & ~op2 & ~op3 & ~op4 & ~op5 & ~op26 & ~op27 & ~op28 & ~op29 & ~op30 & ~op31) | (~op0 & op1 & ~op2 & ~op3 & ~op4 & ~op5 & ~op26 & ~op27 & ~op28 & ~op29 & ~op30 & ~op31) | (op26 & ~op27 & op28 & op29 & ~op30 & ~op31) | (op26 & op27 & ~op28 & ~op29 & ~op30 & op31) | (op26 & op27 & ~op28 & op29 & ~op30 & op31) | (~op26 & op27 & ~op28 & op29 & ~op30 & ~op31) | (op0 & op1 & ~op2 & op3 & ~op4 & op5) | (~op0 & ~op1 & op2 & op3 & ~op4 & ~op5 & ~op26 & ~op27 & ~op28 & ~op29 & ~op30 & ~op31) | (op26 & ~op27 & ~op28 & op29 & ~op30 & ~op31);
   assign Signal[ALU_D2_1] = (op26 & op27 & ~op28 & ~op29 & ~op30 & ~op31) | (~op0 & ~op1 & op2 & op3 & ~op4 & ~op5 & ~op26 & ~op27 & ~op28 & ~op29 & ~op30 & ~op31);
   assign Signal[RF_R1_0] = (~op0 & ~op1 & op2 & op3 & ~op4 & ~op5 & ~op26 & ~op27 & ~op28 & ~op29 & ~op30 & ~op31) | (~op26 & ~op27 & ~op28 & ~op29 & op30 & ~op31);
   assign Signal[RF_R1_1] = (~op26 & ~op27 & ~op28 & ~op29 & op30 & ~op31);
   assign Signal[RF_R2] = (~op0 & ~op1 & op2 & op3 & ~op4 & ~op5 & ~op26 & ~op27 & ~op28 & ~op29 & ~op30 & ~op31);
   assign Signal[ext_0] = (~op26 & ~op27 & ~op28 & op29 & ~op30 & ~op31) | (~op0 & ~op1 & ~op2 & ~op3 & ~op4 & ~op5 & ~op26 & ~op27 & ~op28 & ~op29 & ~op30 & ~op31) | (op0 & op1 & ~op2 & ~op3 & ~op4 & ~op5 & ~op26 & ~op27 & ~op28 & ~op29 & ~op30 & ~op31) | (~op0 & op1 & ~op2 & ~op3 & ~op4 & ~op5 & ~op26 & ~op27 & ~op28 & ~op29 & ~op30 & ~op31) | (op26 & op27 & ~op28 & ~op29 & ~op30 & op31) | (op26 & op27 & ~op28 & op29 & ~op30 & op31) | (~op26 & ~op27 & op28 & ~op29 & ~op30 & ~op31) | (op26 & ~op27 & op28 & ~op29 & ~op30 & ~op31) | (~op26 & op27 & ~op28 & op29 & ~op30 & ~op31) | (op0 & op1 & ~op2 & op3 & ~op4 & op5) | (op26 & ~op27 & ~op28 & op29 & ~op30 & ~op31);
   assign Signal[ext_1] = (~op26 & ~op27 & op28 & op29 & ~op30 & ~op31) | (~op0 & ~op1 & ~op2 & ~op3 & ~op4 & ~op5 & ~op26 & ~op27 & ~op28 & ~op29 & ~op30 & ~op31) | (op0 & op1 & ~op2 & ~op3 & ~op4 & ~op5 & ~op26 & ~op27 & ~op28 & ~op29 & ~op30 & ~op31) | (~op0 & op1 & ~op2 & ~op3 & ~op4 & ~op5 & ~op26 & ~op27 & ~op28 & ~op29 & ~op30 & ~op31) | (op26 & ~op27 & op28 & op29 & ~op30 & ~op31);
   assign Signal[RegWrite] = (op26 & op27 & ~op28 & op29 & ~op30 & op31) | (~op26 & ~op27 & op28 & ~op29 & ~op30 & ~op31) | (op26 & ~op27 & op28 & ~op29 & ~op30 & ~op31) | (~op26 & op27 & ~op28 & ~op29 & ~op30 & ~op31) | (~op0 & ~op1 & ~op2 & op3 & ~op4 & ~op5 & ~op26 & ~op27 & ~op28 & ~op29 & ~op30 & ~op31) | (~op0 & ~op1 & op2 & op3 & ~op4 & ~op5 & ~op26 & ~op27 & ~op28 & ~op29 & ~op30 & ~op31);
   assign Signal[ClkEn] = (~op0 & ~op1 & op2 & op3 & ~op4 & ~op5 & ~op26 & ~op27 & ~op28 & ~op29 & ~op30 & ~op31);
   assign Signal[beq_0] = (~op26 & ~op27 & op28 & ~op29 & ~op30 & ~op31);
   assign Signal[beq_1] = (op26 & ~op27 & op28 & ~op29 & ~op30 & ~op31);
   assign Signal[RF_W_0] = (~op26 & ~op27 & ~op28 & op29 & ~op30 & ~op31) | (~op26 & ~op27 & op28 & op29 & ~op30 & ~op31) | (op26 & ~op27 & op28 & op29 & ~op30 & ~op31) | (op26 & op27 & ~op28 & ~op29 & ~op30 & op31) | (~op26 & op27 & ~op28 & op29 & ~op30 & ~op31) | (~op26 & ~op27 & ~op28 & ~op29 & op30 & ~op31) | (op26 & ~op27 & ~op28 & op29 & ~op30 & ~op31) | (~op26 & ~op27 & ~op28 & ~op29 & op30 & ~op31);
   assign Signal[RF_W_1] = (op26 & op27 & ~op28 & ~op29 & ~op30 & ~op31);
    
endmodule
