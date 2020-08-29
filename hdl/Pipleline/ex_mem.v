module ex_mem(
    clk,
    reset,
    i_Sig_MemRead,
    i_Sig_MemWrite,
    i_Sig_MemtoReg,
    i_Sig_RegWrite,
    i_Sig_Branch,
    i_Branch_Target,
    i_ALU_Result,
    i_ALU_Zero,
    i_Write_Data,
    i_Write_Register,
    o_Sig_MemRead,
    o_Sig_MemWrite,
    o_Sig_MemtoReg,
    o_Sig_RegWrite,
    o_Sig_Branch,
    o_Branch_Target,
    o_ALU_Result,
    o_ALU_Zero,
    o_Write_Data,
    o_Write_Register
    );
    
    input clk;
    input reset;
    input i_Sig_MemRead;
    input i_Sig_MemWrite;
    input i_Sig_MemtoReg;
    input i_Sig_RegWrite;
    input i_Sig_Branch;
    input [15:0] i_Branch_Target;
    input [15:0] i_ALU_Result;
    input i_ALU_Zero;
    input [15:0] i_Write_Data;
    input [2:0] i_Write_Register;
    output reg o_Sig_MemRead;
    output reg o_Sig_MemWrite;
    output reg o_Sig_MemtoReg;
    output reg o_Sig_RegWrite;
    output reg o_Sig_Branch;
    output reg [15:0] o_Branch_Target;
    output reg [15:0] o_ALU_Result;
    output reg o_ALU_Zero;
    output reg [15:0] o_Write_Data;
    output reg [2:0] o_Write_Register;
        
    always @(negedge clk) begin 
        o_Sig_MemRead <= i_Sig_MemRead;                
        o_Sig_MemWrite <= i_Sig_MemWrite;
        o_Sig_MemtoReg <=  i_Sig_MemtoReg;
        o_Sig_RegWrite <= i_Sig_RegWrite;
        o_Sig_Branch <= i_Sig_Branch;
        o_Branch_Target <= i_Branch_Target;
        o_ALU_Result <= i_ALU_Result;
        o_ALU_Zero <= i_ALU_Zero;
        o_Write_Data <= i_Write_Data;
        o_Write_Register <= i_Write_Register;
    end 
    
    always @(posedge reset) begin 
        o_Sig_Branch <= 0;
        o_ALU_Zero <= 0;
    end 
    
endmodule