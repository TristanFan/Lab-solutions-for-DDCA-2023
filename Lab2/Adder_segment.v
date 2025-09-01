`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/07/07 11:29:52
// Design Name: 
// Module Name: Adder_segment
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


module Adder_segment(
    input [3:0] A,
    input [3:0] B,
    output Overflow,
    output [6:0] D
    ); 
    wire [4:0] S;
    FourBitAdder first (A[3:0],B[3:0],S[4:0]);
    buf(Overflow,S[4]);
    Decoder(S[3:0],D[6:0]); 
endmodule
