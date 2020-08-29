module if_id(
    clk,
    i_Pc_Plus_2,
    i_Instruction,
    o_Pc_Plus_2,
    o_Instruction
    );
    
    input clk;
    input [15:0] i_Pc_Plus_2;
    input [15:0] i_Instruction;
    output reg [15:0] o_Pc_Plus_2;
    output reg [15:0] o_Instruction;
    
    always @(negedge clk) begin 
        o_Pc_Plus_2 <= i_Pc_Plus_2;
        o_Instruction <= i_Instruction;
    end 
    
endmodule