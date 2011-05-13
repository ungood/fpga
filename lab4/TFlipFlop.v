module MyDLatch(
    input d, enable, _reset,
    output q, _q);
    
    wire and0, and1;
    
    assign and0 = ~d & enable;
    assign and1 =  d & enable;
    
    assign  q = ~(and0 | _q | ~_reset);
    assign _q = ~(and1 |  q);
endmodule

module DFlipFlop(
    input d, clk, _reset,
    output q, _q);
    
    wire masterQ;
    
    MyDLatch master(d, ~clk, _reset, masterQ);
    MyDLatch slave(masterQ, clk, _reset, q, _q);
endmodule

module TFlipFlop(
    input t,
    input _reset,
    input clk,
    output q, _q);
    
    DFlipFlop dff0(t ^ q, clk, _reset, q, _q);
 endmodule
 