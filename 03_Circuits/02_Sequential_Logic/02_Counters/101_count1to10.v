module top_module (
    input clk,
    input reset,
    output [3:0] q);

    initial q = 1;
    
    always @(posedge clk) begin
        q = reset ? 1 : (q === 10 ? 1 : q + 1);
    end
    
endmodule