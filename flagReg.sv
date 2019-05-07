`timescale 1ns/1ns

module flagReg(input setFlag, initFlag, clk, rst, output reg flag);
    always@(posedge clk, posedge rst) begin
        if (rst) flag <= 0;
        else if (setFlag) flag <= 1;
        else if (initFlag) flag <= 0;
        else flag <= flag;  
    end
endmodule