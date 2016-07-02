`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/07/01 21:45:10
// Design Name: 
// Module Name: EX_MEM
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


module EX_MEM(
        input [31:0] ALU_R_in,
        input [31:0] ALU_R2_in,
        input ALU_equal_in,
        input [31:0] instr_in,
        input [31:0] ctrl_in,
        input [31:0] b_equal_res_in, //PC
        input [15:0] PC0_in,
        input [31:0] jump_res_in,
        input [31:0] RF_R2_in,
        input [31:0] RF_R1_in,
        input clk,
        input rst,
        output reg [31:0] ALU_R_out,
        output reg [31:0] ALU_R2_out,
        output reg ALU_equal_out,
        output reg [31:0] instr_out,
        output reg [31:0] ctrl_out,
        output reg [31:0] b_equal_res_out,
        output reg [15:0] PC0_out,
        output reg [31:0] jump_res_out,
        output reg [31:0] RF_R2_out,
        output reg [31:0] RF_R1_out
            );
            
        always@(posedge clk or negedge rst)
        begin
            if(~rst)
            begin
                ALU_R_out <= 0;
                ALU_R2_out <= 0;
                ALU_equal_out <= 0;
                instr_out <= 0;
                ctrl_out <= 0;
                b_equal_res_out <= 0;
                PC0_out <= 0;
                jump_res_out <= 0;
                RF_R2_out <= 0;
                RF_R1_out <= 0;
            end
            else
            begin
                 ALU_R_out <= ALU_R_in;
                 ALU_R2_out <= ALU_R2_in;
                 ALU_equal_out <= ALU_equal_in;
                 instr_out <= instr_in;
                 ctrl_out <= ctrl_in;
                 b_equal_res_out <= b_equal_res_in;
                 PC0_out <= PC0_in;
                 jump_res_out <= jump_res_in;
                 RF_R2_out <= RF_R2_in;
                 RF_R1_out <= RF_R1_in;
            end
        end
endmodule
