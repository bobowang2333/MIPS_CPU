`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/06/29 22:08:43
// Design Name: 
// Module Name: PC_tb
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


module PC_tb(
    );
    reg clk;
    reg  reset;
    reg [15:0] NextPC;
    wire [15:0] Out;
    
    PC pc(
    .clk(clk),
    .reset(reset),
    .NextPC(NextPC),
    .Out(Out)
    );
    
    always begin
    #5 clk <= ~clk;
    end
    
    
    initial begin
    clk = 0;
    reset = 1;
    #5;
    reset = 0;
    NextPC = 10;
    #5;
    reset = 1;
    NextPC = 32;
    #5;
    NextPC = 256;
    end
    
endmodule
