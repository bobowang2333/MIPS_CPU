`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/06/30 11:00:49
// Design Name: 
// Module Name: ZeroExt16_32
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


module ZeroExt16_32(
        input [15:0] in,
        output [31:0] out
    );
    
    assign out[15:0] = in;
    assign out[31:16] = {16{1'b0}};
endmodule
