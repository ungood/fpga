module Lab5Ex2(
    input CLOCK_50,
    output [6:0] HEX2, HEX1, HEX0);
    
    wire oneHertz;
    wire [2:0] carries;
    wire [3:0] digits [2:0];
        
    OneHertz(CLOCK_50, oneHertz);
    
    ModuloCounter #(4, 10)(
        .clk(oneHertz),
        .reset_n(1'b1),
        .q(digits[0]),
        .carry(carries[0]));
    ModuloCounter #(4, 10)(
        .clk(carries[0]),
        .reset_n(1'b1),
        .q(digits[1]),
        .carry(carries[1]));
    ModuloCounter #(4, 10)(
        .clk(carries[1]),
        .reset_n(1'b1),
        .q(digits[2]),
        .carry(carries[2]));
        
    SevenSegment(digits[2], HEX2);
    SevenSegment(digits[1], HEX1);
    SevenSegment(digits[0], HEX0);
endmodule
