`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2025 09:58:32 PM
// Design Name: 
// Module Name: ADD_Nbit
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


module ADD_Nbit #(parameter WIDTH = 32) (c_out, sum, a, b, c_in);
    
    input [WIDTH-1:0] a, b;
    input c_in;
    output c_out;
    output [WIDTH-1:0] sum;
    
    wire [WIDTH:0] carry;
    
    assign carry[0] = c_in;
    
    genvar i;
    generate
        for (i = 0; i < WIDTH; i = i + 1) begin : add_loop 
            FA_str add1 (carry[i+1],sum[i],a[i],b[i],carry[i]);
        end 
    endgenerate
    
    assign c_out = carry[WIDTH];
    
    
endmodule