module sram_fmaps(input clk,
                  input rst_n,
                  input cs,
                  input we,
                  input [5:0] addr,
                  input [7:0] data_i,
                  output reg [199:0] data_o);
    reg [7:0] data01[0:32];
    reg [7:0] data02[0:32];
    reg [7:0] data03[0:32];
    reg [7:0] data04[0:32];
    reg [7:0] data05[0:32];
    reg [7:0] data06[0:32];
    reg [7:0] data07[0:32];
    reg [7:0] data08[0:32];
    reg [7:0] data09[0:32];
    reg [7:0] data10[0:32];
    reg [7:0] data11[0:32];
    reg [7:0] data12[0:32];
    reg [7:0] data13[0:32];
    reg [7:0] data14[0:32];
    reg [7:0] data15[0:32];
    reg [7:0] data16[0:32];
    reg [7:0] data17[0:32];
    reg [7:0] data18[0:32];
    reg [7:0] data19[0:32];
    reg [7:0] data20[0:32];
    reg [7:0] data21[0:32];
    reg [7:0] data22[0:32];
    reg [7:0] data23[0:32];
    reg [7:0] data24[0:32];
    reg [7:0] data25[0:32];
    // initial begin
    //     $readmemb("E:/Study/examples/github/VLSI_DIGITAL_SIGNAL_PROCESSING_SYSTEMS/LAB1/fmaps_mem01.txt",data01);
    //     $readmemb("E:/Study/examples/github/VLSI_DIGITAL_SIGNAL_PROCESSING_SYSTEMS/LAB1/fmaps_mem02.txt",data02);
    //     $readmemb("E:/Study/examples/github/VLSI_DIGITAL_SIGNAL_PROCESSING_SYSTEMS/LAB1/fmaps_mem03.txt",data03);
    //     $readmemb("E:/Study/examples/github/VLSI_DIGITAL_SIGNAL_PROCESSING_SYSTEMS/LAB1/fmaps_mem04.txt",data04);
    //     $readmemb("E:/Study/examples/github/VLSI_DIGITAL_SIGNAL_PROCESSING_SYSTEMS/LAB1/fmaps_mem05.txt",data05);
    //     $readmemb("E:/Study/examples/github/VLSI_DIGITAL_SIGNAL_PROCESSING_SYSTEMS/LAB1/fmaps_mem06.txt",data06);
    //     $readmemb("E:/Study/examples/github/VLSI_DIGITAL_SIGNAL_PROCESSING_SYSTEMS/LAB1/fmaps_mem07.txt",data07);
    //     $readmemb("E:/Study/examples/github/VLSI_DIGITAL_SIGNAL_PROCESSING_SYSTEMS/LAB1/fmaps_mem08.txt",data08);
    //     $readmemb("E:/Study/examples/github/VLSI_DIGITAL_SIGNAL_PROCESSING_SYSTEMS/LAB1/fmaps_mem09.txt",data09);
    //     $readmemb("E:/Study/examples/github/VLSI_DIGITAL_SIGNAL_PROCESSING_SYSTEMS/LAB1/fmaps_mem10.txt",data10);
    //     $readmemb("E:/Study/examples/github/VLSI_DIGITAL_SIGNAL_PROCESSING_SYSTEMS/LAB1/fmaps_mem11.txt",data11);
    //     $readmemb("E:/Study/examples/github/VLSI_DIGITAL_SIGNAL_PROCESSING_SYSTEMS/LAB1/fmaps_mem12.txt",data12);
    //     $readmemb("E:/Study/examples/github/VLSI_DIGITAL_SIGNAL_PROCESSING_SYSTEMS/LAB1/fmaps_mem13.txt",data13);
    //     $readmemb("E:/Study/examples/github/VLSI_DIGITAL_SIGNAL_PROCESSING_SYSTEMS/LAB1/fmaps_mem14.txt",data14);
    //     $readmemb("E:/Study/examples/github/VLSI_DIGITAL_SIGNAL_PROCESSING_SYSTEMS/LAB1/fmaps_mem15.txt",data15);
    //     $readmemb("E:/Study/examples/github/VLSI_DIGITAL_SIGNAL_PROCESSING_SYSTEMS/LAB1/fmaps_mem16.txt",data16);
    //     $readmemb("E:/Study/examples/github/VLSI_DIGITAL_SIGNAL_PROCESSING_SYSTEMS/LAB1/fmaps_mem17.txt",data17);
    //     $readmemb("E:/Study/examples/github/VLSI_DIGITAL_SIGNAL_PROCESSING_SYSTEMS/LAB1/fmaps_mem18.txt",data18);
    //     $readmemb("E:/Study/examples/github/VLSI_DIGITAL_SIGNAL_PROCESSING_SYSTEMS/LAB1/fmaps_mem19.txt",data19);
    //     $readmemb("E:/Study/examples/github/VLSI_DIGITAL_SIGNAL_PROCESSING_SYSTEMS/LAB1/fmaps_mem20.txt",data20);
    //     $readmemb("E:/Study/examples/github/VLSI_DIGITAL_SIGNAL_PROCESSING_SYSTEMS/LAB1/fmaps_mem21.txt",data21);
    //     $readmemb("E:/Study/examples/github/VLSI_DIGITAL_SIGNAL_PROCESSING_SYSTEMS/LAB1/fmaps_mem22.txt",data22);
    //     $readmemb("E:/Study/examples/github/VLSI_DIGITAL_SIGNAL_PROCESSING_SYSTEMS/LAB1/fmaps_mem23.txt",data23);
    //     $readmemb("E:/Study/examples/github/VLSI_DIGITAL_SIGNAL_PROCESSING_SYSTEMS/LAB1/fmaps_mem24.txt",data24);
    //     $readmemb("E:/Study/examples/github/VLSI_DIGITAL_SIGNAL_PROCESSING_SYSTEMS/LAB1/fmaps_mem25.txt",data25);
    // end
    
    // read data
    always @(*) begin
        if (cs&(~we)) begin
            data_o <= {data01[addr],data02[addr],data03[addr],data04[addr],data05[addr],data06[addr],data07[addr],data08[addr],data09[addr],
            data10[addr],data11[addr],data12[addr],data13[addr],data14[addr],data15[addr],data16[addr],data17[addr],data18[addr],
            data19[addr],data20[addr],data21[addr],data22[addr],data23[addr],data24[addr],data25[addr]};
        end
        else begin
            data_o <= 0;
        end
    end
    
    // write data
    
endmodule // sram_fmaps
