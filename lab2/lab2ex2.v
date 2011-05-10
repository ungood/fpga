module compare1(
    input a,
    input b,
    output lt,
    output eq,
    output gt);
    
    assign lt = ~a & b;
    assign eq = ~(a ^ b);
    assign gt = a & ~b;
endmodule

module compare4(
    input [3:0] a,
    input [3:0] b,
    output      lt,
    output      eq,
    output      gt);
    
    wire  [3:0] t_lt;
    wire  [3:0] t_eq;
    wire  [3:0] t_gt;
    
    compare1(a[3], b[3], t_lt[3], t_eq[3], t_gt[3]);
    compare1(a[2], b[2], t_lt[2], t_eq[2], t_gt[2]);
    compare1(a[1], b[1], t_lt[1], t_eq[1], t_gt[1]);
    compare1(a[0], b[0], t_lt[0], t_eq[0], t_gt[0]);
    
    assign eq = t_eq[3] & t_eq[2] & t_eq[1] & t_eq[0];
    assign lt = ~t_eq[3] ? t_lt[3] :
                ~t_eq[2] ? t_lt[2] : 
                ~t_eq[1] ? t_lt[1] : 
                ~t_eq[0] ? t_lt[0] : 0;
    assign gt = ~t_eq[3] ? t_gt[3] :
                ~t_eq[2] ? t_gt[2] : 
                ~t_eq[1] ? t_gt[1] : 
                ~t_eq[0] ? t_gt[0] : 0;
endmodule

module div10(
    input  [3:0] in,
    output [3:0] out);
    
    assign out[3] = 1'b0;
    assign out[2] = (~in[2] & ~in[1]) |
                    ( in[2] &  in[1]);
    assign out[1] =  ~in[1];
    assign out[0] =   in[0];
endmodule

module bin2dec(
    input  [3:0] bin,
    output [6:0] d1,
    output [6:0] d0);
    
    wire         tens;
    wire   [3:0] ones;
    
    /* Divede the input by 10. */
    div10(bin, ones);

    compare4(
        .a(bin),
        .b(4'b1001),
        .gt(tens));
        
    hex7segment({3'b000, tens}, d1);
    hex7segment(tens ? ones : bin, d0);
     
 endmodule
 
 
// module lab2ex2(
//    input  [9:0] SW,
//    output [9:0] LEDR,
//    output [6:0] HEX1,
//    output [6:0] HEX0);
//        
//    bin2dec(SW[3:0], HEX1, HEX0);
//endmodule

module one_hertz(
    input      clk_in,
    output reg clk_out);
    
    reg   [24:0] counter;
    
    always @(posedge clk_in) begin
        counter <= counter + 25'h0000001;
        if(counter == 25'd25000000) begin
            counter <= 0;
            clk_out <= ~clk_out;
        end
    end
    
    //assign out_clk = (counter < 25'd25000000) ? 0 : 1;
 endmodule

/* manual counter */
module lab2ex2(
    input        CLOCK_50,
    output [6:0] HEX1,
    output [6:0] HEX0,
    output [7:0] LEDG);
    
    wire         clk;
    reg    [3:0] counter;
        
    one_hertz(CLOCK_50, clk);
    assign LEDG[0] = clk;
    
    always @(posedge clk) begin
        counter = counter + 1'b1;
    end
    
    bin2dec(counter, HEX1, HEX0);
endmodule
