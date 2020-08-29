module adder#(parameter N = 16)(
	i_A,
	i_B,
	o_Output
	);
	
	input [N-1:0] i_A;
	input [N-1:0] i_B;
	output [N-1:0] o_Output;
	
	assign o_Output = i_A + i_B;

endmodule