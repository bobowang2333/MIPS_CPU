`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/07/01 23:17:25
// Design Name: 
// Module Name: MEM_WB_tb
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


module MEM_WB_tb(

    );
    reg [31:0] ALU_R_in;
    reg ALU_equal_in;
    reg [31:0] DM_data_in;
    reg [31:0] instr_in;
    reg [31:0] ctrl_in;
    reg [31:0] PC0_in;
    reg clk;
    reg rst;
    wire [31:0] ALU_R_out;
    wire [31:0] ALU_equal_out;
    wire [31:0] DM_data_out;
    wire [31:0] instr_out;
    wire [31:0] ctrl_out;
    wire [31:0] PC0_out;
    
    MEM_WB mem_wb(
            .ALU_R_in(ALU_R_in),
            .ALU_equal_in(ALU_equal_in),
            .DM_data_in(DM_data_in),
            .instr_in(instr_in),
            .ctrl_in(ctrl_in),
            .PC0_in(PC0_in),
            .clk(clk),
            .rst(rst),
            .ALU_R_out(ALU_R_out),
            .ALU_equal_out(ALU_equal_out),
            .DM_data_out(DM_data_out),
            .instr_out(instr_out),
            .ctrl_out(ctrl_out),
            .PC0_out(PC0_out)
        );
endmodule
