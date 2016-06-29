`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/06/29 17:26:13
// Design Name: 
// Module Name: ALU_bobo
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

module ALU_bobo(
   input [31:0] X,
   input [31:0] Y,
   input [3:0] S,
   output reg OF, //signed overflow
   output reg CF, //unsigned overflow
   output reg [31:0] R,
   output reg [31:0] R2,
   output reg equal
    );

    reg [63:0] tmp; 
    /*
    wire X_sign;
    wire Y_sign;
    wire Sum_sign;
    assign X_sign = X[31];
    assign Y_sign = Y[31];
    assign Sum_sign = R[31];
   */
    reg X_sign;
    reg Y_sign;
    reg Sum_sign;
   
    always@(X or Y or S)
    begin
        if(X == Y)
            equal = 1;
         else
            equal = 0;
         case(S)
             4'd0:
            begin
                //logic left
                R = X << Y;
            end
            4'd1:
            begin
            //artih right
                R = $signed(X) >>> Y;
            end
            4'd2:
            begin
            // logic right
                R = X >> Y;
            end
            4'd3:
            begin
            //multiply
                tmp = X*Y;
                R = tmp[31:0];
                R2 = tmp[63:32]; 
            end
            4'd4:
            begin
            //divide
                if(Y == 0)
                begin
                    R = 0;
                    R2 = 0;
                end
                else begin
                    R = X / Y;
                    R2 = X % Y;
                end
            end
            4'd5:
            begin
            //add
                {CF, R} = X + Y;
                Sum_sign = R[31];
                X_sign = X[31];
                Y_sign = Y[31];
                OF = (X_sign == Y_sign)?(Sum_sign == X_sign ? 0:1):0;
            end
            4'd6:
            begin
            //sub
                {CF, R} = X - Y;
                Sum_sign = R[31];
                X_sign = X[31];
                Y_sign = Y[31];
                OF = (X_sign == Y_sign)?(Sum_sign == X_sign ? 0:1):0;
            end
            4'd7:
            begin
            //and
                R = X & Y;
            end
            4'd8:
            begin
            //or
                R = X | Y;
            end
            4'd9:
            begin
            //xor
                R = X ^ Y;
            end
            4'd10:
            begin
                R = ~(X | Y);
            end
            4'd11:
            begin
                R = ($signed(X) < $signed(Y))?1:0;
            end
            4'd12:
            begin
                R = (X < Y)?1:0;
            end
            default:
            begin
                R = 0;
            end
         endcase
     end
endmodule