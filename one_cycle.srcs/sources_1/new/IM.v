`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/06/29 22:40:35
// Design Name: 
// Module Name: IM
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


module IM(
    input [15:0] addr,
    output [31:0] data
    );
    
    parameter size = 1024;
    parameter FILE_PATH = "C:/UART/lab1/one_cycle/benchmark.txt";
    
    reg [31:0] mem [size-1:0];
    
    assign data = mem[addr];
    
    initial begin
        $readmemh(FILE_PATH, mem);
    end
endmodule
