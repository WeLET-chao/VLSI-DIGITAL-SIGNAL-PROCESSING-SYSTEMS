module top(input clk,
           input rst_n,
           input weight_select,
           input [199:0] fmaps_in,
           input [199:0] weight_in,
           output cs,
           output we,
           output [5:0] fmaps_addr,
           output valid,
           output signed [20:0] acc);
    
    wire readen;
    
    control control(
    .clk(clk),
    .rst_n(rst_n),
    .readen(readen),
    .fmaps_sram_s(cs),
    .fmaps_sram_w(we),
    .valid(valid),
    .fmaps_addr(fmaps_addr)
    );
    
    pe_array pe_array(
    .clk(clk),
    .rst_n(rst_n),
    .readen(readen),
    .fmaps_in(fmaps_in),
    .weight_in(weight_in),
    .acc(acc)
    );
    
endmodule // top
