module regfile_weight(input clk,
                      input rst_n,
                      input weight_select,
                      input [5:0] addr,
                      input [7:0] data_i,
                      output reg [199:0] data_o);
    reg [7:0] data[0:49];
    // initial begin
    //     $readmemb("E:/Study/examples/github/VLSI_DIGITAL_SIGNAL_PROCESSING_SYSTEMS/LAB1/weight_mem.txt",data);
    // end
    
    // read data
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            data_o <= 0;
        end
        else begin
            case (weight_select)
                1'b0: begin
                    data_o <= {data[0],data[1],data[2],data[3],data[4],data[5],data[6],data[7],data[8],
                    data[9],data[10],data[11],data[12],data[13],data[14],data[15],data[16],data[17],
                    data[18],data[19],data[20],data[21],data[22],data[23],data[24]};
                end
                1'b1: begin
                    data_o <= {data[25],data[26],data[27],data[28],data[29],data[30],data[31],data[32],
                    data[33],data[34],data[35],data[36],data[37],data[38],data[39],data[40],data[41],
                    data[42],data[43],data[44],data[45],data[46],data[47],data[48],data[49]};
                end
            endcase
        end
    end
    
    // write data
    
endmodule // regfile_weight
