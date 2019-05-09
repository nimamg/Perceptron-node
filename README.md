# Perceptron-node
A perceptron node implementation using verilog

A perceptron node used for data classification. Can be trained using suprevised learning with a set of data with 1 or 0 results; Training
method:

1. Initial Weight1 (w1), Weight2 (w2), and Bias (b) values are 0. Initial Alpha (Learn rate) value is 0.75 (Alpha is considered a constant in this
project for simplification matters.)
2. While at least one of the weights changes in the process, do stages 3 and 4
3. Yin = b + x1w1 + x2w2 (x1 and x2 are the input data).
    Y = sign(Yin)
4. If Y is not equal to T, update w1,w2 and b as followed (T is the correct result, given as part of the training set.)
    w1 = w1 + Alpha * T * x1
    w2 = w2 + Alpha * T * x2
    b = b + Alpha * T

The node can classify the data set into 2 groups. The data should be quantized for simplification matters, and also should be in the form of 7-bit signed fixed-point numbers, with 4 bits of fraction.
