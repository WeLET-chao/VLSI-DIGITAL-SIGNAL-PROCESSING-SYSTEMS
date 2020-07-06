module top(input clk,
           input rst_n,
           input weight_select,
           output signed [20:0] acc);
    
    wire ce;
    wire we;
    wire [5:0] addr_fmaps;
    wire [5:0] addr_weight;
    wire [7:0] data_fmaps;
    wire [7:0] data_weight;
    wire worken;
    wire outputen;
    
    control control(
    .clk(clk),
    .rst_n(rst_n),
    .weight_select(weight_select),
    .ce(ce),
    .we(we),
    .addr_fmaps(addr_fmaps),
    .addr_weight(addr_weight),
    .worken(worken),
    .outputen(outputen)
    );
    
    sram_fmaps sram_fmaps(
    .clk(clk),
    .rst_n(rst_n),
    .ce(ce),
    .we(we),
    .addr(addr_fmaps),
    .data_i(),
    .data_o(data_fmaps)
    );
    
    sram_weight sram_weight(
    .clk(clk),
    .rst_n(rst_n),
    .ce(ce),
    .we(we),
    .addr(addr_weight),
    .data_i(),
    .data_o(data_weight)
    );
    
    conv conv(
    .clk(clk),
    .rst_n(rst_n),
    .worken(worken),
    .outputen(outputen),
    .data_fmaps(data_fmaps),
    .data_weight(data_weight),
    .acc(acc)
    );
    
endmodule // top
