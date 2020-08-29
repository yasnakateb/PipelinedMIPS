module mem_wb(
	clk,
	i_Sig_RegWrite,
	i_Write_Register,
	i_Sig_MemtoReg,
	i_Read_Data,
	i_ALU_Result,
	o_Sig_MemtoReg,
	o_Read_Data,
	o_ALU_Result,
	o_Write_Register,
	o_Sig_RegWrite
	);
	
	input clk;
	input i_Sig_MemtoReg;
	input i_Sig_RegWrite;
	input [2:0] i_Write_Register;
	input [15:0] i_Read_Data;
	input [15:0] i_ALU_Result;
	output reg o_Sig_MemtoReg;
	output reg [15:0] o_Read_Data;
	output reg [15:0] o_ALU_Result;
	output reg [2:0] o_Write_Register;
	output reg o_Sig_RegWrite;
	
	always @( negedge clk) begin 
		o_Sig_MemtoReg <= i_Sig_MemtoReg;
		o_Read_Data <= i_Read_Data;
		o_ALU_Result <= i_ALU_Result;
		o_Write_Register <= i_Write_Register;
		o_Sig_RegWrite <= i_Sig_RegWrite;
	end 

endmodule