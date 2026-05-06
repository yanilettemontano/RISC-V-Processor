`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/10/2026 11:21:08 AM
// Design Name: 
// Module Name: Controller
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


module Controller(
Opcode,
ALUSrc, MemtoReg, RegWrite, MemRead, MemRead, MemWrite,
ALUOp
    );
    
input [6:0] Opcode;
output reg RegWrite; //controlling reads and writes in the register file and data memory in Datapath
output reg ALUSrc; //control multiplexers in Datapath
output reg MemRead; //controlling reads and writes in the register file and data memory
output reg MemWrite; //controlling reads and writes in the register file and data memory
output reg MemtoReg; // control multiplexers in Datapath
output reg [1:0] ALUOp;

always @ (*)
begin
case (Opcode)

    7'b0000011: // L1
    begin
        MemtoReg = 1'b1;
        MemWrite = 1'b0;
        MemRead = 1'b1;
        ALUSrc = 1'b1;
        RegWrite = 1'b1;
        ALUOp = 2'b01;
    end
    
    7'b0100011: //SW
    begin
    MemtoReg = 1'b0;
    MemWrite = 1'b1;
    MemRead = 1'b0;
    ALUSrc = 1'b1;
    RegWrite = 1'b0;
    ALUOp = 2'b01;
    end 
    
    7'b0110011: // R-Type
    begin
    MemtoReg = 1'b0;
    MemWrite = 1'b0;
    MemRead = 1'b0;
    ALUSrc = 1'b0;
    RegWrite = 1'b1;
    ALUOp = 2'b10;
    end
    
    7'b0010011: //I Type
    begin
    MemtoReg = 1'b0;
    MemWrite = 1'b0;
    MemRead = 1'b0;
    ALUSrc = 1'b1;
    RegWrite = 1'b1;
    ALUOp = 2'b00;
    end
endcase
end

endmodule
