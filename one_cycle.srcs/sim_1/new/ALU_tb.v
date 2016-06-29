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
    
    initial begin
        // arith right
        S = 1;
        X = 32'hffff_ffff;
        Y = 3;
        #10;
        S = 2;
        X = 32'hffff_ff00;
        Y = 3;
        #10;
        S = 3;
        X = 1;
        Y = 2;
        #5;
        X = 20;
        Y = 30;
        #5;
        X = 237843;
        Y = 189231;
        #10;
        S = 4;
        X = 1;
        Y = 2;
        #5;
        X = 19238;
        Y = 212;
        #5;
        X = 300;
        Y = 616;
        #10;
        S = 5;
        X = 12738;
        Y = 2834;
        #5;
        X = 32'hffff_ffff;
        Y = 32'h1;
        #10;
        S = 4'hb;
        X = 10;
        Y = 20;
        #5;
        X =32'hffff_ffff;
        Y = 32'h0000_0001;
   
    end
endmodule
