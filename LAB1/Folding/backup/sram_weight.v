module sram_weight(input clk,
                   input rst_n,
                   input ce,
                   input we,
                   input [5:0] addr,
                   input signed [7:0] data_i,
                   output reg signed [7:0] data_o);
    reg signed [7:0] data[0:49];
    // initial begin
    //     $readmemb("E:/Study/examples/github/VLSI_DIGITAL_SIGNAL_PROCESSING_SYSTEMS/LAB1/weight_mem.txt",data);
    // end
    
    // read data
    always @(*) begin
        if (ce&(~we)) begin
            data_o <= data[addr];
        end
        else begin
            data_o <= 0;
        end
    end
    
endmodule // sram_weight
