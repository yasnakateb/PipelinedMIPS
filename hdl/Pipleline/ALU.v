module ALU(
	i_A,
	i_B,
	i_Sigs_Control,
	o_ALU_Zero,
	o_ALU_Result
    );
	
	input [15:0] i_A;
	input [15:0] i_B;
	input [2:0] i_Sigs_Control;
	output o_ALU_Zero;
	output [15:0] o_ALU_Result;
	
	assign o_ALU_Result = (i_Sigs_Control == 3'b000) ? (i_A + i_B)						// ADD
						: (i_Sigs_Control == 3'b001) ? (i_A - i_B)						// SUB
						: (i_Sigs_Control == 3'b101) ? (i_A & i_B)						// AND
						: (i_Sigs_Control == 3'b110) ? (i_A | i_B)						// OR
						: (i_Sigs_Control == 3'b111) ? ((i_A < i_B) ? 1 : 0 ): 16'bx;	// SLT
	
	assign o_ALU_Zero = (o_ALU_Result == 0) ? 1 : 0;

endmodule