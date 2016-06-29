`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/06/29 00:01:53
// Design Name: 
// Module Name: ClkDiv_tb
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


module ClkDiv_tb(
    );
    reg clk;
    reg reset;
    wire ClkOutput;
     ClkDiv ClkD(
       .clk(clk),
       .reset(reset),
       .ClkOutput(ClkOutput)
       );
    
    always begin
        #1 clk = ~clk;
    end
    
    initial begin
        clk = 0;
        reset = 1;
        #20
        reset = 0;
        #20
        reset = 1;
    end
endmodule
