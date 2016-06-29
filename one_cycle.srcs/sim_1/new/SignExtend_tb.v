`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/06/30 00:55:35
// Design Name: 
// Module Name: SignExtend_tb
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


module SignExtend_tb(

    );
    reg [15:0] in;
    wire [31:0] out;
    
    SignExtender sign_extend(
        .in(in),
        .out(out)
    );
    
    initial begin
        #5;
        in = 16'hf002;
        #5;
        in = 16'h2134;
    end
endmodule
