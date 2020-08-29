module mips(
	clk,
	reset
    );
	
	input clk;
	input reset;

	wire [15:0] w_Pc_Plus_2;
	wire [15:0] w_Instruction;
	wire [15:0] w_If_Pc_Plus_2;			    
	wire [15:0] w_If_Instruction;		    
	wire w_If_Sig_RegWrite;				    
	wire [2:0] w_Mem_Write_Register;     	
    wire [15:0] w_Mem_Write_Data;			
	wire w_Mem_Sig_PCSrc;			 	   
	wire [15:0] w_A; 
    wire [15:0] w_B;	
	wire [15:0] w_extended_Immediate;
	wire w_Sig_RegDst;
	wire w_Sig_ALUSrc;
	wire w_Sig_MemtoReg;
	wire w_Sig_RegWrite;
	wire w_Sig_MemRead;
	wire w_Sig_MemWrite;
	wire w_Sig_Branch;
	wire [1:0] w_Sigs_ALUOp;
	wire [15:0] w_Id_Pc_Plus_2;
	wire [15:0] w_Id_A; 
    wire [15:0] w_Id_B;	
	wire [15:0] w_Id_extended_Immediate;
	wire w_Id_Sig_RegDst;
	wire w_Id_Sig_ALUSrc;
	wire w_Id_Sig_MemtoReg;
	wire w_Id_Sig_RegWrite;
	wire w_Id_Sig_MemRead;
	wire w_Id_Sig_MemWrite;
	wire w_Id_Sig_Branch;
	wire [1:0] w_Id_Sigs_ALUOp;
	wire [2:0] w_Id_Rt;
	wire [2:0] w_Id_Rd;
	wire w_ALU_Zero;
	wire [15:0] w_ALU_Result;
	wire w_Ex_Sig_MemRead;
	wire w_Ex_Sig_MemWrite;
	wire w_Ex_Sig_MemtoReg;
	wire w_Ex_Sig_RegWrite;
	wire w_Ex_Sig_Branch;
	wire [15:0] w_Ex_Branch_Target;
	wire [15:0] w_Ex_ALU_Result;
	wire w_Ex_ALU_Zero;
	wire [15:0] w_Ex_Write_Data;
	wire [2:0] w_Ex_Write_Register;
	wire [15:0] w_Branch_Target;
	wire [2:0] w_Write_Register;
	wire [15:0] w_Read_Data;
	wire w_Mem_Sig_MemtoReg;
	wire [15:0] w_Mem_ALU_Result;
	wire [15:0] w_Mem_Read_Data;
	wire w_Mem_Sig_RegWrite;
	
    wire [15:0] w_Shift_Immediate = w_Id_extended_Immediate << 1;
    assign  w_Mem_Sig_PCSrc = w_Ex_Sig_Branch & w_Ex_ALU_Zero;

    fetch_stage Fetch_Stage (
        .clk(clk),  
        .i_Sig_PCSrc(w_Mem_Sig_PCSrc), 
        .i_Branch_Target(w_Ex_Branch_Target), 
        .o_Pc_Plus_2(w_Pc_Plus_2), 
        .o_Instruction(w_Instruction)
        );

    if_id If_Id (
        .clk(clk), 
        .i_Pc_Plus_2(w_Pc_Plus_2), 
        .i_Instruction(w_Instruction), 
        .o_Pc_Plus_2(w_If_Pc_Plus_2), 
        .o_Instruction(w_If_Instruction)
        );

    decode_stage Decode_Stage (
        .clk(clk), 
        .i_Sig_RegWrite(w_Mem_Sig_RegWrite), 
        .i_Instruction(w_If_Instruction), 
        .i_Write_Register(w_Mem_Write_Register), 
        .i_Write_Data(w_Mem_Write_Data), 
        .o_A(w_A), 
        .o_B(w_B), 
        .o_extended_Immediate(w_extended_Immediate), 
        .o_Sig_RegDst(w_Sig_RegDst), 
        .o_Sig_ALUSrc(w_Sig_ALUSrc), 
        .o_Sig_MemtoReg(w_Sig_MemtoReg), 
        .o_Sig_RegWrite(w_Sig_RegWrite), 
        .o_Sig_MemRead(w_Sig_MemRead), 
        .o_Sig_MemWrite(w_Sig_MemWrite), 
        .o_Sig_Branch(w_Sig_Branch), 
        .o_Sigs_ALUOp(w_Sigs_ALUOp)
        );

    id_ex Id_Ex (
        .clk(clk), 
        .reset(reset),
        .i_Pc_Plus_2(w_If_Pc_Plus_2), 
        .i_A(w_A), 
        .i_B(w_B), 
        .i_Immediate(w_extended_Immediate), 
        .i_Sig_ALUSrc(w_Sig_ALUSrc), 
        .i_Sigs_ALUOp(w_Sigs_ALUOp), 
        .i_Sig_RegDst(w_Sig_RegDst), 
        .i_Rt(w_If_Instruction[9:7]), 
        .i_Rd(w_If_Instruction[6:4]), 
        .i_Sig_MemRead(w_Sig_MemRead), 
        .i_Sig_MemWrite(w_Sig_MemWrite), 
        .i_Sig_Branch(w_Sig_Branch), 
        .i_Sig_MemtoReg(w_Sig_MemtoReg), 
        .i_Sig_RegWrite(w_Sig_RegWrite), 
        .o_Pc_Plus_2(w_Id_Pc_Plus_2), 
        .o_A(w_Id_A), 
        .o_B(w_Id_B), 
        .o_Immediate(w_Id_extended_Immediate), 
        .o_Sig_ALUSrc(w_Id_Sig_ALUSrc), 
        .o_Sigs_ALUOp(w_Id_Sigs_ALUOp), 
        .o_Sig_RegDst(w_Id_Sig_RegDst), 
        .o_Rt(w_Id_Rt), 
        .o_Rd(w_Id_Rd), 
        .o_Sig_MemRead(w_Id_Sig_MemRead), 
        .o_Sig_MemWrite(w_Id_Sig_MemWrite), 
        .o_Sig_Branch(w_Id_Sig_Branch), 
        .o_Sig_MemtoReg(w_Id_Sig_MemtoReg), 
        .o_Sig_RegWrite(w_Id_Sig_RegWrite)
        );

    execute_stage Execute_Stage (
        .i_A(w_Id_A), 
        .i_B(w_Id_B), 
        .i_Immediate(w_Id_extended_Immediate), 
        .i_Sig_ALUSrc(w_Id_Sig_ALUSrc), 
        .i_Sigs_ALUOp(w_Id_Sigs_ALUOp), 
        .o_ALU_Zero(w_ALU_Zero), 
        .o_ALU_Result(w_ALU_Result)
        );

    adder Adder (
        .i_A(w_Shift_Immediate), 
        .i_B(w_Id_Pc_Plus_2), 
        .o_Output(w_Branch_Target)
        );

    mux #(.N(3)) Write_Register_Mux (
        .i_Sig_Select(w_Id_Sig_RegDst), 
        .i_A(w_Id_Rt), 
        .i_B(w_Id_Rd), 
        .o_Output(w_Write_Register)
        );

    ex_mem Ex_Mem (
        .clk(clk), 
        .reset(reset),
        .i_Sig_MemRead(w_Id_Sig_MemRead), 
        .i_Sig_MemWrite(w_Id_Sig_MemWrite), 
        .i_Sig_MemtoReg(w_Id_Sig_MemtoReg), 
        .i_Sig_RegWrite(w_Id_Sig_RegWrite), 
        .i_Sig_Branch(w_Id_Sig_Branch), 
        .i_Branch_Target(w_Branch_Target), 
        .i_ALU_Result(w_ALU_Result), 
        .i_ALU_Zero(w_ALU_Zero), 
        .i_Write_Data(w_Id_B), 
        .i_Write_Register(w_Write_Register), 
        .o_Sig_MemRead(w_Ex_Sig_MemRead), 
        .o_Sig_MemWrite(w_Ex_Sig_MemWrite), 
        .o_Sig_MemtoReg(w_Ex_Sig_MemtoReg), 
        .o_Sig_RegWrite(w_Ex_Sig_RegWrite), 
        .o_Sig_Branch(w_Ex_Sig_Branch), 
        .o_Branch_Target(w_Ex_Branch_Target), 
        .o_ALU_Result(w_Ex_ALU_Result), 
        .o_ALU_Zero(w_Ex_ALU_Zero), 
        .o_Write_Data(w_Ex_Write_Data), 
        .o_Write_Register(w_Ex_Write_Register)
        );

    memory_stage Memory_Stage (
        .clk(clk), 
        .i_Sig_MemRead(w_Ex_Sig_MemRead), 
        .i_Sig_MemWrite(w_Ex_Sig_MemWrite), 
        .i_Address(w_Ex_ALU_Result), 
        .i_Write_Data(w_Ex_Write_Data), 
        .o_Read_Data(w_Read_Data)
        );

    mem_wb Mem_Wb (
        .clk(clk), 
        .i_Write_Register(w_Ex_Write_Register),
        .i_Sig_MemtoReg(w_Ex_Sig_MemtoReg),
        .i_Sig_RegWrite(w_Ex_Sig_RegWrite), 
        .i_Read_Data(w_Read_Data), 
        .i_ALU_Result(w_Ex_ALU_Result), 
        .o_Sig_MemtoReg(w_Mem_Sig_MemtoReg), 
        .o_Read_Data(w_Mem_Read_Data), 
        .o_ALU_Result(w_Mem_ALU_Result),
        .o_Write_Register(w_Mem_Write_Register),
        .o_Sig_RegWrite(w_Mem_Sig_RegWrite) 
        );

    mux Write_Data_Mux (
        .i_Sig_Select(w_Mem_Sig_MemtoReg), 
        .i_A(w_Mem_ALU_Result), 
        .i_B(w_Mem_Read_Data),
        .o_Output(w_Mem_Write_Data)
        );

endmodule