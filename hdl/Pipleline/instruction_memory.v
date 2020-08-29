module instruction_memory(
	i_Address,
	o_Instruction
    );
	
	input [15:0] i_Address;
	output [15:0] o_Instruction;
	
	parameter DATA_WIDTH = 256;
    
	reg [7:0] memory [0:DATA_WIDTH-1];
    
    initial begin 
        $readmemb("rams_init_file.hex", memory, 0, DATA_WIDTH-1);
    end

	assign o_Instruction = { memory[i_Address], memory[i_Address + 1] };
	
endmodule