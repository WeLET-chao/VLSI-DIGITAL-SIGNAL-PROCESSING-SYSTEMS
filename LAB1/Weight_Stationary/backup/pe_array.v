module pe_array(input clk,
                input rst_n,
                input readen,
                input [199:0] fmaps_in,  // 25 pe x 8bit
                input [199:0] weight_in, // 25 pe x 8bit
                output signed [20:0] acc);
    
    wire signed [20:0] inner_connect[1:25];
    
    assign inner_connect[1] = 0;
    
    pe pe_1(
    .clk(clk),
    .rst_n(rst_n),
    .readen(readen),
    .fmaps_in(fmaps_in[199:192]),
    .weight_in(weight_in[199:192]),
    .partial_sum_in(inner_connect[1]),
    .partial_sum_out(inner_connect[2])
    );
    
    pe pe_2(
    .clk(clk),
    .rst_n(rst_n),
    .readen(readen),
    .fmaps_in(fmaps_in[191:184]),
    .weight_in(weight_in[191:184]),
    .partial_sum_in(inner_connect[2]),
    .partial_sum_out(inner_connect[3])
    );
    
    pe pe_3(
    .clk(clk),
    .rst_n(rst_n),
    .readen(readen),
    .fmaps_in(fmaps_in[183:176]),
    .weight_in(weight_in[183:176]),
    .partial_sum_in(inner_connect[3]),
    .partial_sum_out(inner_connect[4])
    );
    
    pe pe_4(
    .clk(clk),
    .rst_n(rst_n),
    .readen(readen),
    .fmaps_in(fmaps_in[175:168]),
    .weight_in(weight_in[175:168]),
    .partial_sum_in(inner_connect[4]),
    .partial_sum_out(inner_connect[5])
    );
    
    pe pe_5(
    .clk(clk),
    .rst_n(rst_n),
    .readen(readen),
    .fmaps_in(fmaps_in[167:160]),
    .weight_in(weight_in[167:160]),
    .partial_sum_in(inner_connect[5]),
    .partial_sum_out(inner_connect[6])
    );
    
    pe pe_6(
    .clk(clk),
    .rst_n(rst_n),
    .readen(readen),
    .fmaps_in(fmaps_in[159:152]),
    .weight_in(weight_in[159:152]),
    .partial_sum_in(inner_connect[6]),
    .partial_sum_out(inner_connect[7])
    );
    
    pe pe_7(
    .clk(clk),
    .rst_n(rst_n),
    .readen(readen),
    .fmaps_in(fmaps_in[151:144]),
    .weight_in(weight_in[151:144]),
    .partial_sum_in(inner_connect[7]),
    .partial_sum_out(inner_connect[8])
    );
    
    pe pe_8(
    .clk(clk),
    .rst_n(rst_n),
    .readen(readen),
    .fmaps_in(fmaps_in[143:136]),
    .weight_in(weight_in[143:136]),
    .partial_sum_in(inner_connect[8]),
    .partial_sum_out(inner_connect[9])
    );
    
    pe pe_9(
    .clk(clk),
    .rst_n(rst_n),
    .readen(readen),
    .fmaps_in(fmaps_in[135:128]),
    .weight_in(weight_in[135:128]),
    .partial_sum_in(inner_connect[9]),
    .partial_sum_out(inner_connect[10])
    );
    
    pe pe_10(
    .clk(clk),
    .rst_n(rst_n),
    .readen(readen),
    .fmaps_in(fmaps_in[127:120]),
    .weight_in(weight_in[127:120]),
    .partial_sum_in(inner_connect[10]),
    .partial_sum_out(inner_connect[11])
    );
    
    pe pe_11(
    .clk(clk),
    .rst_n(rst_n),
    .readen(readen),
    .fmaps_in(fmaps_in[119:112]),
    .weight_in(weight_in[119:112]),
    .partial_sum_in(inner_connect[11]),
    .partial_sum_out(inner_connect[12])
    );
    
    pe pe_12(
    .clk(clk),
    .rst_n(rst_n),
    .readen(readen),
    .fmaps_in(fmaps_in[111:104]),
    .weight_in(weight_in[111:104]),
    .partial_sum_in(inner_connect[12]),
    .partial_sum_out(inner_connect[13])
    );
    
    pe pe_13(
    .clk(clk),
    .rst_n(rst_n),
    .readen(readen),
    .fmaps_in(fmaps_in[103:96]),
    .weight_in(weight_in[103:96]),
    .partial_sum_in(inner_connect[13]),
    .partial_sum_out(inner_connect[14])
    );
    
    pe pe_14(
    .clk(clk),
    .rst_n(rst_n),
    .readen(readen),
    .fmaps_in(fmaps_in[95:88]),
    .weight_in(weight_in[95:88]),
    .partial_sum_in(inner_connect[14]),
    .partial_sum_out(inner_connect[15])
    );
    
    pe pe_15(
    .clk(clk),
    .rst_n(rst_n),
    .readen(readen),
    .fmaps_in(fmaps_in[87:80]),
    .weight_in(weight_in[87:80]),
    .partial_sum_in(inner_connect[15]),
    .partial_sum_out(inner_connect[16])
    );
    
    pe pe_16(
    .clk(clk),
    .rst_n(rst_n),
    .readen(readen),
    .fmaps_in(fmaps_in[79:72]),
    .weight_in(weight_in[79:72]),
    .partial_sum_in(inner_connect[16]),
    .partial_sum_out(inner_connect[17])
    );
    
    pe pe_17(
    .clk(clk),
    .rst_n(rst_n),
    .readen(readen),
    .fmaps_in(fmaps_in[71:64]),
    .weight_in(weight_in[71:64]),
    .partial_sum_in(inner_connect[17]),
    .partial_sum_out(inner_connect[18])
    );
    
    pe pe_18(
    .clk(clk),
    .rst_n(rst_n),
    .readen(readen),
    .fmaps_in(fmaps_in[63:56]),
    .weight_in(weight_in[63:56]),
    .partial_sum_in(inner_connect[18]),
    .partial_sum_out(inner_connect[19])
    );
    
    pe pe_19(
    .clk(clk),
    .rst_n(rst_n),
    .readen(readen),
    .fmaps_in(fmaps_in[55:48]),
    .weight_in(weight_in[55:48]),
    .partial_sum_in(inner_connect[19]),
    .partial_sum_out(inner_connect[20])
    );
    
    pe pe_20(
    .clk(clk),
    .rst_n(rst_n),
    .readen(readen),
    .fmaps_in(fmaps_in[47:40]),
    .weight_in(weight_in[47:40]),
    .partial_sum_in(inner_connect[20]),
    .partial_sum_out(inner_connect[21])
    );
    
    pe pe_21(
    .clk(clk),
    .rst_n(rst_n),
    .readen(readen),
    .fmaps_in(fmaps_in[39:32]),
    .weight_in(weight_in[39:32]),
    .partial_sum_in(inner_connect[21]),
    .partial_sum_out(inner_connect[22])
    );
    
    pe pe_22(
    .clk(clk),
    .rst_n(rst_n),
    .readen(readen),
    .fmaps_in(fmaps_in[31:24]),
    .weight_in(weight_in[31:24]),
    .partial_sum_in(inner_connect[22]),
    .partial_sum_out(inner_connect[23])
    );
    
    pe pe_23(
    .clk(clk),
    .rst_n(rst_n),
    .readen(readen),
    .fmaps_in(fmaps_in[23:16]),
    .weight_in(weight_in[23:16]),
    .partial_sum_in(inner_connect[23]),
    .partial_sum_out(inner_connect[24])
    );
    
    pe pe_24(
    .clk(clk),
    .rst_n(rst_n),
    .readen(readen),
    .fmaps_in(fmaps_in[15:8]),
    .weight_in(weight_in[15:8]),
    .partial_sum_in(inner_connect[24]),
    .partial_sum_out(inner_connect[25])
    );
    
    pe pe_25(
    .clk(clk),
    .rst_n(rst_n),
    .readen(readen),
    .fmaps_in(fmaps_in[7:0]),
    .weight_in(weight_in[7:0]),
    .partial_sum_in(inner_connect[25]),
    .partial_sum_out(acc)
    );
endmodule // pe_array
