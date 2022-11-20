`default_nettype none
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   
    ); 

    wire x1, x2, y;
    
    assign x1 = a & b;
    assign x2 = c & d;
    assign y = x1 | x2;

    assign out = y;
    assign out_n = ~y;

endmodule