`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/10/2026 05:59:16 PM
// Design Name: 
// Module Name: FlipFlop_tb
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


module FlipFlop_tb();
reg clk_tb = 1;
reg reset_tb = 1'b1;
reg [7:0] d_tb = 8'h38;
wire [7:0] q_tb;

FlipFlop instant(
.clk(clk_tb),
.reset(reset_tb),
.d(d_tb),
.q(q_tb)
);

initial
begin
#100;
reset_tb = 0;
#20;
d_tb = 8'hf0;
end

always
begin
#10;
clk_tb = ~clk_tb;
end
endmodule
