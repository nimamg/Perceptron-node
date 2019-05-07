`timescale 1ns/1ns

module controller(input start, cout, flag, update, clk, rst, output reg ready, initCounter, initW1, initW2, initB, initFlag, setFlag, ldW1, ldW2, ldB, enableCount, enableTest);
    reg[3:0] ns, ps;
    parameter idle = 0, waiting = 1, initialize = 2, loopBegin = 3, updating = 4, countUp = 5, test = 6;
    always @(posedge clk, posedge rst) begin
        if (rst) ps <= idle;
        else ps <= ns;
    end
    always @(start, cout, flag, update, ps) begin
        case (ps)
            idle : ns <= start ? waiting : idle;
            waiting : ns <= start ? waiting : initialize;
            initialize : ns <= loopBegin;
            loopBegin : ns <= updating;
            updating : ns <= countUp;
            countUp : begin 
                if (cout) begin
                    if (flag) ns <= loopBegin;
                    else ns <= test;
                end
                else ns <= updating;
            end
            test : ns <= idle;
            default : ns <= ps;
        endcase
    end
    always @(ps,update) begin
        {ready, initCounter, initW1, initW2, initB, initFlag, setFlag, ldW1, ldW2, ldB, enableCount, enableTest} = 12'b0;
        case (ps)
            idle : ready = 1;
            initialize : {initCounter, initW1, initW2, initB} = 4'b1111;
            loopBegin : begin
                initFlag = 1;
                initCounter = 1;
            end
            updating : if (update) begin 
                {ldW1, ldW2, ldB, setFlag} = 4'b1111;
            end
            countUp : begin 
                enableCount = 1;
            end
            test : enableTest = 1;
            default : {ready, initCounter, initW1, initW2, initB, initFlag, setFlag, ldW1, ldW2, ldB, enableCount} = 11'b0;
        endcase
    end
endmodule