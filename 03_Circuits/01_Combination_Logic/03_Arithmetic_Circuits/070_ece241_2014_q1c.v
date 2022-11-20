module top_module (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
); //
    assign s = a + b;
    always @(*) begin
        overflow = 0;
        if (a[7] == b[7]) begin
            if (a[7] == s[7]) begin
                overflow = 0;
            end
            else begin
                overflow = 1;
            end
        end
    end
    // assign s = ...
    // assign overflow = ...
endmodule