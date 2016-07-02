`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/07/01 21:25:48
// Design Name: 
// Module Name: ID_EX
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


module ID_EX(
        input [31:0] RF_R1_in,
        input [31:0] RF_R2_in,
        input [31:0] sign16_32ext_in,
        input [31:0] zero16_32ext_in,
        input [31:0] zero5_32ext_in,
        input [15:0] PC0_in_in,
        input [15:0] PC_Now_in,
        input [31:0] instr_in,
        input [23:0] control_in,
        input [31:0] JumpAddressIn,
        input clk,
        input rst,
        output reg [31:0] RF_R1_out,
        output reg [31:0] RF_R2_out,
        output reg [31:0] sign16_32ext_out,
        output reg [31:0] zero16_32ext_out,
        output reg [31:0] zero5_32ext_out,
        output reg [15:0] PC0_out_out,
        output reg [15:0] PC_Now_out,
        output reg [31:0] instr_out,
        output reg [23:0] control_out,
        output reg [31:0] JumpAddressOut
    );
    always@(posedge clk or negedge rst)
    begin
        if(~rst)
        begin
            RF_R1_out <= 0;
            RF_R2_out <= 0;
            sign16_32ext_out <= 0;
            zero16_32ext_out <= 0;
            zero5_32ext_out <= 0;
            PC0_out_out <= 0;
            PC_Now_out <= 0;
            instr_out <= 0;
            control_out <= 0;
            JumpAddressOut <= 0;
        end
        else
        begin
            RF_R1_out <= RF_R1_in;
            RF_R2_out <= RF_R2_in;
            sign16_32ext_out <=  sign16_32ext_in;
            zero16_32ext_out <= zero16_32ext_in;
            zero5_32ext_out <= zero5_32ext_in;
            PC0_out_out <= PC0_in_in;
            PC_Now_out <= PC_Now_in;
            instr_out <= instr_in;
            control_out <= control_in;
            JumpAddressOut <= JumpAddressIn;
        end
    end
endmodule
