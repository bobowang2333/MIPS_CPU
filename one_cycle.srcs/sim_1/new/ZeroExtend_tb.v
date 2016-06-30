`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/06/30 10:56:42
// Design Name: 
// Module Name: ZeroExtend_tb
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


module ZeroExtend_tb(
    );
    reg [4:0] in;
    wire [31:0] out;
    
    ZeroExtender z(
        .in(in),
        .out(out)
    );
    
    initial begin
        #5;
        in = 14;
        #5;
        in = 17;
    end
endmodule
