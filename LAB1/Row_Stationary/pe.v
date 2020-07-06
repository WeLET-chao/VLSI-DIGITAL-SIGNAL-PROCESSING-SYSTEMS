module pe(input clk,
          input rst_n,
          input worken,
          input outputen,
          input signed [7:0] fmaps_in,
          input signed [7:0] weight_in,
          input signed [20:0] psum_in,          
          output reg outputen_delay,
          output reg signed [7:0] fmaps_reuse,
          output reg signed [7:0] weight_reuse,
          output reg signed [20:0] psum_out);  
    
    reg signed [20:0] acc_reg;
    
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            outputen_delay <= 0;
        else
            outputen_delay <= outputen;
    end
    
    // fmaps_reuse
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            fmaps_reuse <= 0;
        else if (worken)
            fmaps_reuse <= fmaps_in;
        else
            fmaps_reuse <= fmaps_reuse;
    end
    
    // weight_reuse
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            weight_reuse <= 0;
        else if (worken)
            weight_reuse <= weight_in;
        else
            weight_reuse <= weight_reuse;
    end
    
    reg signed [15:0] mult_reg;
    // mult_reg
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            mult_reg <= 0;
        else if (worken)
            mult_reg <= fmaps_in*weight_in;
        else
            mult_reg <= mult_reg;
    end
    
    // acc_reg
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            acc_reg <= 0;
        else
            case ({outputen,worken})
                2'b01: acc_reg   <= acc_reg + mult_reg;
                2'b11: acc_reg   <= mult_reg;
                default: acc_reg <= acc_reg;
            endcase
    end
    
    // psum_out
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            psum_out <= 0;
        else if (outputen)
            psum_out <= acc_reg + psum_in;
        else
            psum_out <= 0;
    end
    
endmodule // pe
