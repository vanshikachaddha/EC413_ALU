`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2025 06:46:35 PM
// Design Name: 
// Module Name: register
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


module register #(parameter WIDTH = 32) (
    input clk,
    input [WIDTH-1:0] d,
    input c_in,
    input overflow_in,
    input zero_in,
    input en, 
    output [WIDTH-1:0] q,
    output c_out,
    output overflow,
    output zero    
   
    );
    genvar i;
    generate
        for (i = 0; i < WIDTH; i = i + 1) begin : reg_loop 
            wire mux_out;
            assign mux_out = en ? d[i] : q[i];             
            dff duf(
                .q(q[i]),
                .d(mux_out), // mux_out??
                .clk(clk));
        end 
    endgenerate
  
    wire mux_c_out, mux_overflow, mux_zero;
    assign mux_c_out = en ? c_in : c_out;
    assign mux_zero = en ? zero_in: zero;
    assign mux_overflow = en ? overflow_in: overflow;
    
    dff dff_c_out (
        .q(c_out),
        .d(mux_c_out),
        .clk(clk)
    );
    
    dff dff_zero (
        .q(zero),
        .d(mux_zero),
        .clk(clk)
    );
    
     dff dff_overflow (
        .q(overflow),
        .d(mux_overflow),
        .clk(clk)
    );
    
endmodule
