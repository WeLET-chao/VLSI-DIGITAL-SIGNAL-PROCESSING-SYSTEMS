module sram_fmaps(input clk,
                  input rst_n,
                  input cs,
                  input we,
                  input [5:0] addr,
                  input signed [7:0] data_i,
                  output reg signed [7:0] data_o);
    reg signed [7:0] data[0:48];
    initial begin
        $readmemb("E:/Study/examples/github/VLSI_DIGITAL_SIGNAL_PROCESSING_SYSTEMS/LAB1/Mem/fmaps_mem.txt",data);
    end
    
    // read data   
    always @(*) begin
        if (cs&(~we)) begin
            data_o <= data[addr];
        end
        else begin
            data_o <= 0;
        end
    end

endmodule // sram_fmaps
