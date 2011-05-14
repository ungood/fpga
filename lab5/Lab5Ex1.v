module Lab5Ex1(
    input [3:0] KEY,
    output [9:0] LEDR);
    
    ModuloCounter #(
        .WIDTH(8),
        .K(31)
    )(
        .reset_n(KEY[0]),
        .clk(KEY[1]),
        .q(LEDR[7:0])
    );
    
endmodule
