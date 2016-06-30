`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/06/30 17:27:53
// Design Name: 
// Module Name: HexDigit_tb
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


module HexDigit_tb(
    );
    
    reg [3:0] in;
    wire [7:0] out;
    
    HexDigit hexdigit(
        .in(in),
        .out(out)
    );
endmodule
