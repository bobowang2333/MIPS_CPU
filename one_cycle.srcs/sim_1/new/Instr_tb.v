`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/06/30 00:37:24
// Design Name: 
// Module Name: Instr_tb
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


module Instr_tb(
    );
    reg [31:0] instr;
    wire [5:0] op0_5;
    wire [5:0] op26_31;
    wire [4:0] rt;
    wire [4:0] rs;
    wire [4:0] rd;
    wire [25:0] addr;
    wire [15:0] imm;
    
    Instr_Splitter instr_split(
        .instr(instr),
        .op0_5(op0_5),
        .op26_31(op26_31),
        .rt(rt),
        .rs(rs),
        .rd(rd),
        .addr(addr),
        .imm(imm)
    );
    
    initial begin
    #5;
    instr = 32'h2001_0224;
    end
    
endmodule
