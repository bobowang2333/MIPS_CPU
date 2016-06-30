`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/06/30 17:29:57
// Design Name: 
// Module Name: DisplayDigit_tb
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


module DisplayDigit_tb(

    );
    reg [3:0] in0;
    reg [3:0] in1;
    reg [3:0] in2;
    reg [3:0] in3;
    reg [3:0] in4;
    reg [3:0] in5;
    reg [3:0] in6;
    reg [3:0] in7;
    reg clk;
    reg rst;
    wire [7:0] digiten;
    wire [7:0] digitsout;
    
    Display_Digit display(
        .in0(in0),
        .in1(in1),
        .in2(in2),
        .in3(in3),
        .in4(in4),
        .in5(in5),
        .in6(in6),
        .in7(in7),
        .clk(clk),
        .rst(rst),
        .digiten(digiten),
        .digitsout(digitsout)
    );
endmodule
