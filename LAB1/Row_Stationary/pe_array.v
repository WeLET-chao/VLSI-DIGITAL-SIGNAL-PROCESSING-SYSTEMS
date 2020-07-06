module pe_array(input clk,
                input rst_n,
                input worken,
                input outputen,
                input signed [7:0] fmaps_in1_1,    // fmaps data input
                input signed [7:0] fmaps_in2_1,
                input signed [7:0] fmaps_in3_1,
                input signed [7:0] fmaps_in4_1,
                input signed [7:0] fmaps_in5_1,
                input signed [7:0] fmaps_in5_2,
                input signed [7:0] fmaps_in5_3,
                input signed [7:0] weight_in1,     // weight data input
                input signed [7:0] weight_in2,
                input signed [7:0] weight_in3,
                input signed [7:0] weight_in4,
                input signed [7:0] weight_in5,
                output signed [20:0] psum_out1_1,  // psum data output
                output signed [20:0] psum_out1_2,
                output signed [20:0] psum_out1_3);
    
    // inner connection and buffer for fmaps reuse
    wire [7:0] connect_in[1:8];
    wire [7:0] connect_out[1:8];
    // connect[1]  ：PE2,1 -> PE1,2
    // connect[2]  : PE3,1 -> PE2,2
    // connect[3]  : PE4,1 -> PE3,2
    // connect[4]  : PE5,1 -> PE4,2
    // connect[5]  : PE2,2 -> PE1,3
    // connect[6]  : PE3,2 -> PE2,3
    // connect[7]  : PE4,2 -> PE3,3
    // connect[8]  : PE5,2 -> PE4,3
    buffer buffer1(
    .clk(clk),
    .rst_n(rst_n),
    .data_in(connect_in[1]),
    .data_out(connect_out[1])
    );
    buffer buffer2(
    .clk(clk),
    .rst_n(rst_n),
    .data_in(connect_in[2]),
    .data_out(connect_out[2])
    );
    buffer buffer3(
    .clk(clk),
    .rst_n(rst_n),
    .data_in(connect_in[3]),
    .data_out(connect_out[3])
    );
    buffer buffer4(
    .clk(clk),
    .rst_n(rst_n),
    .data_in(connect_in[4]),
    .data_out(connect_out[4])
    );
    buffer buffer5(
    .clk(clk),
    .rst_n(rst_n),
    .data_in(connect_in[5]),
    .data_out(connect_out[5])
    );
    buffer buffer6(
    .clk(clk),
    .rst_n(rst_n),
    .data_in(connect_in[6]),
    .data_out(connect_out[6])
    );
    buffer buffer7(
    .clk(clk),
    .rst_n(rst_n),
    .data_in(connect_in[7]),
    .data_out(connect_out[7])
    );
    buffer buffer8(
    .clk(clk),
    .rst_n(rst_n),
    .data_in(connect_in[8]),
    .data_out(connect_out[8])
    );
    
    
    // inner connction for outputen
    wire outputen_connection[0:5];
    
    wire [20:0] psum_in1_1, psum_in1_2, psum_in1_3;
    wire [20:0] psum_in2_1, psum_in2_2, psum_in2_3;
    wire [20:0] psum_in3_1, psum_in3_2, psum_in3_3;
    wire [20:0] psum_in4_1, psum_in4_2, psum_in4_3;
    wire [20:0] psum_in5_1, psum_in5_2, psum_in5_3;
    
    // the psum_in of PEs in horizontal line 5 is 0
    assign psum_in5_1 = 0;
    assign psum_in5_2 = 0;
    assign psum_in5_3 = 0;
    
    // reuse weight from vertical line 1
    wire [7:0] weight_reuse1_1;
    wire [7:0] weight_reuse2_1;
    wire [7:0] weight_reuse3_1;
    wire [7:0] weight_reuse4_1;
    wire [7:0] weight_reuse5_1;
    
    // Vertical line 1
    pe pe1_1(
    .clk(clk),
    .rst_n(rst_n),
    .worken(worken),
    .outputen(outputen_connection[3]),
    .fmaps_in(fmaps_in1_1),
    .weight_in(weight_in1),
    .psum_in(psum_in1_1),
    .outputen_delay(),
    .fmaps_reuse(),
    .weight_reuse(weight_reuse1_1),
    .psum_out(psum_out1_1)
    );
    pe pe2_1(
    .clk(clk),
    .rst_n(rst_n),
    .worken(worken),
    .outputen(outputen_connection[2]),
    .fmaps_in(fmaps_in2_1),
    .weight_in(weight_in2),
    .psum_in(psum_in2_1),
    .outputen_delay(outputen_connection[3]),
    .fmaps_reuse(connect_in[1]),
    .weight_reuse(weight_reuse2_1),
    .psum_out(psum_in1_1)
    );
    pe pe3_1(
    .clk(clk),
    .rst_n(rst_n),
    .worken(worken),
    .outputen(outputen_connection[1]),
    .fmaps_in(fmaps_in3_1),
    .weight_in(weight_in3),
    .psum_in(psum_in3_1),
    .outputen_delay(outputen_connection[2]),
    .fmaps_reuse(connect_in[2]),
    .weight_reuse(weight_reuse3_1),
    .psum_out(psum_in2_1)
    );
    pe pe4_1(
    .clk(clk),
    .rst_n(rst_n),
    .worken(worken),
    .outputen(outputen_connection[0]),
    .fmaps_in(fmaps_in4_1),
    .weight_in(weight_in4),
    .psum_in(psum_in4_1),
    .outputen_delay(outputen_connection[1]),
    .fmaps_reuse(connect_in[3]),
    .weight_reuse(weight_reuse4_1),
    .psum_out(psum_in3_1)
    );
    pe pe5_1(
    .clk(clk),
    .rst_n(rst_n),
    .worken(worken),
    .outputen(outputen),
    .fmaps_in(fmaps_in5_1),
    .weight_in(weight_in5),
    .psum_in(psum_in5_1),
    .outputen_delay(outputen_connection[0]),
    .fmaps_reuse(connect_in[4]),
    .weight_reuse(weight_reuse5_1),
    .psum_out(psum_in4_1)
    );
    
    // reuse weight from vertical line 2
    wire [7:0] weight_reuse1_2;
    wire [7:0] weight_reuse2_2;
    wire [7:0] weight_reuse3_2;
    wire [7:0] weight_reuse4_2;
    wire [7:0] weight_reuse5_2;
    
    // Vertical line 2
    pe pe1_2(
    .clk(clk),
    .rst_n(rst_n),
    .worken(worken),
    .outputen(outputen_connection[4]),
    .fmaps_in(connect_out[1]),
    .weight_in(weight_reuse1_1),
    .psum_in(psum_in1_2),
    .outputen_delay(outputen_connection[5]),
    .fmaps_reuse(),
    .weight_reuse(weight_reuse1_2),
    .psum_out(psum_out1_2)
    );
    pe pe2_2(
    .clk(clk),
    .rst_n(rst_n),
    .worken(worken),
    .outputen(outputen_connection[3]),
    .fmaps_in(connect_out[2]),
    .weight_in(weight_reuse2_1),
    .psum_in(psum_in2_2),
    .outputen_delay(outputen_connection[4]),
    .fmaps_reuse(connect_in[5]),
    .weight_reuse(weight_reuse2_2),
    .psum_out(psum_in1_2)
    );
    pe pe3_2(
    .clk(clk),
    .rst_n(rst_n),
    .worken(worken),
    .outputen(outputen_connection[2]),
    .fmaps_in(connect_out[3]),
    .weight_in(weight_reuse3_1),
    .psum_in(psum_in3_2),
    .outputen_delay(outputen_connection[3]),
    .fmaps_reuse(connect_in[6]),
    .weight_reuse(weight_reuse3_2),
    .psum_out(psum_in2_2)
    );
    pe pe4_2(
    .clk(clk),
    .rst_n(rst_n),
    .worken(worken),
    .outputen(outputen_connection[1]),
    .fmaps_in(connect_out[4]),
    .weight_in(weight_reuse4_1),
    .psum_in(psum_in4_2),
    .outputen_delay(outputen_connection[2]),
    .fmaps_reuse(connect_in[7]),
    .weight_reuse(weight_reuse4_2),
    .psum_out(psum_in3_2)
    );
    pe pe5_2(
    .clk(clk),
    .rst_n(rst_n),
    .worken(worken),
    .outputen(outputen_connection[0]),
    .fmaps_in(fmaps_in5_2),
    .weight_in(weight_reuse5_1),
    .psum_in(psum_in5_2),
    .outputen_delay(outputen_connection[1]),
    .fmaps_reuse(connect_in[8]),
    .weight_reuse(weight_reuse5_2),
    .psum_out(psum_in4_2)
    );
    
    // Vertical line 3
    pe pe1_3(
    .clk(clk),
    .rst_n(rst_n),
    .worken(worken),
    .outputen(outputen_connection[5]),
    .fmaps_in(connect_out[5]),
    .weight_in(weight_reuse1_2),
    .psum_in(psum_in1_3),
    .outputen_delay(),
    .fmaps_reuse(),
    .weight_reuse(),
    .psum_out(psum_out1_3)
    );
    pe pe2_3(
    .clk(clk),
    .rst_n(rst_n),
    .worken(worken),
    .outputen(outputen_connection[4]),
    .fmaps_in(connect_out[6]),
    .weight_in(weight_reuse2_2),
    .psum_in(psum_in2_3),
    .outputen_delay(outputen_connection[5]),
    .fmaps_reuse(),
    .weight_reuse(),
    .psum_out(psum_in1_3)
    );
    pe pe3_3(
    .clk(clk),
    .rst_n(rst_n),
    .worken(worken),
    .outputen(outputen_connection[3]),
    .fmaps_in(connect_out[7]),
    .weight_in(weight_reuse3_2),
    .psum_in(psum_in3_3),
    .outputen_delay(outputen_connection[4]),
    .fmaps_reuse(),
    .weight_reuse(),
    .psum_out(psum_in2_3)
    );
    pe pe4_3(
    .clk(clk),
    .rst_n(rst_n),
    .worken(worken),
    .outputen(outputen_connection[2]),
    .fmaps_in(connect_out[8]),
    .weight_in(weight_reuse4_2),
    .psum_in(psum_in4_3),
    .outputen_delay(outputen_connection[3]),
    .fmaps_reuse(),
    .weight_reuse(),
    .psum_out(psum_in3_3)
    );
    pe pe5_3(
    .clk(clk),
    .rst_n(rst_n),
    .worken(worken),
    .outputen(outputen_connection[1]),
    .fmaps_in(fmaps_in5_3),
    .weight_in(weight_reuse5_2),
    .psum_in(psum_in5_3),
    .outputen_delay(outputen_connection[2]),
    .fmaps_reuse(),
    .weight_reuse(),
    .psum_out(psum_in4_3)
    );
    
endmodule // pe_array
