`timescale 1ns/1ns

module tb ();
    reg st,clk,rst;
    wire ready;
    wire [13:0] w1,w2,b;
    perceptron uuc (st,clk,rst,ready,w1,w2,b);
    always #200 clk = ~clk;
    initial begin
        clk = 0;
        st = 0;
        rst = 1;
        #450;
        rst = 0;
        st = 1;
        #450;
        st = 0;
        #450;
        #10000000;
        $stop;
    end
endmodule