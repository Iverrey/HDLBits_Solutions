module top_module (
    input clk,
    input reset,
    input enable,
    output [3:0] Q,
    output c_enable,
    output c_load,
    output [3:0] c_d
); //
	initial Q = 1;
    assign c_load = (reset || (Q === 12 && enable == 1)) ? 1 : 0;
    assign c_enable = enable;
    assign c_d = c_load;
    count4 the_counter (clk, c_enable, c_load, c_d);
    always @(posedge clk) begin
        if (!reset) begin
            if (enable) begin
                Q = (Q === 12) ? 1 : Q + 1;
            end
        end
        else Q = 1;
    end
    
endmodule