module top_tb();
    
    reg clk;
    reg rst_n;
    reg weight_select;
    wire signed [20:0] acc;
    
    wire cs;
    wire we;
    wire [7:0] fmap_in;
    wire [7:0] weight_in;
    wire [5:0] addr_fmaps;
    wire [5:0] addr_weight;

    top top(
    .clk(clk),
    .rst_n(rst_n),
    .weight_select(weight_select),
    .fmap_in(fmap_in),
    .weight_in(weight_in),
    .cs(cs),
    .we(we),
    .addr_fmaps(addr_fmaps),
    .addr_weight(addr_weight),
    .outputen(outputen),
    .acc(acc)
    );
    
    sram_fmaps sram_fmaps(
    .clk(clk),
    .rst_n(rst_n),
    .cs(cs),
    .we(we),
    .addr(addr_fmaps),
    .data_i(),
    .data_o(fmap_in)
    );
    
    sram_weight sram_weight(
    .clk(clk),
    .rst_n(rst_n),
    .cs(cs),
    .we(we),
    .addr(addr_weight),
    .data_i(),
    .data_o(weight_in)
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
