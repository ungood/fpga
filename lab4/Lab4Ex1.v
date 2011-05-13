module Lab4Ex1(
    input  [9:0] SW,
    input  [3:0] KEY,
    output [9:0] LEDR,
    output [6:0] HEX3, HEX2, HEX1, HEX0);
        
    wire [3:0] counter;
    
    //assign HEX0 = 7'hFF;
    assign HEX1 = 7'hFF;
    assign HEX2 = 7'hff;
    assign HEX3 = 7'hff;
    //Counter8(SW[1], SW[0], KEY[0], counter[7:0]);  
    Counter4(SW[1], SW[0], KEY[0], counter[3:0]);  
    //hex7segment(counter[7:4], HEX1);
    SevebSegment(counter[3:0], HEX0);
endmodule
