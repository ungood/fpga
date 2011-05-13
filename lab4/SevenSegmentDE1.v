// Displays one of the following characters depending
// on input: d, E, 1, blank
module SevenSegmentDE1(
    input  [1:0] c,
    output [6:0] hex);
    
    assign hex[0] = c[0] | ~c[1];
    assign hex[1] = c[1];
    assign hex[2] = c[1];
    assign hex[3] = c[0];
    assign hex[4] = c[0];
    assign hex[5] = c[0] | ~c[1];
    assign hex[6] = c[0];
endmodule
