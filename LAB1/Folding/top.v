module top(input clk,
           input rst_n,
           input weight_select,
           input [7:0] fmap_in,
           input [7:0] weight_in,
           output cs,
           output we,
           output [5:0] addr_fmaps,
           output [5:0] addr_weight,
           output outputen,
           output signed [20:0] acc);
    
    wire worken;
    
    control control(
    .clk(clk),
    .rst_n(rst_n),
    .weight_select(weight_select),
    .cs(cs),
    .we(we),
    .addr_fmaps(addr_fmaps),
    .addr_weight(addr_weight),
    .worken(worken),
    .outputen(outputen)
    );
    
    conv conv(
    .clk(clk),
    .rst_n(rst_n),
    .worken(worken),
    .outputen(outputen),
    .data_fmaps(fmap_in),
    .data_weight(weight_in),
    .acc(acc)
    );
    
endmodule // top
