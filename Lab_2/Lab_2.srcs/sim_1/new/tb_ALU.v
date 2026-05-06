`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/02/2026 04:54:50 PM
// Design Name: 
// Module Name: tb_ALU
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


module tb_alu_32();
reg [31:0] tb_din_a;
reg [31:0] tb_din_b;
reg [3:0] tb_alu_sel;
wire [31:0] ALU_Out_tb;
wire Carry_Out_tb;
wire Overflow_tb;
wire Zero_tb;

alu_32 instant(
.A_in(tb_din_a),
.B_in(tb_din_b),
.ALU_Sel(tb_alu_sel),
.ALU_Out(ALU_Out_tb),
.Carry_Out(Carry_Out_tb),
.Overflow(Overflow_tb),
.Zero(Zero_tb)
);
 
always
begin
tb_din_a = 32'h086a0c31;
tb_din_b = 32'hd785f148;
tb_alu_sel = 4'b0000;
#20;

tb_din_a = 32'h086a0c31;
tb_din_b = 32'h10073fd4;
tb_alu_sel = 4'b0001;
#20;

tb_din_a = 32'ha86a0c31;
tb_din_b = 32'h90073fd4;
tb_alu_sel = 4'b0010;
#20;

tb_din_a = 32'ha86a0c31;
tb_din_b = 32'h90073fd4;
tb_alu_sel = 4'b0110;
#20

tb_din_a = 32'ha86a0c31;
tb_din_b = 32'h90073fd4;
tb_alu_sel = 4'b0111;
#20;

tb_din_a = 32'ha86a0c31;
tb_din_b = 32'h90073fd4;
tb_alu_sel = 4'b1100;
#20;

tb_din_a = 32'ha86a0c31;
tb_din_b = 32'ha86a0c31;
tb_alu_sel = 4'b1111;
#20;

tb_din_a = 32'ha86a0c31;
tb_din_b = 32'h10073fd4;
tb_alu_sel = 4'b1111;
#20;
end

endmodule
