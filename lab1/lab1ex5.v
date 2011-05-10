module rotate(a, b, c, d, s, hex);

input  [1:0] a, b, c, d, s;
output [6:0] hex;

wire   [1:0] m;

mux_2x4 u0 (a, b, c, d, s, m);
seven_segment u1 (m, hex);

endmodule

/***************/
module lab1ex5 (SW, HEX3, HEX2, HEX1, HEX0);

input  [9:0] SW;
output [6:0] HEX3;
output [6:0] HEX2;
output [6:0] HEX1;
output [6:0] HEX0;

wire [1:0] c2;
wire [1:0] c1;
wire [1:0] c0;

rotate(SW[1:0], SW[7:6], SW[5:4], SW[3:2], SW[9:8], HEX0);
rotate(SW[3:2], SW[1:0], SW[7:6], SW[5:4], SW[9:8], HEX1);
rotate(SW[5:4], SW[3:2], SW[1:0], SW[7:6], SW[9:8], HEX2);
rotate(SW[7:6], SW[5:4], SW[3:2], SW[1:0], SW[9:8], HEX3);

endmodule
