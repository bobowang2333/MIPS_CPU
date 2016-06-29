`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/06/29 23:13:42
// Design Name: 
// Module Name: DM
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


module DM(
    input [15:0] addr,
    input clk,
    input we,
    input [31:0] DataInput,
    output [31:0] DataOut  
    );
    
    parameter size = 1024;
    reg [31:0] data [size-1:0];
    
   // integer i;
    always@(posedge clk)
    begin
        if(we)
        begin
            data[addr] <= DataInput;
        end
    end
    
    assign DataOut = data[addr];
    
    
endmodule
