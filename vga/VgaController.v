module VgaController(
    input        clk,
    output       _hSync,
    output       _vSync,
    output reg [3:0] r,
    output reg [3:0] g,
    output reg [3:0] b);
    
    wire isVisible;
    wire [9:0] x, y;
    
    VgaSyncGenerator sync0(
        .clk(clk),
        ._hSync(_hSync),
        ._vSync(_vSync),
        .isVisible(isVisible),
        .counterX(x),
        .counterY(y));
    
    always @(posedge clk) begin
        r <= isVisible ? x[3:0] : 0;
        g <= isVisible ? y[5:2] : 0;
        b <= isVisible ? 4'h0 : 0;
    end
endmodule