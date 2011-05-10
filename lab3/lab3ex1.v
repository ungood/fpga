module lab3ex1(
    input clk,
    input r,
    input s,
    output q);
    
    wire rg, sg, qa, qb /* synthesis keep */;
    
    and(rg, r, clk);
    and(sg, s, clk);
    nor(qa, rg, qb);
    nor(qb, sg, qa);
    
    assign q = qa;
endmodule
