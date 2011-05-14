module PulseShifter(
    input trigger,
    input reset_n,
    input [2:0] sizeIn,
    input [3:0] patternIn,
    input clk,
    output reg q,
    output reg [2:0] size,
    output reg [3:0] pattern,
    output reg [1:0] pulse);
       
    always @(posedge clk or negedge reset_n or posedge trigger)
    begin
        if(~reset_n)
        begin
            size    <= 'b0;
            pattern <= 'b0;
            pulse   <= 'b0;
            q       <= 'b0;
        end
        
        else if(trigger)
        begin
            size    <= sizeIn;
            pattern <= patternIn;
            pulse   <= 'b0;
            q       <= 'b0;
        end
        
        else if(pulse > 2'b00)
        begin
            q       <= 'b1;
            pulse   <= pulse - 1'b1;
            size    <= size;
            pattern <= pattern;
        end
        
        else if(size > 3'b000)
        begin
            size    <= size - 1'b1;
            pulse   <= pattern[0] ? 2'd3 : 2'd1;
            pattern <= {1'b0, pattern[3:1]};
            q       <= 'b0;
        end
        
        else
        begin
            size    <= 'b0;
            pattern <= 'b0;
            q       <= 'b0;
            pulse   <= 'b0;
        end
    end
endmodule
