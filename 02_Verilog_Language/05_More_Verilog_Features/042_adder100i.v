module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
    
    assign {cout[0], sum[0]} = a[0] + b[0] + cin;
    
    integer i;
    
    always @ (*) begin
		for (i=1; i<100; i++) begin
            {cout[i], sum[i]} = a[i] + b[i] + cout[i-1];
        end
    end
endmodule