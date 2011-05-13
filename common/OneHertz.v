module OneHertz(
    input      clkIn,
    output reg clkOut);
    
    reg   [24:0] counter;
    
    always @(posedge clkIn) begin
        counter <= counter + 25'h0000001;
        if(counter == 25'd25000000) begin
            counter <= 0;
            clkOut <= ~clkOut;
        end
    end
    
    //assign out_clk = (counter < 25'd25000000) ? 0 : 1;
 endmodule
 