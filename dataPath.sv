`timescale 1ns/1ns

module dataPath(input initCounter, initW1, initW2, initB, initFlag, setFlag, ldW1, ldW2, ldB, enableCount, enableTest, clk, rst, output cout, flag, update, output [13:0] weight1, weight2, bias);
    wire signed [6:0] x1 [0:199];
    wire signed [6:0] x2 [0:199]; 
    wire signed [1:0] t [0:199];
    wire [7:0] counterOut;
    wire signed [13:0] w1, w2, b, x1w1, x2w2, alphaT, alphaTx1, alphaTx2, yin, w1PI, w2PI, bPI;
    reg signed [7:0] alpha = 8'b00000011;
    fileReader fileInput(x1, x2, t);
    counter cnt(enableCount, initCounter, clk, rst, counterOut, cout);
    multiplier_14_7 mult1(x1[counterOut], w1, x1w1);
    multiplier_14_7 mult2(x2[counterOut], w2, x2w2);
    multiplier_alpha_t mult3(t[counterOut], alpha, alphaT);
    multiplier_14_7 mult4(x1[counterOut], alphaT, alphaTx1);
    multiplier_14_7 mult5(x2[counterOut], alphaT, alphaTx2);
    adder3bit adder1(x1w1, x2w2, b, yin);
    adder2bit adder2(alphaTx1, w1, w1PI);
    adder2bit adder3(alphaTx2, w2, w2PI);
    adder2bit adder4(b, alphaT, bPI);
    WBreg w1Reg(w1PI, ldW1, initW1, clk, rst, w1);
    WBreg w2Reg(w2PI, ldW2, initW2, clk, rst, w2);
    WBreg bReg(bPI, ldB, initB, clk, rst, b);
    flagReg fReg(setFlag, initFlag, clk, rst, flag);
    tester testUnit(w1,w2,b,enableTest);
    assign update = (t[counterOut][1] ^ yin[13]) | ~(|yin);
    assign weight1 = w1;
    assign weight2 = w2;
    assign bias = b;
endmodule