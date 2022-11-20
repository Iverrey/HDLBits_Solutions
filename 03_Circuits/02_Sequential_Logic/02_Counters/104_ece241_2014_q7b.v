module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); //
	
    reg [3:0] Q [2:0];
    bcdcount counter0 (clk, reset, c_enable[0], Q[0]);
    bcdcount counter1 (clk, reset, c_enable[1], Q[1]);
    bcdcount counter2 (clk, reset, c_enable[2], Q[2]);
    
    always @(*) begin
        c_enable[0] = 1;
        c_enable[1] = (Q[0] == 9) ? 1 : 0;
        c_enable[2] = (Q[1] == 9 && Q[0] == 9) ? 1 : 0;
        OneHertz = (Q[2] == 9 && Q[1] == 9 && Q[0] == 9) ? 1 : 0;
    end
    
endmodule