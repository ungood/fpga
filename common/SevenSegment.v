module SevenSegment(
    input      [3:0] hex,
    output reg [6:0] display);

reg [6:0] inverted;

always @(hex) begin
    case(hex)
        4'h0 : inverted = 7'b0111111;
        4'h1 : inverted = 7'b0000110;
        4'h2 : inverted = 7'b1011011;
        4'h3 : inverted = 7'b1001111;
        4'h4 : inverted = 7'b1100110;
        4'h5 : inverted = 7'b1101101;
        4'h6 : inverted = 7'b1111101;
        4'h7 : inverted = 7'b0000111;
        4'h8 : inverted = 7'b1111111;
        4'h9 : inverted = 7'b1101111;
        4'ha : inverted = 7'b1110111;
        4'hb : inverted = 7'b1111100;
        4'hc : inverted = 7'b0111001;
        4'hd : inverted = 7'b1011110;
        4'he : inverted = 7'b1111001;
        4'hf : inverted = 7'b1110001;
        default : inverted = 7'b0000000;
    endcase
    
    display = ~inverted;
end

endmodule