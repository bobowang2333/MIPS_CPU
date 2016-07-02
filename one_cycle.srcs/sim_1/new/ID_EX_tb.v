`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/07/01 21:38:17
// Design Name: 
// Module Name: ID_EX_tb
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


module ID_EX_tb(

    );
    
     reg [31:0] RF_R1_in;
     reg [31:0] RF_R2_in;
     reg [31:0] sign16_32ext_in;
     reg [31:0] zero16_32ext_in;
     reg [31:0] zero5_32ext_in;
     reg [31:0] PC0_in_in;
     reg [31:0] instr_in;
     reg [31:0] control_in;
     reg clk;
     reg rst;
     wire [31:0] RF_R1_out;
     wire [31:0] RF_R2_out;
     wire [31:0] sign16_32ext_out;
     wire [31:0] zero16_32ext_out;
     wire [31:0] zero5_32ext_out;
     wire [31:0] PC0_out_out;
     wire [31:0] instr_out;
     wire [31:0] control_out;
     
     ID_EX id_ex(
          .RF_R1_in(RF_R1_in),
          .RF_R2_in(RF_R2_in),
          .sign16_32ext_in(sign16_32ext_in),
          .zero16_32ext_in(zero16_32ext_in),
          .zero5_32ext_in(zero5_32ext_in),
          .PC0_in_in(PC0_in_in),
          .instr_in(instr_in),
          .control_in(control_in),
          .clk(clk),
          .rst(rst),
          .RF_R1_out(RF_R1_out),
          .RF_R2_out(RF_R2_out),
          .sign16_32ext_out(sign16_32ext_out),
          .zero16_32ext_out(zero16_32ext_out),
          .zero5_32ext_out(zero5_32ext_out),
          .PC0_out_out(PC0_out_out),
          .instr_out(instr_out),
          .control_out(control_out)
     );
endmodule
