`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/06/30 16:28:28
// Design Name: 
// Module Name: MUX2_4
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


module MUX2_4(
    input [31:0] in0,
    input [31:0] in1,
    input [31:0] in2,
    input [31:0] in3,
    input [1:0] sel,
    output reg [31:0] res
    );
    
    always@(sel or in0 or in1 or in2 or in3)
    begin
        case(sel)
        0: res <= in0;
        1: res <= in1;
        2: res <= in2;
        3: res <= in3;
        default: res <= in0;
        endcase
    end
    
endmodule
