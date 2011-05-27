module DE1(
    input CLOCK_50,
    output [3:0] VGA_R, VGA_G, VGA_B,
    output VGA_HS, VGA_VS);

    // Draw a test pattern with a 3px border
    // blue on top/bottom
    // red on left/right.
    wire [9:0] x, y;
    wire [3:0] hBorder = (x <= 10'd2 || x >= 10'd637) ? 4'd15 : 4'd0;
    wire [3:0] vBorder = (y <= 10'd2 || y >= 10'd477) ? 4'd15 : 4'd0;
    VgaController controller0(
        .clk(CLOCK_50),
        .reset_n(1'b1),
        .x(x),
        .y(y),
        .sync(sync),
        .r(hBorder | vBorder),
        .g(hBorder | vBorder),
        .b(hBorder | vBorder),
        .hSync_n(VGA_HS),
        .vSync_n(VGA_VS),
        .vgaR(VGA_R),
        .vgaG(VGA_G),
        .vgaB(VGA_B)
    );
endmodule
