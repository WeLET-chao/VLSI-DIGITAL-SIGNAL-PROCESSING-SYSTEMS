module conv(input clk,
            input rst_n,
            input worken,
            input outputen,
            input signed [7:0] data_fmaps,
            input signed [7:0] data_weight,
            output reg signed [20:0] acc);
    
    reg signed [20:0] acc_temp;
    // acc_temp & acc
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            acc      <= 0;
            acc_temp <= 0;
        end
        else begin
            case ({worken,outputen})
                2'b10: acc_temp <= acc_temp + data_fmaps*data_weight;
                2'b11: begin
                    acc      <= acc_temp;
                    acc_temp <= data_fmaps*data_weight;
                end
                default: acc_temp <= acc_temp;
            endcase
        end
    end
    
endmodule // conv
