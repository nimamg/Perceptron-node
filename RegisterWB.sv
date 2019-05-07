`timescale 1ns/1ns

module WBreg (input [13:0] in, input ld, init, clk, rst, output reg [13:0] out);
    always @(posedge clk, posedge rst) begin
        if (rst) out <= 14'b0;
        else if (init) out = 14'b0;
        else if (ld) out <= in;
        else out <= out;
    end
endmodule