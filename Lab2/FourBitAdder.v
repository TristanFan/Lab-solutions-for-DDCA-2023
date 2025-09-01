`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/07/03 17:11:32
// Design Name: 
// Module Name: FourBitAdder
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


module FourBitAdder(input [3:0] a, input [3:0] b, output [4:0] s 

    );
    wire y1,y2,y3;
    FullAdder first(a[0],b[0],0,s[0],y1);
    FullAdder second(a[1],b[1],y1,s[1],y2);
    FullAdder third(a[2],b[2],y2,s[2],y3);
    FullAdder fourth(a[3],b[3],y3,s[3],s[4]);
endmodule



