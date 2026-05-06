`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/13/2026 12:28:46 PM
// Design Name: 
// Module Name: Instr_mem_tb
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


module Instr_mem_tb();
reg [7:0] addr_tb;
wire [31:0] instruction_tb;

Instr_mem instant(
.addr(addr_tb),
.instruction(instruction_tb)
);

initial
begin
addr_tb = 8'd12;
#20
addr_tb = 8'd64;
end
endmodule
