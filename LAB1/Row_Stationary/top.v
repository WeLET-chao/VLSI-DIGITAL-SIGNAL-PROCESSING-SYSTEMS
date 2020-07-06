module top(input clk,
           input rst_n,
           input weight_select,
           input [7:0] fmaps_in1,
           input [7:0] fmaps_in2,
           input [7:0] fmaps_in3,
           input [7:0] fmaps_in4,
           input [7:0] fmaps_in5,
           input [7:0] fmaps_in6,
           input [7:0] fmaps_in7,
           input [7:0] weight_in1,
           input [7:0] weight_in2,
           input [7:0] weight_in3,
           input [7:0] weight_in4,
           input [7:0] weight_in5,
           output [1:0] cs,
           output [1:0] we,
           output [4:0] fmaps_addr,
           output [5:0] weight_addr,
           output valid,
           output signed [20:0] acc);
    
    wire worken;
    wire outputen;
    wire [2:0] flag;

    control control(
    .clk(clk),
    .rst_n(rst_n),
    .weight_select(weight_select),
    .fmaps_addr(fmaps_addr),
    .weight_addr(weight_addr),
    .cs(cs),
    .we(we),
    .worken(worken),
    .outputen(outputen),
    .flag(flag),
    .valid(valid)
    );

    wire [20:0] psum_out1;
    wire [20:0] psum_out2;
    wire [20:0] psum_out3;
    
    pe_array pe_array(
    .clk(clk),
    .rst_n(rst_n),
    .worken(worken),
    .outputen(outputen),
    .fmaps_in1_1(fmaps_in1),
    .fmaps_in2_1(fmaps_in2),
    .fmaps_in3_1(fmaps_in3),
    .fmaps_in4_1(fmaps_in4),
    .fmaps_in5_1(fmaps_in5),
    .fmaps_in5_2(fmaps_in6),
    .fmaps_in5_3(fmaps_in7),
    .weight_in1(weight_in1),
    .weight_in2(weight_in2),
    .weight_in3(weight_in3),
    .weight_in4(weight_in4),
    .weight_in5(weight_in5),
    .psum_out1_1(psum_out1),
    .psum_out1_2(psum_out2),
    .psum_out1_3(psum_out3)
    );
    
    mux4_1 mux4_1(
    .s(flag),
    .a(psum_out1),
    .b(psum_out2),
    .c(psum_out3),
    .d(acc)
    );
    
endmodule // top
