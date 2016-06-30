`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/06/30 15:47:21
// Design Name: 
// Module Name: Regfile
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


module Regfile(
        input [4:0] R1_No,
        input [4:0] R2_No,
        input [4:0] W_No,
        input [31:0] Din,
        input clk,
        input we,
        input reset,
        output [31:0] R1,
        output [31:0] R2
    );
    reg [31:0] regs[31:0];
    integer i;
    
    assign R1 = (R1_No == 0)?0:regs[R1_No];
    assign R2 = (R2_No == 0)?0:regs[R2_No];
    
    always@(posedge clk or negedge reset)
    begin
        if(~reset)
        begin
            for(i = 0; i < 32; i = i + 1)
            begin
                regs[i] <= 32'h0000_0000;
            end  
        end
        else
        begin
            if(we)
            begin
                regs[W_No] <= Din;
            end  
        end
    end
endmodule
