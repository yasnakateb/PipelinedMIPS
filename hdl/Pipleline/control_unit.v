module control_unit(
	i_Opcode,
	o_Sig_RegDst,
	o_Sig_ALUSrc,
	o_Sig_MemtoReg,
	o_Sig_RegWrite,
	o_Sig_MemRead,
	o_Sig_MemWrite,
	o_Sig_Branch,
	o_Sigs_ALUOp
   	);
	
	input [2:0] i_Opcode;
	output o_Sig_RegDst;
	output o_Sig_ALUSrc;
	output o_Sig_MemtoReg;
	output o_Sig_RegWrite;
	output o_Sig_MemRead;
	output o_Sig_MemWrite;
	output o_Sig_Branch;
	output [1:0] o_Sigs_ALUOp;
	
	assign o_Sig_RegDst = ( i_Opcode == 3'b000) ? 1 : 0;

	assign o_Sig_ALUSrc = ( i_Opcode == 3'b100 ||  
							i_Opcode == 3'b101 ||  
							i_Opcode == 3'b111 ||  
							i_Opcode == 3'b001 ) ? 1 : 0;

	assign o_Sig_MemtoReg = ( i_Opcode == 3'b100 ) ? 1 : 0;

	assign o_Sig_RegWrite = ( i_Opcode == 3'b000 ||  
							  i_Opcode == 3'b100 ||  
							  i_Opcode == 3'b001 || 
							  i_Opcode == 3'b111) ? 1 : 0;

	assign o_Sig_MemRead = ( i_Opcode == 3'b100 ) ? 1 : 0;

	assign o_Sig_MemWrite = ( i_Opcode == 3'b101 ) ? 1 : 0;

	assign o_Sig_Branch = ( i_Opcode == 3'b110 ) ? 1 : 0;

	assign o_Sigs_ALUOp = ( i_Opcode == 3'b000) ? 2'b00 :
						  ( i_Opcode == 3'b100 || 
						  	i_Opcode == 3'b101 || 
							i_Opcode == 3'b111 ) ? 2'b11 :
						  ( i_Opcode == 3'b110) ? 2'b01 :
						  ( i_Opcode == 3'b001)? 2'b10 :
						  2'bxx;
	
endmodule