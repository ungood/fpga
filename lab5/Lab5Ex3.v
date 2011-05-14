module Lab5Ex3(
    input CLOCK_50,
    input [9:0] SW,
    input [3:0] KEY,
    output [6:0] HEX3, HEX2, HEX1, HEX0);
    
    wire [3:0] digits [3:0];
    wire carries [3:0];
    
    ClockDivider(CLOCK_50, oneHertz);
    
    // Seconds
    ModuloCounter #(4, 10)(
        .clk(oneHertz),
        .reset_n(1'b1),
        .load('b0),
        .we(~KEY[0]),
        .q(digits[0]),
        .carry(carries[0]));
    ModuloCounter #(4, 6)(
        .clk(carries[0]),
        .reset_n(1'b1),
        .load('b0),
        .we(~KEY[0]),
        .q(digits[1]),
        .carry(carries[1]));
    
    // Minutes
    ModuloCounter #(4, 10)(
        .clk(carries[1]),
        .reset_n(1'b1),
        .load(SW[3:0]),
        .we(~KEY[0]),
        .q(digits[2]),
        .carry(carries[2]));
    ModuloCounter #(4, 10)(
        .clk(carries[2]),
        .reset_n(1'b1),
        .load(SW[7:4]),
        .we(~KEY[0]),
        .q(digits[3]),
        .carry(carries[3]));
    
    SevenSegment(digits[3], HEX3);    
    SevenSegment(digits[2], HEX2);
    SevenSegment(digits[1], HEX1);
    SevenSegment(digits[0], HEX0);

endmodule
