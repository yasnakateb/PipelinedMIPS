module decode_stage(
	clk,
	i_Sig_RegWrite,
	i_Instruction,
	i_Write_Register,
	i_Write_Data,
	o_A,
	o_B,
	o_extended_Immediate,
	o_Sig_RegDst,
	o_Sig_ALUSrc,
	o_Sig_MemtoReg,
	o_Sig_RegWrite,
	o_Sig_MemRead,
	o_Sig_MemWrite,
	o_Sig_Branch,
	o_Sigs_ALUOp
   	);
	
	input clk;
	input i_Sig_RegWrite;
	input [15:0] i_Instruction;
	input [2:0] i_Write_Register;
	input [15:0] i_Write_Data;
	output [15:0] o_A;
	output [15:0] o_B;
	output [15:0] o_extended_Immediate;
	output o_Sig_RegDst;
	output o_Sig_ALUSrc;
	output o_Sig_MemtoReg;
	output o_Sig_RegWrite;
	output o_Sig_MemRead;
	output o_Sig_MemWrite;
	output o_Sig_Branch;
	output [1:0] o_Sigs_ALUOp;


	register_file Register_File (
		.clk(clk), 
		.i_Sig_RegWrite(i_Sig_RegWrite), 
		.i_Write_Register(i_Write_Register), 
		.i_Write_Data(i_Write_Data), 
		.i_Rs(i_Instruction[12:10]), 
		.i_Rt(i_Instruction[9:7]), 
		.o_A(o_A), 
		.o_B(o_B)
		);

	sign_extend Sign_Extend (
		.i_Immediate(i_Instruction[6:0]), 
		.o_extended_Immediate(o_extended_Immediate)
		);
		
	control_unit Control_Unit (
		.i_Opcode(i_Instruction[15:13]), 
		.o_Sig_RegDst(o_Sig_RegDst), 
		.o_Sig_ALUSrc(o_Sig_ALUSrc), 
		.o_Sig_MemtoReg(o_Sig_MemtoReg), 
		.o_Sig_RegWrite(o_Sig_RegWrite), 
		.o_Sig_MemRead(o_Sig_MemRead), 
		.o_Sig_MemWrite(o_Sig_MemWrite), 
		.o_Sig_Branch(o_Sig_Branch), 
		.o_Sigs_ALUOp(o_Sigs_ALUOp)
		);

endmodule