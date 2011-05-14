module Lab5Ex4(
    input CLOCK_50,
    input [1:0] KEY,
    input [2:0] SW,
    output [9:0] LEDR,
    output [7:0] LEDG,
    output [6:0] HEX0, HEX1);
    
    wire clk;
    ClockDivider #(15_500_000) (CLOCK_50, clk);
    
    wire [2:0] sizeIn;
    wire [2:0] size;
    wire [3:0] patternIn;
    MorseLetter morse0(SW[2:0], sizeIn, patternIn);
    
    PulseShifter(
        .trigger(~KEY[1]),
        .reset_n(KEY[0]),
        .clk(clk),
        .sizeIn(sizeIn),
        .patternIn(patternIn),
        .q(LEDG[0]),
        .size(size),
        .pattern(LEDR[5:2]),
        .pulse(LEDR[1:0]));
    
    SevenSegment({1'b0, sizeIn}, HEX0);
    SevenSegment({1'b0, size}, HEX1);
    assign LEDR[9:6] = patternIn;
endmodule
