module pc(
	clk,
	i_Next_Ins_Address,
	o_Ins_Address
	);
	
	input clk;
	input [15:0] i_Next_Ins_Address;
	output [15:0] o_Ins_Address;
	
	reg [15:0] r_pc_counter = 0;
	
	always @( posedge clk ) begin 
		r_pc_counter = i_Next_Ins_Address;
	end
	
	assign o_Ins_Address = r_pc_counter;

endmodule