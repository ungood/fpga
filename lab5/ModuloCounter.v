module ModuloCounter(
    input clk,
    input reset_n,
    input [WIDTH-1:0] load,
    input we,
    output reg [WIDTH-1:0] q,
    output reg carry);
    
    parameter WIDTH = 8;
    parameter K = 256;
    
    always @(posedge clk or negedge reset_n or posedge we)
    begin
        if(~reset_n)
        begin
            q <= 'd0;
            carry <= 0;
        end
        else if(we)
        begin
            q <= load;
            carry <= 0;
        end
        else if(q == K-1)
        begin
            q <= 'd0;
            carry <= 1;
        end
        else
        begin
            q <= q + 1'b1;
            carry <= 0;
        end
    end
 endmodule
 