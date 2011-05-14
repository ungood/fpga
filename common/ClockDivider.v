module ClockDivider(
    input      clkIn,
    output reg clkOut);
    
    parameter DIVIDER = 50_000_000;
    localparam MAX = DIVIDER / 2;
    localparam WIDTH  = $clog2(MAX);
    
    reg   [WIDTH-1:0] counter;
        
    always @(posedge clkIn) begin
        counter <= counter + 1;
        if(counter == MAX) begin
            counter <= 0;
            clkOut <= ~clkOut;
        end
    end
    
    //assign out_clk = (counter < 25'd25000000) ? 0 : 1;
 endmodule
 