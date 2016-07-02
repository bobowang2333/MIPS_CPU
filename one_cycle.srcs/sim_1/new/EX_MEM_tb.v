`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/07/01 22:42:02
// Design Name: 
// Module Name: EX_MEM_tb
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


module EX_MEM_tb(

    );
    reg [31:0] ALU_R_in;
    reg [31:0] ALU_R2_in;
    reg ALU_equal_in;
    reg [31:0] instr_in;
    reg [31:0] ctrl_in;
    reg [31:0] b_equal_res_in; //PC
    reg [31:0] PC0_in;
    reg [31:0] jump_res_in;
    reg [31:0] RF_R2_in;
    reg clk;
    reg rst;
    wire [31:0] ALU_R_out;
    wire [31:0] ALU_R2_out;
    wire ALU_equal_out;
    wire [31:0] instr_out;
    wire [31:0] ctrl_out;
    wire [31:0] b_equal_res_out;
    wire [31:0] PC0_out;
    wire [31:0] jump_res_out;
    wire [31:0] RF_R2_out;
   
   EX_MEM ex_mem(
            .ALU_R_in(ALU_R_in),
            .ALU_R2_in(ALU_R2_i),
            .ALU_equal_in(ALU_equal_in),
            .instr_in(instr_in),
            .ctrl_in(ctrl_in),
            .b_equal_res_in(b_equal_res_in), //PC
            .PC0_in(PC0_in),
            .jump_res_in(jump_res_in),
            .RF_R2_in(RF_R2_in),
            .clk(clk),
            .rst(rst),
            .ALU_R_out(ALU_R_out),
            .ALU_R2_out(ALU_R2_out),
            .ALU_equal_out(ALU_equal_out),
            .instr_out(instr_out),
            .ctrl_out(ctrl_out),
            .b_equal_res_out(b_equal_res_out),
            .PC0_out(PC0_out),
            .jump_res_out(jump_res_out),
            .RF_R2_out(RF_R2_out)
   );
endmodule
