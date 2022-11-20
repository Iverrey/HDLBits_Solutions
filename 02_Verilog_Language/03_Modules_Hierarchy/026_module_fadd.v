module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//
    wire[15:0] h, l, c;
    add16 add_l (
        .a(a[15:0]),
        .b(b[15:0]),
        .sum(l),
        .cout(c)
        );
    add16 add_h (
        .a(a[31:16]),
        .b(b[31:16]),
        .sum(h),
        .cin(c)
        );
    assign sum = {h, l};
endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );
    assign sum = (~a & ~b & cin) | (a & ~b & ~cin) | (~a & b & ~cin) | (a & b & cin);
    assign cout = (a & b) | (a & cin) | (b & cin);
// Full adder module here

endmodule