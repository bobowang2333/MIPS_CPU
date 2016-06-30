`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/06/30 11:02:41
// Design Name: 
// Module Name: ZeroExt16_32_tb
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


module ZeroExt16_32_tb(
    );
    reg [15:0] in;
    wire [31:0] out;
    
    ZeroExt16_32 z16_32(
        .in(in),
        .out(out)
    );
    
    initial begin
        #5;
        in = 16'h2312;
        #5;
        in = 16'hffff;
    end
endmodule
