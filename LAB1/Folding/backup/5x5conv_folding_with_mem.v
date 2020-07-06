module conv(input clk,
            input rst_n,
            input weight_select,
            output reg [20:0] acc);
    
    reg signed [7:0] fmaps[0:6'd48];
    reg signed [7:0] weight[0:6'd49];
    initial begin
        $readmemb("E:/Study/examples/github/VLSI_DIGITAL_SIGNAL_PROCESSING_SYSTEMS/fmaps_mem.txt",fmaps);
        $readmemb("E:/Study/examples/github/VLSI_DIGITAL_SIGNAL_PROCESSING_SYSTEMS/weight_mem.txt",weight);
    end
    
    reg [4:0] cnt;
    reg [4:0] base_addr_fmaps;
    reg [5:0] incre_addr_fmaps;
    wire [5:0] addr_fmaps;
    reg [5:0] addr_weight;
    
    wire signed [7:0] data_fmaps;
    reg signed [7:0] data_weight;
    
    reg signed [20:0] acc_temp;
    
    // data_fmaps
    assign addr_fmaps = base_addr_fmaps+incre_addr_fmaps;
    assign data_fmaps = fmaps[addr_fmaps];
    
    // data_weight
    always @(*) begin
        if (weight_select == 1'b1)
            data_weight = weight[addr_weight+6'd25];
        else
            data_weight = weight[addr_weight];
    end
    
    
    // base_addr_fmaps & incre_addr_fmaps
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            base_addr_fmaps  <= 0;
            incre_addr_fmaps <= 0;
        end
        else begin
            case (incre_addr_fmaps)
                6'd4:incre_addr_fmaps  <= incre_addr_fmaps+6'd3;
                6'd11:incre_addr_fmaps <= incre_addr_fmaps+6'd3;
                6'd18:incre_addr_fmaps <= incre_addr_fmaps+6'd3;
                6'd25:incre_addr_fmaps <= incre_addr_fmaps+6'd3;
                6'd32:begin
                    incre_addr_fmaps <= 0;
                    case (base_addr_fmaps)
                        5'd0:base_addr_fmaps    <= 5'd1;
                        5'd1:base_addr_fmaps    <= 5'd2;
                        5'd2:base_addr_fmaps    <= 5'd7;
                        5'd7:base_addr_fmaps    <= 5'd8;
                        5'd8:base_addr_fmaps    <= 5'd9;
                        5'd9:base_addr_fmaps    <= 5'd14;
                        5'd14:base_addr_fmaps   <= 5'd15;
                        5'd15:base_addr_fmaps   <= 5'd16;
                        5'd16:base_addr_fmaps   <= 5'd0;
                        default:base_addr_fmaps <= 5'd0;
                    endcase
                end
                default:incre_addr_fmaps <= incre_addr_fmaps+6'd1;
            endcase
        end
    end
    
    
    // addr_weight
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            addr_weight <= 0;
        end
        else begin
            if (addr_weight == 6'd24) begin
                addr_weight <= 0;
            end
            else begin
                addr_weight <= addr_weight+6'd1;
            end
        end
    end
    
    
    // cnt
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            cnt <= 0;
        end
        else begin
            cnt <= addr_weight;
        end
    end
    
    
    // acc_temp & acc
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            acc      <= 0;
            acc_temp <= 0;
        end
        else begin
            if (cnt == 5'd24) begin
                acc      <= acc_temp;
                acc_temp <= data_fmaps*data_weight;
            end
            else begin
                acc_temp <= acc_temp + data_fmaps*data_weight;
            end
        end
    end
    
endmodule // conv
