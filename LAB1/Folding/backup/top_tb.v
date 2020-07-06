module top_tb();
    
    reg clk;
    reg rst_n;
    reg weight_select;
    wire signed [20:0] acc;
    
    top top(
    .clk(clk),
    .rst_n(rst_n),
    .weight_select(weight_select),
    .acc(acc)
    );
    
    initial begin
        clk                = 0;
        rst_n              = 0;
        weight_select      = 0;
        #3 rst_n           = 1;
        #900 weight_select = 1;
    end
    
    always #2 clk = ~clk;
    
endmodule // top_tb
