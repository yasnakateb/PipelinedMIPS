module sign_extend(
	i_Immediate,
	o_extended_Immediate
	);
	
	input [6:0] i_Immediate;
	output [15:0] o_extended_Immediate;
	
	assign o_extended_Immediate = {{11{i_Immediate[6]}}, i_Immediate[6:0]};

endmodule