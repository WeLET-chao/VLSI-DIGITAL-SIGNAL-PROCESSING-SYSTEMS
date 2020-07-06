module top_tb();
    
    reg clk;
    reg rst_n;
    reg weight_select;
    wire valid;
    wire signed [20:0] acc;
    
    wire [199:0] fmaps_in;
    wire [199:0] weight_in;
    wire [5:0] fmaps_addr;

    top top(
    .clk(clk),
    .rst_n(rst_n),
    .weight_select(weight_select),
    .fmaps_in(fmaps_in),
    .weight_in(weight_in),
    .cs(cs),
    .we(we),
    .fmaps_addr(fmaps_addr),
    .valid(valid),
    .acc(acc)
    );
    
    sram_fmaps sram_fmaps(.clk(clk),
    .rst_n(rst_n),
    .cs(cs),
    .we(we),
    .addr(fmaps_addr),
    .data_i(),
    .data_o(fmaps_in)
    );
    
    regfile_weight regfile_weight(
    .clk(clk),
    .rst_n(rst_n),
    .weight_select(weight_select),
    .addr(),
    .data_i(),
    .data_o(weight_in)
    );
    
    initial begin
        clk           = 0;
        rst_n         = 0;
        weight_select = 1;
        #3 rst_n      = 1;
    end
    
    always #2 clk = ~clk;
    
endmodule // top_tb
