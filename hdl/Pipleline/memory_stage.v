module memory_stage(
    clk,
    i_Sig_MemRead,
    i_Sig_MemWrite,
    i_Address,
    i_Write_Data,
    o_Read_Data
    );
    
    input clk;
    input i_Sig_MemRead;
    input i_Sig_MemWrite;
    input [15:0] i_Address;
    input [15:0] i_Write_Data;
    output [15:0] o_Read_Data;
    
    data_memory Data_Memory (
        .clk(clk), 
        .i_Sig_MemRead(i_Sig_MemRead), 
        .i_Sig_MemWrite(i_Sig_MemWrite), 
        .i_Address(i_Address), 
        .i_Write_Data(i_Write_Data), 
        .o_Read_Data(o_Read_Data)
        );

endmodule