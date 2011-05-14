module MorseLetter(
    input [2:0] letter,
    output reg [2:0] letterSize,
    output reg [3:0] letterPattern);
    
    always @(letter)
    begin
        case(letter)
            3'd0 : begin // A
                letterSize    <= 3'd2;
                letterPattern <= 4'b0010;
                end
            3'd1 : begin // B
                letterSize    <= 3'd4;
                letterPattern <= 4'b0001;
                end
            3'd2 : begin // C
                letterSize    <= 3'd4;
                letterPattern <= 4'b0101;
                end
            3'd3 : begin // D
                letterSize    <= 3'd3;
                letterPattern <= 4'b0001;
                end
            3'd4 : begin // E
                letterSize    <= 3'd1;
                letterPattern <= 4'b0;
                end
            3'd5 : begin// F
                letterSize    <= 3'd4;
                letterPattern <= 4'b0100;
                end
            3'd6 : begin // G
                letterSize    <= 3'd3;
                letterPattern <= 4'b0011;
                end
            3'd7 : begin // H
                letterSize    <= 3'd4;
                letterPattern <= 4'b0000;
                end
            default: begin
                letterSize    <= 'b0;
                letterPattern <= 'b0;
                end
        endcase
    end
endmodule   
    