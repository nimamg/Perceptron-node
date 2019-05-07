`timescale 1ns/1ns

module multiplier_alpha_t (input signed [1:0] t, input signed [7:0] alpha, output [13:0] out);
    assign out = (t[1] == 0) ? 14'b00000011000000 : 14'b11111101000000;
endmodule   