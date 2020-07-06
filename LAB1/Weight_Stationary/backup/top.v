module top(input clk,
           input rst_n,
           input weight_select,
           output valid,
           output signed [20:0] acc);
    
    wire cs,we;
    
    wire [5:0] fmaps_addr;
    wire [199:0] fmaps;
    wire [199:0] weight;
    
    control control(
    .clk(clk),
    .rst_n(rst_n),
    .readen(readen),
    .fmaps_sram_s(cs),
    .fmaps_sram_w(we),
    .valid(valid),
    .fmaps_addr(fmaps_addr)
    );
    
    sram_fmaps sram_fmaps(.clk(clk),
    .rst_n(rst_n),
    .cs(cs),
    .we(we),
    .addr(fmaps_addr),
    .data_i(),
    .data_o(fmaps)
    );
    
    regfile_weight regfile_weight(
    .clk(clk),
    .rst_n(rst_n),
    .weight_select(weight_select),
    .addr(),
    .data_i(),
    .data_o(weight)
    );
    
    pe_array pe_array(
    .clk(clk),
    .rst_n(rst_n),
    .readen(readen),
    .fmaps_in(fmaps),
    .weight_in(weight),
    .acc(acc)
    );
    
endmodule // top
