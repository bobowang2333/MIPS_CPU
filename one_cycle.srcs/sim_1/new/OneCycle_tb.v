`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/06/30 19:09:46
// Design Name: 
// Module Name: OneCycle_tb
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


module OneCycle_tb(
    );
    reg clk;
    reg reset;
    reg [2:0] digit_control;
    wire SyscallDisplay;
    wire ClkEn;
    wire RF_D2;
    wire DigitEn;//choose which digit shine
    wire DigitOut;
    
    
     One_Cycle one_cycle(
        .clk(clk),
        .reset(reset),
        .digit_control(digit_control),
        .SyscallDisplay(SyscallDisplay),
        .ClkEn(ClkEn),
        .RF_D2(RF_D2),
        .DigitEn(DigitEn),
        .DigitOut(DigitOut)
     );
endmodule
