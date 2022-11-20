module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire[15:0] h, h0, h1, l, c;

    add16 add_l (
        .a(a[15:0]),
        .b(b[15:0]),
        .sum(l),
        .cout(c)
    );

    add16 add_h0 (
        .a(a[31:16]),
        .b(b[31:16]),
        .sum(h0),
        .cin(0)
    );

    add16 add_h1 (
        .a(a[31:16]),
        .b(b[31:16]),
        .sum(h1),
        .cin(1)
    );

    always @(*) begin
        if (c == 1) begin
            h = h1;
        end else begin
            h = h0;
        end
    end

    assign sum = {h, l};

endmodule