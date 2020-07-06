module global_buffer(input clk,
                     input rst_n,
                     input [1:0] cs,        // cs[0] fmaps;    cs[1] weight;
                     input [1:0] we,
                     input [7:0] data_i,
                     input [4:0] fmaps_addr,
                     input [5:0] weight_addr,
                     output reg [7:0] fmaps_data1_o,
                     output reg [7:0] fmaps_data2_o,
                     output reg [7:0] fmaps_data3_o,
                     output reg [7:0] fmaps_data4_o,
                     output reg [7:0] fmaps_data5_o,
                     output reg [7:0] fmaps_data6_o,
                     output reg [7:0] fmaps_data7_o,
                     output reg [7:0] weight_data1_o,
                     output reg [7:0] weight_data2_o,
                     output reg [7:0] weight_data3_o,
                     output reg [7:0] weight_data4_o,
                     output reg [7:0] weight_data5_o);
    
    reg [7:0] fmaps_data1[0:18];
    reg [7:0] fmaps_data2[0:18];
    reg [7:0] fmaps_data3[0:18];
    reg [7:0] fmaps_data4[0:18];
    reg [7:0] fmaps_data5[0:18];
    reg [7:0] fmaps_data6[0:18];
    reg [7:0] fmaps_data7[0:18];
    
    reg [7:0] weight_data1[0:37];
    reg [7:0] weight_data2[0:37];
    reg [7:0] weight_data3[0:37];
    reg [7:0] weight_data4[0:37];
    reg [7:0] weight_data5[0:37];
    
    initial begin
        $readmemb("E:/Study/examples/github/VLSI_DIGITAL_SIGNAL_PROCESSING_SYSTEMS/LAB1/Mem/rs_fmaps_mem1.txt",fmaps_data1);
        $readmemb("E:/Study/examples/github/VLSI_DIGITAL_SIGNAL_PROCESSING_SYSTEMS/LAB1/Mem/rs_fmaps_mem2.txt",fmaps_data2);
        $readmemb("E:/Study/examples/github/VLSI_DIGITAL_SIGNAL_PROCESSING_SYSTEMS/LAB1/Mem/rs_fmaps_mem3.txt",fmaps_data3);
        $readmemb("E:/Study/examples/github/VLSI_DIGITAL_SIGNAL_PROCESSING_SYSTEMS/LAB1/Mem/rs_fmaps_mem4.txt",fmaps_data4);
        $readmemb("E:/Study/examples/github/VLSI_DIGITAL_SIGNAL_PROCESSING_SYSTEMS/LAB1/Mem/rs_fmaps_mem5.txt",fmaps_data5);
        $readmemb("E:/Study/examples/github/VLSI_DIGITAL_SIGNAL_PROCESSING_SYSTEMS/LAB1/Mem/rs_fmaps_mem6.txt",fmaps_data6);
        $readmemb("E:/Study/examples/github/VLSI_DIGITAL_SIGNAL_PROCESSING_SYSTEMS/LAB1/Mem/rs_fmaps_mem7.txt",fmaps_data7);
        
        $readmemb("E:/Study/examples/github/VLSI_DIGITAL_SIGNAL_PROCESSING_SYSTEMS/LAB1/Mem/rs_weight_mem1.txt",weight_data1);
        $readmemb("E:/Study/examples/github/VLSI_DIGITAL_SIGNAL_PROCESSING_SYSTEMS/LAB1/Mem/rs_weight_mem2.txt",weight_data2);
        $readmemb("E:/Study/examples/github/VLSI_DIGITAL_SIGNAL_PROCESSING_SYSTEMS/LAB1/Mem/rs_weight_mem3.txt",weight_data3);
        $readmemb("E:/Study/examples/github/VLSI_DIGITAL_SIGNAL_PROCESSING_SYSTEMS/LAB1/Mem/rs_weight_mem4.txt",weight_data4);
        $readmemb("E:/Study/examples/github/VLSI_DIGITAL_SIGNAL_PROCESSING_SYSTEMS/LAB1/Mem/rs_weight_mem5.txt",weight_data5);
    end
    
    // read fmaps
    always @(*) begin
        if (cs[0]&(~we[0])) begin
            fmaps_data1_o = fmaps_data1[fmaps_addr];
            fmaps_data2_o = fmaps_data2[fmaps_addr];
            fmaps_data3_o = fmaps_data3[fmaps_addr];
            fmaps_data4_o = fmaps_data4[fmaps_addr];
            fmaps_data5_o = fmaps_data5[fmaps_addr];
            fmaps_data6_o = fmaps_data6[fmaps_addr];
            fmaps_data7_o = fmaps_data7[fmaps_addr];
        end
        else begin
            fmaps_data1_o = 0;
            fmaps_data2_o = 0;
            fmaps_data3_o = 0;
            fmaps_data4_o = 0;
            fmaps_data5_o = 0;
            fmaps_data6_o = 0;
            fmaps_data7_o = 0;
        end
    end

    // read weight
    always @(*) begin
        if (cs[1]&(~we[1])) begin
            weight_data1_o = weight_data1[weight_addr];
            weight_data2_o = weight_data2[weight_addr];
            weight_data3_o = weight_data3[weight_addr];
            weight_data4_o = weight_data4[weight_addr];
            weight_data5_o = weight_data5[weight_addr];
        end
        else begin
            weight_data1_o = 0;
            weight_data2_o = 0;
            weight_data3_o = 0;
            weight_data4_o = 0;
            weight_data5_o = 0;
        end
    end
    
endmodule // global_buffer
