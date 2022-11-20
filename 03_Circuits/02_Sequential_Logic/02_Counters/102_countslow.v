module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);

    initial q = 0;
    
    always @(posedge clk) begin
        if (!reset) begin
            if (slowena) begin
                q = q === 9 ? 0 : q + 1;
            end
        end
        else q = 0;
    end
    
endmodule