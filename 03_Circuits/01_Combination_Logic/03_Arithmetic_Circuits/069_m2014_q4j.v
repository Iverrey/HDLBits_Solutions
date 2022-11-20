module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);

    wire [2:0] temp;

    fadd fadd1(
        .a(x[0]),
        .b(y[0]),
        .cin(0),
        .sum(sum[0]),
        .cout(temp[0])
    );

    fadd fadd2(
        .a(x[1]),
        .b(y[1]),
        .cin(temp[0]),
        .sum(sum[1]),
        .cout(temp[1])
    );

    fadd fadd3(
        .a(x[2]),
        .b(y[2]),
        .cin(temp[1]),
        .sum(sum[2]),
        .cout(temp[2])
    );

    fadd fadd4(
        .a(x[3]),
        .b(y[3]),
        .cin(temp[2]),
        .sum(sum[3]),
        .cout(sum[4])
    );

endmodule

module fadd( 
    input a, b, cin,
    output cout, sum );

    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (a & cin) | (b & cin);

endmodule