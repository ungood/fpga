module Counter4(
    input enable,
    input _reset,
    input clk,
    output [3:0] out);
    
    wire [2:0] ands;
    
    assign ands[0] = out[0] & enable;
    assign ands[1] = out[1] & ands[0];
    assign ands[2] = out[2] & ands[1];
            
    TFlipFlop tff0(enable,  _reset, clk, out[0]);
    TFlipFlop tff1(ands[0], _reset, clk, out[1]);
    TFlipFlop tff2(ands[1], _reset, clk, out[2]);
    TFlipFlop tff3(ands[2], _reset, clk, out[3]);
endmodule
