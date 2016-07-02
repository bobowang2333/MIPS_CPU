`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/07/01 21:10:12
// Design Name: 
// Module Name: IF_ID
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


module IF_ID(
        input [15:0] PC0_in, // PC0 = PCOut + 1;
        input [31:0] rom_data_in,
        input [15:0] PC_now_in,
        input clk,
        input reset,
        output reg [15:0] PC0_out,
        output reg [31:0] rom_data_out,
        output reg [15:0] PC_now_out
    );
    
    always@(posedge clk or negedge reset)
    begin
        if(~reset)
        begin
            PC0_out <= 0;
            rom_data_out <= 0;
            PC_now_out <= 0;
        end
        else
        begin
            PC0_out <= PC0_in;
            rom_data_out <= rom_data_in;
            PC_now_out <= PC_now_in;
        end
    end
endmodule
