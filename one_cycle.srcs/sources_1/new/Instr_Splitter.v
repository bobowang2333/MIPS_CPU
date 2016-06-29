`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/06/30 00:31:42
// Design Name: 
// Module Name: Instr_Splitter
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


module Instr_Splitter(
        input [31:0] instr,
        output [5:0] op0_5,
        output [5:0] op26_31,
        output [4:0] rt,
        output [4:0] rs,
        output [4:0] rd,
        output [25:0] addr,
        output [15:0] imm   
    );
    
    assign op0_5 = instr[5:0];
    assign op26_31 = instr[31:26];
    assign rs = instr[25:21];
    assign rt = instr[20:16];
    assign rd = instr[10:6];
    assign addr = instr[25:0];
    assign imm = instr[15:0];
endmodule
