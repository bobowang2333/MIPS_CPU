`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/06/30 16:31:59
// Design Name: 
// Module Name: MUX2_4_tb
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


module MUX2_4_tb(

    );
    reg [31:0] in0;
    reg [31:0] in1;
    reg [31:0] in2;
    reg [31:0] in3;
    reg [1:0] sel;
    wire [31:0] res;
    
    MUX2_4 mux2_4(
        .in0(in0),
        .in1(in1),
        .in2(in2),
        .in3(in3),
        .sel(sel),
        .res(res)
    );
    
    initial begin
    #1;
    in0 = 0;
    in1 = 1;
    in2 = 2;
    in3 = 3;
    #5;
    sel = 3;
    #5;
    sel = 2;
    #5;
    sel = 1;
    end
endmodule
