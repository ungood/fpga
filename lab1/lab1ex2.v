module mux_1x2(out, a, b, s);
    input a, b, s;
    output out;
    
    assign out = s ? a : b;
endmodule

module mux_4x2(out, a, b, s);
    input  [0:3] a, b;
    input        s;
    output [0:3] out;
    
    mux_1x2(out[0], a[0], b[0], s);
    mux_1x2(out[1], a[1], b[1], s);
    mux_1x2(out[2], a[2], b[2], s);
    mux_1x2(out[3], a[3], b[3], s);
endmodule

module lab1ex2(LEDG, LEDR, SW, KEY);
    input  [7:0] SW;
    input  [0:0] KEY;
    output [7:0] LEDR;
    output [4:0] LEDG;
    
    assign LEDR = SW;
    mux_4x2(
        .out(LEDG[3:0]),
        .a(SW[3:0]),
        .b(SW[7:4]),
        .s(KEY[0])
    );
endmodule 