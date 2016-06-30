`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/06/30 15:57:21
// Design Name: 
// Module Name: Regfile_tb
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


module Regfile_tb(
    );
     reg [4:0] R1_No;
     reg [4:0] R2_No;
     reg [4:0] W_No;
     reg [31:0] Din;
     reg clk;
     reg reset;
     reg we;
     wire [31:0] R1;
     wire [31:0] R2;
     
     Regfile regfile(
             .R1_No(R1_No),
             .R2_No(R2_No),
             .W_No(W_No),
             .Din(Din),
             .clk(clk),
             .we(we),
             .reset(reset),
             .R1(R1),
             .R2(R2)
         );
         
     always begin
     #1 clk = ~clk;
     end
     
     initial begin
        #5;
        reset = 1;
        we = 0;
        clk = 0;
        #5;
        reset = 0;
        R1_No = 2;
        R2_No = 16;
        #5;
        reset = 1;
        W_No = 16;
        Din = 32'h1234_5678;
        #5;
        we = 1;
        #5;
        we = 0;
        
     end
endmodule
