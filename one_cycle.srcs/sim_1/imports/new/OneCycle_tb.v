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
    reg [7:0] dm_in_addr;
    wire SyscallDisplay;
    wire CLK;
    wire [7:0] DigitEn;//choose which digit shine
    wire [7:0] DigitOut;
    wire [31:0] Cycle_count;
    wire Digits_Clk;
    wire test;
    wire ClkCycle;
    wire CLK_OUT_LED;
    wire clk_OUT_LED;
    
    
    
     One_Cycle one_cycle(
        .clk(clk),
        .reset(reset),
        .digit_control(digit_control),
        .SyscallDisplay(SyscallDisplay),
        .CLK(CLK),
        .dm_in_addr(dm_in_addr),
        .Digits_Clk(Digits_Clk),
        .DigitEn(DigitEn),
        .DigitOut(DigitOut),
        .Cycle_count(Cycle_count),
        .test(test),
         .ClkCycle(ClkCycle),
        .CLK_OUT_LED(CLK_OUT_LED),
        .clk_OUT_LED(clk_OUT_LED)
  
     );
     /*
      always begin
            #1 clk = ~clk;
        end
        
        initial begin
            clk = 0;
            digit_control = 0;
            reset = 1;
            #5;
            reset = 0;
            #5;
            reset = 1;
        end
        
     */
endmodule
