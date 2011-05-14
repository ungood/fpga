module OneHertz(
    input      clkIn,
    output reg clkOut);
    
    reg   [25:0] counter;
        
    always @(posedge clkIn) begin
        counter <= counter + 1;
        if(counter == 25'd25000000) begin
            counter <= 0;
            clkOut <= ~clkOut;
        end
    end
 endmodule
 