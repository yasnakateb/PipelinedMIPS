module register_file(
	clk,
	i_Sig_RegWrite,
	i_Write_Register,
	i_Write_Data,
	i_Rs,
	i_Rt,
	o_A,
	o_B
    );
	
	input clk;
	input i_Sig_RegWrite;
	input [2:0] i_Write_Register;
	input [15:0] i_Write_Data;
	input [2:0] i_Rs;
	input [2:0] i_Rt;
	output [15:0] o_A;
	output [15:0] o_B;
	
	reg [15:0] r_registers [7:0];
	initial r_registers[0] = 0;
	
	integer i = 0;
	
	initial begin 
		for( i = 1; i < 8; i = i + 1)
			r_registers[i] = 0;
	end
	
	assign o_A = r_registers[i_Rs];
	assign o_B = r_registers[i_Rt];
	
	always @( posedge clk) begin 
		if( i_Write_Register == 0)
			$display("You can not change zero register o_O");
		else begin
			if( i_Sig_RegWrite == 1)
				r_registers[i_Write_Register] = i_Write_Data;
		end
	end
	
endmodule