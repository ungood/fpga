module Counter16(
    input enable,
    input _reset,
    input clk,
    output reg [15:0] out);
    
    always @(posedge clk) begin
        if(~_reset)
            out <= 16'hFF;
        else if(enable)
            out <= out + 1;
    end
    
 endmodule
 