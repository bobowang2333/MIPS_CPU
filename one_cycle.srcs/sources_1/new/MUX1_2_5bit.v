`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/06/30 17:04:46
// Design Name: 
// Module Name: MUX1_2_5bit
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


module MUX1_2_5bit(
       input [4:0] in0,
       input [4:0] in1,
       input sel,
       output reg [4:0] res
    );
    
    always@(in0 or in1 or sel)
    begin
        case(sel)
        0: res <= in0;
        1: res <= in1;
        default: res <= in0;
        endcase
    end
endmodule
