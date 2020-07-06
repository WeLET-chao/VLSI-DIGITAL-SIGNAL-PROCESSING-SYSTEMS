module top_tb();
    
    reg clk;
    reg rst_n;
    reg weight_select;
    
    wire [7:0] fmaps_in1;
    wire [7:0] fmaps_in2;
    wire [7:0] fmaps_in3;
    wire [7:0] fmaps_in4;
    wire [7:0] fmaps_in5;
    wire [7:0] fmaps_in6;
    wire [7:0] fmaps_in7;
    
    wire [7:0] weight_in1;
    wire [7:0] weight_in2;
    wire [7:0] weight_in3;
    wire [7:0] weight_in4;
    wire [7:0] weight_in5;
    
    wire [1:0] cs;
    wire [1:0] we;
    wire [4:0] fmaps_addr;
    wire [5:0] weight_addr;
    wire valid;
    wire signed [20:0] acc;
    
    top top(
    .clk(clk),
    .rst_n(rst_n),
    .weight_select(weight_select),
    .fmaps_in1(fmaps_in1),
    .fmaps_in2(fmaps_in2),
    .fmaps_in3(fmaps_in3),
    .fmaps_in4(fmaps_in4),
    .fmaps_in5(fmaps_in5),
    .fmaps_in6(fmaps_in6),
    .fmaps_in7(fmaps_in7),
    .weight_in1(weight_in1),
    .weight_in2(weight_in2),
    .weight_in3(weight_in3),
    .weight_in4(weight_in4),
    .weight_in5(weight_in5),
    .cs(cs),
    .we(we),
    .fmaps_addr(fmaps_addr),
    .weight_addr(weight_addr),
    .valid(valid),
    .acc(acc)
    );
    
    global_buffer global_buffer(
    .clk(clk),
    .rst_n(rst_n),
    .cs(cs),
    .we(we),
    .data_i(),
    .fmaps_addr(fmaps_addr),
    .weight_addr(weight_addr),
    .fmaps_data1_o(fmaps_in1),
    .fmaps_data2_o(fmaps_in2),
    .fmaps_data3_o(fmaps_in3),
    .fmaps_data4_o(fmaps_in4),
    .fmaps_data5_o(fmaps_in5),
    .fmaps_data6_o(fmaps_in6),
    .fmaps_data7_o(fmaps_in7),
    .weight_data1_o(weight_in1),
    .weight_data2_o(weight_in2),
    .weight_data3_o(weight_in3),
    .weight_data4_o(weight_in4),
    .weight_data5_o(weight_in5)
    );
    
    initial begin
        clk           = 0;
        rst_n         = 0;
        weight_select = 0;
        #3 rst_n      = 1;
    end
    
    always #2 clk = ~clk;

endmodule // top_tb
