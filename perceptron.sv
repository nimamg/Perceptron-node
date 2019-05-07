`timescale 1ns/1ns

module perceptron(input start, clk, rst, output ready, output [13:0] weight1, weight2, bias);
    wire cout, flag, update, initCounter, initW1, initW2, initFlag, setFlag, ldW1, ldW2, ldB, enableCount;
    controller cntlr(start, cout, flag, update, clk, rst, ready, initCounter, initW1, initW2, initB, initFlag, setFlag, ldW1, ldW2, ldB, enableCount, enableTest);
    dataPath dp(initCounter, initW1, initW2, initB, initFlag, setFlag, ldW1, ldW2, ldB, enableCount, enableTest, clk, rst, cout, flag, update,weight1,weight2,bias);
endmodule