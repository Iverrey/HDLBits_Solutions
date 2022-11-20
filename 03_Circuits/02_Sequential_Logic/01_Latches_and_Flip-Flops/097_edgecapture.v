module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    reg [31:0] in_old;
    initial in_old = 0;
    integer i;
    always @(posedge clk) begin
        if (!reset) begin
            for (i = 0; i < 32; i = i + 1) begin
                if (in_old[i] == 1 && in[i] == 0) begin
                    out[i] = 1;
                end
            end
        end
        else out = 0;
        in_old = in;
    end
    
endmodule