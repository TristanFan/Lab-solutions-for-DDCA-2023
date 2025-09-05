`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/07/14 17:15:02
// Design Name: 
// Module Name: FiniteStateMachine
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


module FiniteStateMachine(
    input clk,
    input reset,
    input left,
    input right,
    output LC,
    output LB,
    output LA,
    output RC,
    output RB,
    output RA
    );
    reg  [2:0] state, nextstate;
    
    parameter S0 = 3'b000;
    parameter S1 = 3'b001;
    parameter S2 = 3'b010;
    parameter S3 = 3'b011;
    parameter S4 = 3'b100;
    parameter S5 = 3'b101;
    parameter S6 = 3'b110;
    
    clk_div clock_first(clk, reset, clk_en);
    
    always @ ( posedge clk_en, posedge reset)
    if(reset) state <= S0;
    else state <= nextstate;
    
    always @ (*)
    case (state)
        S0: if(left == 1 && right == 0) nextstate = S1;
            else if(left == 0 && right == 1) nextstate = S4;
            else if(left == 1 && right == 1) nextstate = S0;
        S1: nextstate = S2;
        S2: nextstate = S3;
        S3: nextstate = S0;
        S4: nextstate = S5;
        S5: nextstate = S6;
        S6: nextstate = S0;
        default: nextstate = S0;
      endcase

assign LC = (state == S3);
assign LB = (state == S2) || (state == S3);
assign LA = (state == S1) || (state == S2) || (state == S3);
assign RC = (state == S6);
assign RB = (state == S5) || (state == S6);
assign RA = (state == S4) || (state == S5) || (state == S6);     
endmodule


