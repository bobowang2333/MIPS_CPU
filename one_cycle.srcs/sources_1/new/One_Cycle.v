`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/06/30 17:36:35
// Design Name: 
// Module Name: One_Cycle
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


module One_Cycle(
        input clk,
        input reset,
        output SyscallDisplay,
        output ClkEn,
        output RF_D2
    );
    
    parameter Cycle = 781250;
    ClkDiv #(Cycle) SysClk(
        .clk(clk),
        .reset(reset),
        .ClkOutput(ClkCycle)
    );
    
    
    wire [15:0] NextPC;
    wire reset;
    wire [15:0] Out;
    PC pc(
        .NextPC(NextPC),
        .reset(reset),
        .clk(clk),
        .Out(Out)
    );
endmodule
