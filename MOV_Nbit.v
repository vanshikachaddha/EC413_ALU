`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2025 05:48:22 PM
// Design Name: 
// Module Name: MOV_Nbit
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


module MOV_Nbit #(parameter WIDTH = 32) (out1, in1, in2);
    
    input [WIDTH-1:0] in1, in2;
    output [WIDTH-1:0] out1;
    
    wire [WIDTH-1:0] w1;
    genvar i;
    generate
        for (i = 0; i < WIDTH; i = i + 1) begin : mov_loop 
            not not1(w1[i],in1[i]);
            not not2(out1[i],w1[i]);
        end 
    endgenerate
    
    
endmodule

