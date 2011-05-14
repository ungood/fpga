module PulseGenerator(
    input start,
    input [1:0] load,
    input clk,
    output q);
    
    reg [1:0] counter;
    
    //wire pulse;
    //ClockDivider #(25_000_000)
    //    (clk, pulse);
    
    always @(posedge clk or posedge start)
    begin
        if(start)
            counter <= load;
        else if(counter > 1'b0)
            counter <= counter - 1'b1;
        else
            counter <= 0;
    end
    
    assign q = counter > 0;
endmodule
    