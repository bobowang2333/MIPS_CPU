`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/06/30 21:16:18
// Design Name: 
// Module Name: MUX3_8
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


module MUX3_8(
    input [31:0] in0,
    input [31:0] in1,
    input [31:0] in2,
    input [31:0] in3,
    input [31:0] in4,
    input [31:0] in5,
    input [31:0] in6,
    input [31:0] in7,
    input [2:0] sel,
    output reg [31:0] out
    );
    
    always @ (sel or in0 or in1 or in2 or in3 or in4 or in5 or in6 or in7) begin
        case (sel)
            0: out <= in0;
            1: out <= in1;
            2: out <= in2;
            3: out <= in3;
            4: out <= in4;
            5: out <= in5;
            6: out <= in6;
            7: out <= in7;
            default: out <= in0;
        endcase
    end
endmodule
