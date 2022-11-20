module mt2015_q4a (input x, input y, output z);
        assign z = (x ^ y) & x;
endmodule

module mt2015_q4b (input x, input y, output z);
        assign z = ~(x ^ y);
endmodule

module top_module (input x, input y, output z);
    wire a, b, c, d;
    mt2015_q4a u1 (.x(x), .y(y), .z(a));
    mt2015_q4b u2 (.x(x), .y(y), .z(b));
    mt2015_q4a u3 (.x(a), .y(b), .z(c));
    mt2015_q4b u4 (.x(a), .y(b), .z(d));
    assign z = (a | b) ^ (c & d);
endmodule