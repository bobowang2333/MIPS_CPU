`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/06/30 17:25:11
// Design Name: 
// Module Name: Display_Digit
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


module Display_Digit(
    input [3:0] in0,
    input [3:0] in1,
    input [3:0] in2,
    input [3:0] in3,
    input [3:0] in4,
    input [3:0] in5,
    input [3:0] in6,
    input [3:0] in7,
    input clk,
    input rst,
    output [7:0] digiten,
    output reg [7:0] digitsout
    );
    
    reg [2:0] cnt;
    
    always @ (posedge clk or negedge rst) begin
        if (~rst) begin
            cnt <= 0;
        end
        else begin
            cnt <= cnt + 1;
        end;
    end
    
    assign digiten = ~(1 << cnt);
    
    wire [7:0] d0out;
    wire [7:0] d1out;
    wire [7:0] d2out;
    wire [7:0] d3out;
    wire [7:0] d4out;
    wire [7:0] d5out;
    wire [7:0] d6out;
    wire [7:0] d7out;
    
    HexDigit d0(
        .in(in0),
        .out(d0out)
    );
    
    HexDigit d1(
        .in(in1),
        .out(d1out)
    );
    
    HexDigit d2(
        .in(in2),
        .out(d2out)
    );
    
    HexDigit d3(
        .in(in3),
        .out(d3out)
    );
    
    HexDigit d4(
        .in(in4),
        .out(d4out)
    );
    
    HexDigit d5(
        .in(in5),
        .out(d5out)
    );
    
    HexDigit d6(
        .in(in6),
        .out(d6out)
    );
    
   HexDigit d7(
        .in(in7),
        .out(d7out)
    );
    
    always @ (cnt or d0out or d1out or d2out or d3out or d4out or d5out or d6out or d7out) begin
        case (cnt)
            3'd0: digitsout <= d0out;
            3'd1: digitsout <= d1out;
            3'd2: digitsout <= d2out;
            3'd3: digitsout <= d3out;
            3'd4: digitsout <= d4out;
            3'd5: digitsout <= d5out;
            3'd6: digitsout <= d6out;
            3'd7: digitsout <= d7out;
            default: digitsout <= 0;
        endcase
    end
endmodule
