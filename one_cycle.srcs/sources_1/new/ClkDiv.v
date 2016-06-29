`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/06/28 23:06:55
// Design Name: 
// Module Name: ClkDiv
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


module ClkDiv(
    input clk,
    input reset,
    output ClkOutput
    );
    reg ClkOutput;
    reg [31:0] count;
    //parameter Divider = 781250; //50MHz ·ÖÆµ³É32Hz
    parameter Divider = 1;
    always@(posedge clk or negedge reset)
    begin
        if(~reset)
        begin
            count <= 0;
            ClkOutput <= 0;
        end
        else begin 
            if(count == Divider)
            begin
                count <= 0;
                ClkOutput <= ~ClkOutput;
            end
            else 
            begin
                count <= count + 1;
            end
        end
     end
    
endmodule
