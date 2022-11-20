module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
    reg [7:0] in_old;
    integer i;
    initial in_old = 0;
    always @(posedge clk) begin
        if (in !== in_old) begin//若新输入与旧输入不同
            for (i = 0; i < 8; i = i + 1) begin
                pedge[i] = in[i] ? in[i] ^ in_old[i] : 0;//在新输入为1的位数与旧输入异或
            end
        end
        else begin
           pedge = 0;
        end
        in_old = in;
    end
    
endmodule