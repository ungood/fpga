module Lab4Ex4(
    input CLOCK_50,
    output [6:0] HEX0);
    
    wire oneHertz;
    wire [3:0] counter;
    
    OneHertz(CLOCK_50, oneHertz);
    Counter4(1'b1, 1'b1, oneHertz, counter);
    SevenSegment(counter, HEX0);
endmodule
