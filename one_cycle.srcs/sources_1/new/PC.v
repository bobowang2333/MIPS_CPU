`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/06/29 21:58:54
// Design Name: 
// Module Name: PC
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


module PC(
    input [15:0] NextPC,
    input reset,
    input clk,
    output reg [15:0]  Out
    );
    
    always@(posedge clk or negedge reset)
    begin
        if(~reset)
        begin
            Out <= 0;
        end
        else
        begin
            Out <= NextPC;
        end
    end
endmodule
