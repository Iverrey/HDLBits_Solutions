module top_module( 
    input [99:0] a, b,
    input sel,
    output [99:0] out );

    always @(*) begin
        if (sel) begin
            out = b;
        end else begin
            out = a;
        end
    end

endmodule