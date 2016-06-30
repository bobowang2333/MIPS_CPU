`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/06/30 16:49:38
// Design Name: 
// Module Name: MUX1_2_tb
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


module MUX1_2_tb(

    );
    reg [4:0] in0;
    reg [4:0] in1;
    reg sel;
    wire [4:0] res;
    
    MUX1_2_5bit mux1_2_5bit(
        .in0(in0),
        .in1(in1),
        .sel(sel),
        .res(res)
    );
endmodule
