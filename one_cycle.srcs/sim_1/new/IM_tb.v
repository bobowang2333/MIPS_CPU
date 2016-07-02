`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/06/29 22:48:47
// Design Name: 
// Module Name: IM_tb
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


module IM_tb(
    );
    
    reg [15:0] addr;
    wire [31:0] data;
    
    IM im(
        .addr(addr),
        .data(data)
    );
    
    initial 
    begin
        addr = 0;
        #10;
        addr = 1;
        #10;
        addr = 2;
    end
endmodule
