`timescale 1ns/1ns

module multiplier_14_7 (input signed [6:0] in7, input signed [13:0] in14, output signed [13:0] out);
    wire signed [20:0] temp;
    assign temp = in7 * in14;
    assign out = temp[18:4];
endmodule