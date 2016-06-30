`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/06/30 10:51:55
// Design Name: 
// Module Name: ZeroExtender
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


module ZeroExtender(
        input [4:0] in,
        output [31:0] out
    );
    
    assign out[4:0] = in;
    assign out[31:5] = {27{1'b0}};
endmodule
