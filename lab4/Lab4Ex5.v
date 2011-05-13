module Lab4Ex5(
    input CLOCK_50,
    input [9:0] SW,
    output [6:0] HEX3, HEX2, HEX1, HEX0);
    
    reg [1:0] counter;
    wire oneHertz;
    
    OneHertz(CLOCK_50, oneHertz);
    
    always @(posedge oneHertz)
        if(SW[0])
            counter <= counter + 1;
    
    SevenSegmentDE1(counter    , HEX3);
    SevenSegmentDE1(counter + 1, HEX2);
    SevenSegmentDE1(counter + 2, HEX1);
    SevenSegmentDE1(counter + 3, HEX0);

endmodule
    