`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/06/30 16:47:07
// Design Name: 
// Module Name: MUX1_2_32bit
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


module MUX1_2_32bit(
        input [31:0] in0,
        input [31:0] in1,
        input sel,
        output reg [31:0] res
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
