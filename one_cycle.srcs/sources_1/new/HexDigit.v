`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/06/30 17:22:53
// Design Name: 
// Module Name: HexDigit
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


module HexDigit(
        input [3:0] in,
        output reg [7:0] out
    );
    always @ (in) begin
            case (in)
                4'h0: out <= 8'b1100_0000;
                4'h1: out <= 8'b1111_1001;
                4'h2: out <= 8'b1010_0100;
                4'h3: out <= 8'b1011_0000;
                4'h4: out <= 8'b1001_1001;
                4'h5: out <= 8'b1001_0010;
                4'h6: out <= 8'b1000_0010;
                4'h7: out <= 8'b1111_1000;
                4'h8: out <= 8'b1000_0000;
                4'h9: out <= 8'b1001_0000;
                4'ha: out <= 8'b1000_1000;
                4'hb: out <= 8'b1000_0011;
                4'hc: out <= 8'b1010_0111;
                4'hd: out <= 8'b1010_0001;
                4'he: out <= 8'b1000_0110;
                4'hf: out <= 8'b1000_1110;
                default: out <= 8'b0000_0000;
            endcase
        end

    
endmodule
