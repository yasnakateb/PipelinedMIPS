module data_memory(
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
    
    reg [7:0] memory [1024:0];
    reg [15:0] r_Read_Data;
    
    integer i;

    initial begin 
        for( i = 0; i < 1024; i = i + 2)
            memory[i] = 0;

        for( i = 1; i < 1024; i = i + 2)
            memory[i] = 1;
    end
    
    always@(posedge clk) begin 
        if( i_Sig_MemRead ^ i_Sig_MemWrite == 0)
            r_Read_Data = 16'bx;
        
        else if( i_Sig_MemRead == 1)
            r_Read_Data = {memory [i_Address], memory[i_Address + 1]}; 
        
        else if(i_Sig_MemWrite == 1) begin 
            memory[i_Address] = i_Write_Data[15:8];
            memory[i_Address+1] = i_Write_Data[7:0];    
        end
        
        else
            r_Read_Data = 16'bx;
    
    end
    
    assign o_Read_Data = r_Read_Data;

endmodule