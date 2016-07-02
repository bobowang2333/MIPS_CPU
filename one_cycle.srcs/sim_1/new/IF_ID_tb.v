`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/07/01 21:14:34
// Design Name: 
// Module Name: IF_ID_tb
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


module IF_ID_tb(

    );
    reg [31:0] PC0_in; // PC0 = PCOut + 1;
    reg [31:0] rom_data_in;
    reg [15:0] PC_now_in;
    reg clk;
    reg reset;
    wire [31:0] PC0_out;
    wire [31:0] rom_data_out;
    wire [15:0] PC_now_out;
    
    IF_ID if_id(
        .PC0_in(PC0_in),
        .rom_data_in(rom_data_in),
        .PC_now_in(PC_now_in),
        .clk(clk),
        .reset(reset),
        .PC0_out(PC0_out),
        .rom_data_out(rom_data_out),
        .PC_now_out(PC_now_out)
    );
endmodule
