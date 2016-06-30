`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/06/30 16:42:42
// Design Name: 
// Module Name: MUX2_4_5bit_tb
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


module MUX2_4_5bit_tb(
    
    );
    reg [4:0] in0;
    reg [4:0] in1;
    reg [4:0] in2;
    reg [4:0] in3;
    reg [1:0] sel;
    wire [4:0] res;
    
    MUX2_4_5bit mux2_4_5bit(
        .in0(in0),
        .in1(in1),
        .in2(in2),
        .in3(in3),
        .sel(sel),
        .res(res)
    );
endmodule
