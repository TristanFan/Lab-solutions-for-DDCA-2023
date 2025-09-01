`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/07/03 16:25:29
// Design Name: 
// Module Name: FullAdder
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


module FullAdder(
input a, input b, input ci, output s, output co
    );
    wire y1, y2, y3;
    xor g1(y1,a,b);
    and g2(y2,y1,ci);
    and g3(y3,a,b);
    xor g4(s,y1,ci);
    or  g5(co,y2,y3);
endmodule
