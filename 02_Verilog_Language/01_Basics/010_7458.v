module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );

    wire x1, x2, y1, y2;

    assign x1 = p1a & p1b & p1c;
    assign x2 = p1d & p1e & p1f;
    assign y1 = p2a & p2b;
    assign y2 = p2c & p2d;

    assign p1y = x1 | x2;
    assign p2y = y1 | y2;

endmodule