module fetch_stage(
	clk,
	i_Sig_PCSrc,
	i_Branch_Target,
	o_Pc_Plus_2,
	o_Instruction
    );
	
	input clk;
	input i_Sig_PCSrc;
	input [15:0] i_Branch_Target;
	output [15:0] o_Pc_Plus_2;
	output [15:0] o_Instruction;

	wire [15:0] w_Instruction_Address;
	wire [15:0] w_Next_Instruction_Address;
	
	assign o_Pc_Plus_2 = w_Instruction_Address + 2;

    pc_mux Pc_Mux (
        .i_Sig_Select(i_Sig_PCSrc), 
        .i_J(o_Instruction),
        .i_A(o_Pc_Plus_2), 
        .i_B(i_Branch_Target), 
        .o_Output(w_Next_Instruction_Address)
        );

    pc Pc_Reg (
        .clk(clk), 
        .i_Next_Ins_Address(w_Next_Instruction_Address), 
        .o_Ins_Address(w_Instruction_Address)
        );
        
    instruction_memory  Instruction_Memory (
        .i_Address(w_Instruction_Address), 
        .o_Instruction(o_Instruction)
        );

endmodule