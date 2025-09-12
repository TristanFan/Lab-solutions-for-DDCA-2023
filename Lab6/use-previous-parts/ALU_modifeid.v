`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/08/02 17:22:18
// Design Name: 
// Module Name: ALU_modifeid
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


module ALU(
    input [31:0] A,
    input [31:0] B,
    input [3:0] AluOp,
    output [31:0] Result,
    output zero
    );
    
    wire [31:0] op1, AddOut, extended_AddOut, arith_Out, logic_Out;
    wire C;
    
    
    two_to_onemux mux1( ~B, B, AluOp[1], op1);
    FullAdder Adder1( A, op1, AluOp[1], AddOut, C);
    Extend Extend1( AddOut[31], extended_AddOut);
    two_to_onemux mux2( extended_AddOut, AddOut, AluOp[3], arith_Out);
    four_to_onemux mux3( A&B, A|B, A^B, ~(A|B), AluOp[1:0], logic_Out);
    two_to_onemux mux4( logic_Out, arith_Out, AluOp[2], Result);
    assign zero = (Result == 0);
endmodule
