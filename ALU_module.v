`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2025 05:26:45 PM
// Design Name: 
// Module Name: ALU_module
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


module ALU_module #(parameter WIDTH = 32)(result, zero, c_out, overflow, op1, op2, opcode);
    
    input [WIDTH-1:0] op1, op2;
    input [2:0] opcode;
    output [WIDTH-1:0] result; 
    output zero, c_out, overflow;
    
    wire [WIDTH-1:0] result1, result2, result3, result4, result5, result6, result7; 
    wire sub_c_out, add_c_out;
    reg [WIDTH-1:0] temp_out; // outout of the mux 
    reg zero_flag, c_out_flag, overflow_flag;
    
    MOV_Nbit #(WIDTH) s1(result1,op1,op2);
    NOT_Nbit #(WIDTH) s2(result2,op1);
    ADD_Nbit #(WIDTH) s3(add_c_out, result3,op1,op2,0);
    NOR_Nbit #(WIDTH) s4(result4,op1,op2);
    SUB_Nbit #(WIDTH) s5(sub_c_out, result5,op1,op2,1);
    NAND_Nbit #(WIDTH) s6(result6,op1,op2);
    AND_Nbit #(WIDTH) s7(result7,op1,op2);
    
 always @ * begin 
    case(opcode)
        
        3'b000:  temp_out = result1;        //mov
        3'b001:  temp_out = result2;        //not
        3'b010:  temp_out = result3;        //add 
        3'b011:  temp_out = result4;        //nor
        3'b100:  temp_out = result5;        //sub
        3'b101:  temp_out = result6;        //nand
        3'b110:  temp_out = result7;        //and
     
    endcase
end 

    assign result = temp_out;
    
    //carry out flag
    always @(*) begin
        if (opcode == 3'b010 || opcode == 3'b100) begin
            c_out_flag = (opcode == 3'b010) ? add_c_out : sub_c_out; 
        end else begin
            c_out_flag = 0;  // No carry-out for other operations
        end
    end
        assign c_out = c_out_flag;
        
    //zero flag
    assign zero = (result == 0) ? 1'b1 : 1'b0;
    
    //overflow flag
    always @(*) begin
        if (opcode == 3'b010) begin // ADD operation
            overflow_flag = (op1[WIDTH-1] == op2[WIDTH-1]) && (temp_out[WIDTH-1] != op1[WIDTH-1]);
        end
        else if (opcode == 3'b100) begin // SUB operation
            overflow_flag = (op1[WIDTH-1] & ~op2[WIDTH-1] & ~temp_out[WIDTH-1]) | (~op1[WIDTH-1] &  op2[WIDTH-1] &  temp_out[WIDTH-1]);
        end
        else begin
            overflow_flag = 0; // No overflow for logical operations
        end
    end

        assign overflow = overflow_flag; // Assign the overflow flag output
    

endmodule
