module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire[15:0] h, l, c;
    reg[31:0] bi;

    always @(*) begin
        if (sub) begin
            bi = b ^ 32'hffffffff;
        end
        else begin
            bi = b;
        end
    end

    add16 add_l (
        .a(a[15:0]), 
        .b(bi[15:0]), 
        .cout(c), 
        .sum(l),
        .cin(sub)
    );

    add16 add_h (
        .a(a[31:16]),
        .b(bi[31:16]),
        .sum(h),
        .cin(c)
    );

    assign sum = {h, l};

endmodule