`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2025 04:30:02 PM
// Design Name: 
// Module Name: top_module
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

// implementing ALU and register 

module top_module #(parameter WIDTH = 32)(
    input clk, en, 
    input [WIDTH-1:0] op1, op2,
    input [2:0] opcode,
    output [WIDTH-1:0] q, // is final result  
    output c_out, overflow, zero
    );
    
    wire [WIDTH-1:0] res, carry, oflow, w0;
    
    ALU_module ALU_Mod (res, w0, carry, oflow, op1, op2, opcode);
    
    register reg_inst1(.q(q), .c_out(c_out), .overflow(overflow), .zero(zero), .clk(clk), .d(res), .c_in(carry), .overflow_in(oflow), .zero_in(w0), .en(en));
    
endmodule
