`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2025 05:55:49 PM
// Design Name: 
// Module Name: NOR_Nbit
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


module NOR_Nbit #(parameter WIDTH = 32) (out1, in1, in2);
    
    input [WIDTH-1:0] in1, in2;
    output [WIDTH-1:0] out1;
    
    genvar i;
    generate
        for (i = 0; i < WIDTH; i = i + 1) begin : nor_loop 
            nor n1(out1[i],in1[i],in2[i]);
        end 
    endgenerate
    
    
endmodule
