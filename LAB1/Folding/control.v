module control(input clk,
               input rst_n,
               input weight_select,
               output reg cs,
               output reg we,
               output reg [5:0] addr_fmaps,
               output reg [5:0] addr_weight,
               output reg worken,
               output reg outputen);
    
    reg [5:0] cnt;
    reg [4:0] base_addr_fmaps;
    reg [5:0] incre_addr_fmaps;
    reg [5:0] addr_weight_cnt;
    
    
    // addr_fmaps
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            addr_fmaps <= 0;
        end
        else begin
            addr_fmaps = base_addr_fmaps+incre_addr_fmaps;
        end
    end
    // assign addr_fmaps = base_addr_fmaps+incre_addr_fmaps;
    
    // addr_weight
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            addr_weight <= 0;
        end
        else begin
            addr_weight = weight_select?(addr_weight_cnt+6'd25):addr_weight_cnt;
        end
    end
    // assign addr_weight = weight_select?(addr_weight_cnt+6'd25):addr_weight_cnt;
    
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
    
    
    // addr_weight_cnt
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            addr_weight_cnt <= 0;
        end
        else begin
            if (addr_weight_cnt == 6'd24) begin
                addr_weight_cnt <= 0;
            end
            else begin
                addr_weight_cnt <= addr_weight_cnt+6'd1;
            end
        end
    end
    
    
    // cnt
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            cnt <= 0;
        end
        else begin
            cnt <= addr_weight_cnt;
        end
    end
    
    // cs & we & worken & outputen
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            cs       <= 0;
            we       <= 0;
            worken   <= 0;
            outputen <= 0;
        end
        else begin
            cs     <= 1;
            worken <= 1;
            if (cnt == 6'd24)
                outputen <= 1;
            else
                outputen <= 0;
        end
    end
    
endmodule // control
