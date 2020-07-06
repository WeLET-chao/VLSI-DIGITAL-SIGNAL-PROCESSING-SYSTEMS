module control(input clk,
               input rst_n,
               output reg readen,
               output reg fmaps_sram_s,
               output reg fmaps_sram_w,
               output reg valid,
               output reg [5:0] fmaps_addr);
    
    reg [4:0] cnt;
    
    // fmaps_addr_reg
    reg [5:0] fmaps_addr_reg_1;
    reg [5:0] fmaps_addr_reg_2;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            fmaps_addr_reg_1 <= 0;
            fmaps_addr_reg_2 <= 0;
        end
        else begin
            if (fmaps_addr_reg_1 == 32)
                fmaps_addr_reg_1 <= 0;
            else
                fmaps_addr_reg_1 <= fmaps_addr_reg_1 + 1;
            fmaps_addr_reg_2 <= fmaps_addr_reg_1;
        end
    end
    
    // fmaps_addr
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            fmaps_addr <= 0;
        end
        else begin
            fmaps_addr <= fmaps_addr_reg_2;
        end
    end
    
    // weight_regfile
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            readen <= 0;
        end
        else begin
            if (cnt == 0)
                readen <= 1;
            else
                readen <= 0;
        end
    end
    
    // fmaps_sram
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            fmaps_sram_s <= 0;
            fmaps_sram_w <= 0;
        end
        else
            fmaps_sram_s <= 1;
    end
    
    // cnt
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            cnt <= 0;
        end
        else begin
            if (cnt < 26) begin
                cnt <= cnt + 1;
            end
            else
                cnt <= 26;
        end
    end
    
    // valid
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            valid <= 0;
        end
        else begin
            if (cnt == 26)
                valid <= 1;
            else
                valid <= 0;
        end
    end
    
endmodule // control
