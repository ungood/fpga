module mux_2x2(out, a, b, s);
    input [1:0] a, b;
    input s;
    output [1:0] out;
    
    assign out = s ? a : b;
endmodule

module mux_2x4(a, b, c, d, s, out);
    input  [1:0] a, b, c, d;
    input  [1:0] s;
    output [1:0] out;
    
    wire   [1:0] m0;
    wire   [1:0] m1;
    
    assign m0 = s[0] ? b : a;
    assign m1 = s[0] ? d : c;
    assign out = s[1] ? m1 : m0;
endmodule

module lab1ex3(LEDG, LEDR, SW, KEY);
    input  [5:0] SW;
    input  [1:0] KEY;
    output [5:0] LEDR;
    output [1:0] LEDG;
    
    mux_2x4(
        .out(LEDG),
        .a(SW[1:0]),
        .b(SW[3:2]),
        .c(SW[5:4]),
        .d(2'b00),
        .s(KEY[1:0])
    );
endmodule
