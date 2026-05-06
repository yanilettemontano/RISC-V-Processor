`timescale 1ns/ 1ps
module processor(
input clk, 
input reset,
output [31:0] Result
);
wire [6:0] Func7;
wire [2:0] Func3;
wire [6:0] Opcode;
wire [1:0] ALUOp;
wire [3:0] Operation;
wire MemtoReg;
wire MemWrite;
wire MemRead;
wire ALUSrc;
wire RegWrite;

Controller controller (
.Opcode(Opcode), 
.ALUSrc(ALUSrc),
.MemtoReg(MemtoReg),
.RegWrite(RegWrite),
.MemRead(MemRead),
.MemWrite(MemWrite),
.ALUOp(ALUOp)
);

ALUController alucontroller(
.Funct3(Func3),
.Funct7(Func7),
.ALUOp(ALUOp),
.Operation(Operation)
);

data_path datapath(
.clk(clk),
.reset(reset),
.reg_write(RegWrite),
.mem2reg(MemtoReg),
.alu_src(ALUSrc),
.mem_write(MemWrite),
.mem_read(MemRead), 
.alu_cc(Operation),
.opcode(Opcode),
.funct7(Func7),
.funct3(Func3),
.alu_result(Result)
);

endmodule