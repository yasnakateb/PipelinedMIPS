module id_ex(
	clk,
	reset,
	i_Pc_Plus_2,
	i_A,
	i_B,
	i_Immediate,
	i_Sig_ALUSrc,
	i_Sigs_ALUOp,
	i_Sig_RegDst,
	i_Rt,
	i_Rd,
	i_Sig_MemRead,
	i_Sig_MemWrite,
	i_Sig_Branch,
	i_Sig_MemtoReg,
	i_Sig_RegWrite,
	o_Pc_Plus_2,
	o_A,
	o_B,
	o_Immediate,
	o_Sig_ALUSrc,
	o_Sigs_ALUOp,
	o_Sig_RegDst,
	o_Rt,
	o_Rd,
	o_Sig_MemRead,
	o_Sig_MemWrite,
	o_Sig_Branch,
	o_Sig_MemtoReg,
	o_Sig_RegWrite
	);
	
	input clk;
	input reset;
	input [15:0] i_Pc_Plus_2;
	input [15:0] i_A;
	input [15:0] i_B;
	input [15:0] i_Immediate;
	input i_Sig_ALUSrc;
	input [1:0] i_Sigs_ALUOp;
	input i_Sig_RegDst;
	input [2:0] i_Rt;
	input [2:0] i_Rd;
	input i_Sig_MemRead;
	input i_Sig_MemWrite;
	input i_Sig_Branch;
	input i_Sig_MemtoReg;
	input i_Sig_RegWrite;
	output reg [15:0] o_Pc_Plus_2;
	output reg [15:0] o_A;
	output reg [15:0] o_B;
	output reg [15:0] o_Immediate;
	output reg o_Sig_ALUSrc;
	output reg [1:0] o_Sigs_ALUOp;
	output reg o_Sig_RegDst;
	output reg [2:0] o_Rt;
	output reg [2:0] o_Rd;
	output reg o_Sig_MemRead;
	output reg o_Sig_MemWrite;
	output reg o_Sig_Branch;
	output reg o_Sig_MemtoReg;
	output reg o_Sig_RegWrite;
		
	always @( negedge clk) begin 
		o_Pc_Plus_2 <=	i_Pc_Plus_2;								
		o_A <= i_A;
		o_B <= i_B;
		o_Immediate <= i_Immediate;
		o_Sig_ALUSrc <= i_Sig_ALUSrc;
		o_Sigs_ALUOp <= i_Sigs_ALUOp;
		o_Sig_RegDst <= i_Sig_RegDst;
		o_Rt <= i_Rt;
		o_Rd <= i_Rd;
 		o_Sig_MemRead <= i_Sig_MemRead;
		o_Sig_MemWrite <= i_Sig_MemWrite;
		o_Sig_Branch <= i_Sig_Branch;
		o_Sig_MemtoReg <= i_Sig_MemtoReg; 
		o_Sig_RegWrite <= i_Sig_RegWrite;		
	end 
	
	always @(posedge reset) begin 
		o_Sig_Branch <= 0;
	end	
	
endmodule