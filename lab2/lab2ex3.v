module adder(
    input  a,
    input  b,
    input  c_in,
    output sum,
    output c_out);
    
    wire a_b;
    
    assign a_b   = a ^ b;
    
    assign sum   = c_in ^ (a_b);
    assign c_out = a_b ? c_in : b;
endmodule

module adder4(
    input  [3:0] a,
    input  [3:0] b,
    input        c_in,
    output [3:0] sum,
    output       c_out);
    
    wire   [3:0] carry;
    
    adder(a[0], b[0],     c_in, sum[0], carry[0]);
    adder(a[1], b[1], carry[0], sum[1], carry[1]);
    adder(a[2], b[2], carry[1], sum[2], carry[2]);
    adder(a[3], b[3], carry[2], sum[3], carry[3]);
    
    assign c_out = carry[3];
endmodule
/*
module lab2ex3(
    input  [9:0] SW,
    output [9:0] LEDR);
    
    adder(SW[2], SW[1], SW[0], LEDR[1], LEDR[0]);
endmodule
*/
module lab2ex3(
    input  [9:0] SW,
    output [6:0] HEX0,
    output [6:0] HEX1,
    output [6:0] HEX2,
    output [6:0] HEX3,
    output [9:0] LEDR);
    
    wire   [4:0] sum;
    wire         carry;
    
    assign HEX1 = 6'hff;
    
    hex7segment(SW[9:6], HEX3);
    hex7segment(SW[5:2], HEX2);
    
    adder4(SW[9:6], SW[5:2], SW[0], sum, carry);
    
    hex7segment(sum, HEX0);
    assign LEDR[5] = carry;
endmodule
