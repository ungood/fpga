module DE1(
    input CLOCK_50,
    output [3:0] VGA_R, VGA_G, VGA_B,
    output VGA_HS, VGA_VS);

    VgaController controller0(
        CLOCK_50,
        VGA_HS, VGA_VS,
        VGA_R, VGA_G, VGA_B);
endmodule
