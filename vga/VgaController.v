module VgaController(
    // Control Signals
    input clk,                           // 50.4 MHz
    input reset_n,                       // Active low reset
    
    input          [DEPTH-1:0] r,g,b,    // RGB color of the pixel requested below
    output reg     [WIDTH-1:0] x,y,      // pixel X/Y position
    output reg [(2*WIDTH)-1:0] address,  // pre-calculated address
    output reg                 visible,  // 1 iff x/y are valid positions.
    output reg                 sync,     // Raised for 1 clk cycle when the frame changes
    output               [4:0] state,    // See README
    
    // Connect directly to VGA pins
    output reg  [DEPTH-1:0]    vgaR, vgaG, vgaB,
    output reg                 hSync_n, vSync_n
);
    parameter  LATENCY = 0;
    parameter  DEPTH   = 4;
    localparam WIDTH   = 10;
    
    // VGA Parameters (640x480@25Mhz)
    localparam H_ACTIVE     = 640;
    localparam H_FRONT      = 16;
    localparam H_SYNC       = 96;
    localparam H_BACK       = 48;
    localparam H_SYNC_START = H_ACTIVE + H_FRONT - 1;
    localparam H_SYNC_END   = H_SYNC_START + H_SYNC;
    localparam H_MAX        = H_ACTIVE + H_FRONT + H_SYNC + H_BACK - 1;
    
    localparam V_ACTIVE     = 480;
    localparam V_FRONT      = 11;
    localparam V_SYNC       = 2;
    localparam V_BACK       = 31;
    localparam V_SYNC_START = V_ACTIVE + V_FRONT - 1;
    localparam V_SYNC_END   = V_SYNC_START + V_SYNC;
    localparam V_MAX        = V_ACTIVE + V_FRONT + V_SYNC + V_BACK - 1;
    
    // Vertical Parameters
    
    // Input clock runs at 50.4MHz.
    // Divide by 2 to get 25.2 MHz, our VGA rate.
    wire vgaClk;
    TFF vgaTff(.clk(clk), .t(1'b1), .q(vgaClk));
        
    // Horiz Sync generator
    reg [WIDTH-1:0] hCounter, vCounter;
    always @(posedge vgaClk) begin
        if(~reset_n) begin
            hCounter <= 0;
            hSync_n  <= 0;
            vCounter <= 0;
            vSync_n  <= 0;
        end
        else begin
            if(hCounter < H_MAX) begin
                hCounter <= hCounter + 1'b1;
            end
            else begin
                hCounter <= 0;
                if(vCounter < V_MAX)
                    vCounter <= vCounter + 1'b1;
                else
                    vCounter <= 0;
            end
                  
            hSync_n <= ~(H_SYNC_START <= hCounter && hCounter <= H_SYNC_END);
            vSync_n <= ~(V_SYNC_START <= vCounter && vCounter <= V_SYNC_END);
        end
    end
    
    // Pulse newFrame for 50Mhz, after drawing last visible row.
    always @(posedge clk) begin
        sync <= hCounter == H_ACTIVE && vCounter == V_ACTIVE;
    end
    
    // Output color
    wire outputActive = (hCounter < H_ACTIVE && vCounter < V_ACTIVE);
    always @(posedge vgaClk) begin
        if(~reset_n | ~outputActive) begin
            vgaR <= 0;
            vgaG <= 0;
            vgaB <= 0;
        end
        else begin
            vgaR <= r;
            vgaG <= g;
            vgaB <= b;
        end
    end          
    
    // Pixel Address Generator
    wire [WIDTH-1:0] lookaheadX = hCounter + LATENCY + 1;
    wire [WIDTH-1:0] lookaheadY = (lookaheadX >= H_MAX) ? vCounter + 1'b1 : vCounter;
    assign state = {lookaheadX[3:0], ~vgaClk};
    always @(posedge vgaClk) begin
        if(~reset_n) begin
            x       <= 0;
            y       <= 0;
            address <= 0;
            visible <= 0;
        end
        else begin
            x       <= lookaheadX;
            y       <= lookaheadY;
            address <= (lookaheadY * H_ACTIVE) + lookaheadX;
            visible <= lookaheadX < H_ACTIVE && lookaheadY < V_ACTIVE;
        end
    end
 endmodule
 