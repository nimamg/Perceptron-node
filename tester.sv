module tester (input [13:0] w1,w2,b, input en);
    reg signed [6:0] temp [0:399];
    reg signed [1:0] result;
    reg signed [13:0] sum;
    reg signed [20:0] x1w1,x2w2;
    initial begin
        $readmemb("test_data.txt", temp);
    end
    integer outFile;
    initial begin
        outFile = $fopen("out.txt","w");
    end
    integer j;
    always @(en) begin
        if (en) begin
            for (j = 0 ; j < 200 ; j = j + 1) begin
                $display(" J IS %d  X1 IS  %b   X2 is  %b  W1  %b  W2  %b \n" , j, temp[2*j] , temp[2*j + 1], w1, w2);
                x1w1 = temp[2*j] * w1;
                $display (" X1w1 %b \n" , x1w1[18:4] );
                x2w2 = temp[2*j + 1] * w2;
                $display (" X2w2 %b \n" , x2w2[18:4] );
                sum = b + x1w1[18:4] + x2w2[18:4];
                $display (" SUM  %b \n" , sum );
                result = (sum[13] == 0) ? 2'b01 : 2'b11;
                $display (" RES %b \n" , result );
                $fwrite(outFile,"%b\n",result);
            end
        end
    end
endmodule