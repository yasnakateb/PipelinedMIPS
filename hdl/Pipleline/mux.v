module mux #(parameter N = 16)(
    i_Sig_Select,
    i_A,
    i_B,
    o_Output
    );
    
    input i_Sig_Select;
    input [N-1:0] i_A;
    input [N-1:0] i_B;
    output [N-1:0] o_Output;
    
    assign o_Output = i_Sig_Select ? i_B : i_A;

endmodule