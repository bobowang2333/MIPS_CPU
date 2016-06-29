`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/06/29 17:15:20
// Design Name: 
// Module Name: ALU_tb
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


module ALU_tb(
    );
    reg [31:0] X;
    reg [31:0] Y;
    reg [3:0] S;
    wire OF;
    wire CF;
    wire [31:0] R;
    wire [31:0] R2;
    wire equal;
    ALU_bobo alu_test(
        .X(X),
        .Y(Y),
        .S(S),
        .OF(OF),
        .CF(CF),
        .R(R),
        .R2(R2),
        .equal(equal)
    );
endmodule
