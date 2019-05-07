`timescale 1ns/1ns

module fileReader (output reg signed [6:0] x1 [0:199], output reg signed [6:0] x2 [0:199], output reg signed [1:0] t [0:199]);
    reg signed [6:0] temp [0:599];
    initial begin
        $readmemb("data_set.txt", temp);
    end
    genvar i;
    generate for (i = 0; i < 200 ; i = i + 1) begin
        assign x1[i] = temp[3*i];
        assign x2[i] = temp[3*i + 1];
        assign t[i] = temp[3*i + 2];
    end
    endgenerate
endmodule