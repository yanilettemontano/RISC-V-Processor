`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/02/2026 04:54:07 PM
// Design Name: 
// Module Name: ALU
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


module alu_32(A_in, B_in, ALU_Sel, ALU_Out, Carry_Out, Zero, Overflow);
input [31:0] A_in, B_in;
input [3:0] ALU_Sel;
output reg [31:0] ALU_Out;
output reg Carry_Out, Overflow;
output Zero;

reg [32:0] temp;

always@(*) begin
    ALU_Out = 32'b0;
    Carry_Out = 1'b0;
    Overflow = 1'b0;
    temp = 32'b0;
case(ALU_Sel)
    default: begin ALU_Out = $signed(A_in) + $signed(B_in); end
    4'b0000: begin ALU_Out = A_in & B_in; end
    4'b0001: begin ALU_Out = A_in | B_in; end 
    4'b0010: begin 
    temp = $signed(A_in) + $signed(B_in); 
    ALU_Out = temp[31:0];
    Carry_Out = temp[32];
    Overflow = ((~A_in[31] & ~B_in[31] & ALU_Out[31]) | (A_in[31] & B_in[31] & ~ALU_Out[31])) ? 1'b1 : 1'b0;
    end
    4'b0110: begin ALU_Out = $signed(A_in) - $signed(B_in);
    Overflow = ((A_in[31] & ~B_in[31] & ~ALU_Out[31]) | (~A_in[31] & B_in[31] & ALU_Out[31])) ? 1'b1 : 1'b0; 
    end
    4'b0111: begin ALU_Out = ($signed(A_in) < $signed(B_in)) ? 32'b1 : 32'b0; end
    4'b1100: begin ALU_Out = ~(A_in | B_in); end
    4'b1111: begin ALU_Out = (A_in == B_in) ? 32'b1 : 32'b0; end
endcase
end
assign Zero = (ALU_Out == 32'b0) ? 1'b1 : 1'b0;
//or you can just do Zero = (ALU_Out == 0);
endmodule
