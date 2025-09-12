`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/07/27 22:19:13
// Design Name: 
// Module Name: two_to_onemux
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


module two_to_onemux(
    input wire [31:0] a,
    input wire [31:0] b,
    input wire sel,
    output wire [31:0] y
    );
    assign y = sel ? a : b;
endmodule
