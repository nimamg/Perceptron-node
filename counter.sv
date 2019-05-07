`timescale 1ns/1ns

module counter (input enable, init, clk, rst, output reg [7:0] out, output cout);
    always @(posedge clk, posedge rst, posedge init) begin
        if (rst) out <= 8'b0;
        else if (init) out <= 8'b0;
        else if (enable) out <= out + 1;
        else out <= out;
    end
    assign cout = (out == 8'b11000111) ? 1 : 0;
endmodule