module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);
    reg [7:0] in_old;
    integer i;
    initial in_old = 0;
    always @(posedge clk) begin
        if (in !== in_old) begin//新输入不等与旧输入
            for(i = 0; i < 8; i = i + 1) begin
                anyedge[i] = in[i] ^ in_old[i];//检测所有边沿
            end
        end
        else begin
           anyedge = 0;
        end
        in_old = in;
    end
    
endmodule