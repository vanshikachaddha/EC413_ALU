`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2025 06:10:22 PM
// Design Name: 
// Module Name: SUB_Nbit
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


module SUB_Nbit #(parameter WIDTH = 32) (c_out, sum, a, b, c_in);
    
    input [WIDTH-1:0] a, b;
    input c_in;
    output c_out;
    output [WIDTH-1:0] sum;
    
    wire [WIDTH + 1:0] carry;
    wire [WIDTH-1:0] not_b;
    
    assign carry[0] = c_in;
    NOT_Nbit nb(not_b,b);
    
    genvar i;
    generate
        for (i = 0; i < WIDTH; i = i + 1) begin : sub_loop 
            FA_str sub1 (carry[i+1],sum[i],a[i],not_b[i],carry[i]);
        end 
    endgenerate
    
     assign c_out = carry[WIDTH];
endmodule
