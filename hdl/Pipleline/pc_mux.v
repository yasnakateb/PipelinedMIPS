module pc_mux(
	i_Sig_Select,
	i_J,
	i_A,
	i_B,
	o_Output
	);
	
	input i_Sig_Select;
	input [15:0] i_J;
	input [15:0] i_A;
	input [15:0] i_B;
	output [15:0] o_Output;
	
	assign o_Output = (i_J[15:13] == 3'b010) ? {3'b0, i_J[12:0]} : (( i_Sig_Select) ? i_B : i_A);

endmodule