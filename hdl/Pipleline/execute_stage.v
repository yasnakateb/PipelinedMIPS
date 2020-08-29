module execute_stage(
	i_A,
	i_B,
	i_Immediate,
	i_Sig_ALUSrc,
	i_Sigs_ALUOp,
	o_ALU_Zero,
	o_ALU_Result
    );
	
	input [15:0] i_A;
	input [15:0] i_B;
	input [15:0] i_Immediate;
	input i_Sig_ALUSrc;
	input [1:0] i_Sigs_ALUOp;
	output o_ALU_Zero;
	output [15:0] o_ALU_Result;

	wire [2:0] w_ALU_Control;
	wire [15:0] w_ALU_Src_B;
	
    ALU_control Alu_Control (
        .i_ALUOp(i_Sigs_ALUOp), 
        .i_Function(i_Immediate[3:0]), 
        .o_ALU_Control(w_ALU_Control)
        );
        
    mux Alu_Mux (
        .i_Sig_Select(i_Sig_ALUSrc), 
        .i_A(i_B), 
        .i_B(i_Immediate), 
        .o_Output( w_ALU_Src_B)
        );
   
    ALU Alu (
        .i_A(i_A), 
        .i_B( w_ALU_Src_B), 
        .i_Sigs_Control(w_ALU_Control), 
        .o_ALU_Zero(o_ALU_Zero), 
        .o_ALU_Result(o_ALU_Result)
        );

endmodule