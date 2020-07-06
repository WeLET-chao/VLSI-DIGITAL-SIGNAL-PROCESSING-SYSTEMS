module control(input clk,
               input rst_n,
               input weight_select,
               output reg [4:0] fmaps_addr,
               output [5:0] weight_addr,
               output reg [1:0] cs,
               output reg [1:0] we,
               output reg worken,
               output reg outputen,
               output reg [2:0] flag,
               output reg valid);
    
    // fmaps_addr
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            fmaps_addr <= 0;
        else if (worken) begin
            if (fmaps_addr == 18)
                fmaps_addr <= 0;
            else
                fmaps_addr <= fmaps_addr + 1;
        end
        else
            fmaps_addr <= fmaps_addr;
    end
    
    reg [5:0] weight_addr_reg0;
    // weight_addr_reg0
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            weight_addr_reg0 <= 0;
        else if (worken) begin
            if (weight_addr_reg0 == 18)
                weight_addr_reg0 <= 0;
            else
                weight_addr_reg0 <= weight_addr_reg0 + 1;
        end
        else
            weight_addr_reg0 <= weight_addr_reg0;
    end
    
    reg [5:0] weight_addr_reg1;
    // weight_addr_reg1
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            weight_addr_reg1 <= 18;
        else if (worken) begin
            if (weight_addr_reg1 == 37)
                weight_addr_reg1 <= 18;
            else
                weight_addr_reg1 <= weight_addr_reg1 + 1;
        end
        else
            weight_addr_reg1 <= weight_addr_reg1;
    end
    
    // weight_addr
    assign weight_addr = weight_select ? weight_addr_reg1 : weight_addr_reg0;
    
    // worken & cs & we
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            worken <= 0;
            cs     <= 0;
            we     <= 0;
        end
        else begin
            worken <= 1;
            cs     <= 2'b11;
        end
    end
    
    // outputen
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            outputen <= 0;
        else if (fmaps_addr == 5)
            outputen <= 1;
        else if (fmaps_addr == 10)
            outputen <= 1;
        else if (fmaps_addr == 15)
            outputen <= 1;
        else
            outputen <= 0;
    end
    
    reg [4:0] cnt;      // fmaps_addr delay
    // cnt
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            cnt <= 0;
        else 
            cnt <= fmaps_addr;
    end


    reg [2:0] flag_reg;
    // flag_reg
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            flag_reg <= 0;
        else if (cnt == 8)
            flag_reg <= 1;
        else if (cnt == 13)
            flag_reg <= 1;
        else if (cnt == 18)
            flag_reg <= 1;
        else begin
            flag_reg[2] <= flag_reg[1];
            flag_reg[1] <= flag_reg[0];
            flag_reg[0] <= 0;
        end
    end

    // flag
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            flag <= 0;
        else 
            flag <= flag_reg;
    end

    
    reg [2:0] valid_reg;
    // valid_reg
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            valid_reg <= 0;
        else if (cnt == 8)
            valid_reg <= 1;
        else if (cnt == 13)
            valid_reg <= 1;
        else if (cnt == 18)
            valid_reg <= 1;
        else begin
            valid_reg[2] <= valid_reg[1];
            valid_reg[1] <= valid_reg[0];
            valid_reg[0] <= 0;
        end            
    end
    
    // valid
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            valid <= 0;
        else 
            valid = valid_reg[0]|valid_reg[1]|valid_reg[2];
    end
    
endmodule // control
