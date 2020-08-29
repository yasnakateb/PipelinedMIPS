module ALU_control(
    i_ALUOp,
    i_Function,
    o_ALU_Control
    );
    
    input [1:0] i_ALUOp;
    input [3:0] i_Function;
    output [2:0] o_ALU_Control;

    assign o_ALU_Control =  (i_ALUOp == 2'b00) ?    (i_Function == 4'b0000) ? 3'b000 : // R-type(add)
                                                    (i_Function == 4'b0001) ? 3'b001 : // R-type(sub)
                                                    (i_Function == 4'b0010) ? 3'b101 : // R-type(and)
                                                    (i_Function == 4'b0011) ? 3'b110 : // R-type(or)
                                                    (i_Function == 4'b0100) ? 3'b111 : // R-type(slt)
                                                    3'b000 :
                            (i_ALUOp == 2'b01) ? 3'b001 :                              // I-type(beq) 
                            (i_ALUOp == 2'b10) ? 3'b111 :                              // I-type(slti)
                            3'b000;                                                    // I-type(addi, sw, lw)

endmodule