module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss); 

    reg [3:0] hh_temp;
    reg enas, enam0, enam1, enah, enap;
    
    initial begin
        hh = 0;
        mm = 0;
        ss = 0;
        pm = 0;
    end
    
    nine_fadder s0 (clk, reset, ena, ss[3:0]);
    five_fadder s1 (clk, reset, enas, ss[7:4]);
    nine_fadder m0 (clk, reset, enam0, mm[3:0]);
    five_fadder m1 (clk, reset, enam1, mm[7:4]);
    //用16进制的数来表示小时
    always @(posedge clk) begin
        if (!reset) begin
            if (enah) begin
                hh_temp = hh_temp == 12 ? 1 : hh_temp + 1;
                if (hh_temp == 12) pm = ~pm;
            end
        end
        else begin
            hh_temp = 12;
            pm = 0;
        end
    end
    //小时的BCD转换
    always @(*) begin
        if (hh_temp < 10) hh[7:0] = hh_temp;
        else begin
            case (hh_temp)
                4'd10: hh = 8'h10;
                4'd11: hh = 8'h11;
                4'd12: hh = 8'h12;
            endcase
        end
    end
    //各位的使能信号
    always @(*) begin
        enas = ena && ss[3:0] == 4'h9 ? 1 : 0;
        enam0 = ena && ss[7:0] == 8'h59 ? 1 : 0;
        enam1 = ena && {mm[3:0], ss[7:0]} == 12'h959 ? 1 : 0;
        enah = ena && {mm[7:0], ss[7:0]} == 16'h5959 ? 1 : 0;
    end
    
endmodule

module nine_fadder (
	input clk,
    input reset,
    input ena,
    output [3:0] q);
    initial q = 0;
    always @(posedge clk) begin
        if (!reset) begin
            if (ena) begin
                q = q == 9 ? 0 : q + 1;
            end
        end
        else q = 0;
    end
endmodule 

module five_fadder (
	input clk,
	input reset,
	input ena,
    output [3:0] q);
    initial q = 0;
    always @(posedge clk) begin
        if (!reset) begin
            if (ena) begin
                q = q == 5 ? 0 : q + 1;
            end
        end
        else q = 0;
    end
endmodule