module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
    
    bcd_fadder add0 (clk, reset, 1, q[3:0]);
    bcd_fadder add1 (clk, reset, ena[1], q[7:4]);
    bcd_fadder add2 (clk, reset, ena[2], q[11:8]);
    bcd_fadder add3 (clk, reset, ena[3], q[15:12]);
    
    always @(*) begin
        ena[1] = q[3:0] == 4'h9 ? 1 : 0;
        ena[2] = q[7:0] == 8'h99 ? 1 : 0;
        ena[3] = q[11:0] == 12'h999 ? 1 : 0;
    end
    
endmodule

module bcd_fadder (
	input clk,
    input reset,
    input ena,
    output [3:0] q);
    initial q = 0;
    always @(posedge clk) begin
        if (!reset) begin
            if (ena) begin
                q = q == 9 ? 0 : q + 1;
            end
        end
        else q = 0;
    end
endmodule