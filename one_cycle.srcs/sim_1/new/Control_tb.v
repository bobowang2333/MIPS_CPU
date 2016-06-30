`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/06/30 11:33:31
// Design Name: 
// Module Name: Control_tb
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


module Control_tb(
    );
    reg [31:0] ins;
    wire [23:0] Signal;
    
    ControlUnit control(
        .instr(ins),
        .Signal(Signal)
    );
    initial begin
           // add
     ins = 32'h00112020;
     
     #30;
     // addi
     ins = 32'h20110001;
     #30;
     // addiu
     #30;
     // addu
     ins = 32'h00132021;
     #30;
     // sll
     ins = 32'h00118fc0;
     #30;
     // sra
     ins = 32'h001188c3;
     #30;
     // srl
     ins = 32'h00118882;
     #30;
     // sub
     #30;
     // or
     ins = 32'h02709825;
     #30;
     // ori
     #30;
     // nor
     #30;
     // lw
     ins = 32'h8e130000;
     #30;
     // sw
     ins = 32'hae300000;
     #30;
     // beq
     ins = 32'h12200001;
     #30;
     // bne
     ins = 32'h0x1611fff8;
     #30;
     // slt
     ins = 32'h0274402a;
     #30;
     // slti
     #30;
     // sltu
     #30;
     // jump
     ins = 32'h08000005;
     #30;
     // jal
     ins = 32'h0c00_00b8;
     #30;
     // jr
     ins = 32'h03e0_0008;
     #30;
     // syscall
     ins = 32'h0000000c;
     #30;
     ins = 0;
    end
endmodule
