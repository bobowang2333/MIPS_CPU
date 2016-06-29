`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/06/29 23:58:55
// Design Name: 
// Module Name: DM_tb
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


module DM_tb(
    );
    reg [15:0] addr;
    reg we;
    reg clk;
    reg [31:0] DataInput;
    wire [31:0] DataOut;
    
    DM dm(
        .addr(addr),
        .we(we),
        .clk(clk),
        .DataInput(DataInput),
        .DataOut(DataOut)
        );
       
    always begin
        #1 clk = ~clk;
    end
    
    initial begin
        clk = 0;
        we = 0;
        #5;
        DataInput = 12;
        addr = 10;
        #5;
        we = 1;
        #5;
        we = 0;
    end
    
endmodule
