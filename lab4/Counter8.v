module Counter8(
    input enable,
    input _reset,
    input clk,
    output [7:0] out);
    
    wire [6:0] ands;
    
    assign ands[0] = out[0] & enable;
    assign ands[1] = out[1] & ands[0];
    assign ands[2] = out[2] & ands[1];
    assign ands[3] = out[3] & ands[2];
    assign ands[4] = out[4] & ands[3];
    assign ands[5] = out[5] & ands[4];
    assign ands[6] = out[6] & ands[5];
        
    TFlipFlop tff0(enable,  _reset, clk, out[0]);
    TFlipFlop tff1(ands[0], _reset, clk, out[1]);
    TFlipFlop tff2(ands[1], _reset, clk, out[2]);
    TFlipFlop tff3(ands[2], _reset, clk, out[3]);
    TFlipFlop tff4(ands[3], _reset, clk, out[4]);
    TFlipFlop tff5(ands[4], _reset, clk, out[5]);
    TFlipFlop tff6(ands[5], _reset, clk, out[6]);
    TFlipFlop tff7(ands[6], _reset, clk, out[7]);
endmodule
