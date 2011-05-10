module DE1(
    input CLOCK_27,
    output [3:0] VGA_R, VGA_G, VGA_B,
    output VGA_HS, VGA_VS);

    wire vgaClock;
    
    PLL vgaPll(
        .inclk0(CLOCK_27),
        .c0(vgaClock));
    
    VgaController controller0(
        vgaClock,
        VGA_HS, VGA_VS,
        VGA_R, VGA_G, VGA_B);
endmodule
