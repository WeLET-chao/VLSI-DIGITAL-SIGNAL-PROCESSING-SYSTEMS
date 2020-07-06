module pe(input clk,
          input rst_n,
          input readen,
          input signed [7:0] fmaps_in,
          input signed [7:0] weight_in,
          input signed [20:0] partial_sum_in,
          output reg signed [20:0] partial_sum_out);
    
    reg signed [7:0] weight_reg;
    
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            weight_reg      <= 0;
            partial_sum_out <= 0;
        end
        else begin
            if (readen) begin
                weight_reg <= weight_in;
            end
            else begin
                partial_sum_out <= partial_sum_in + fmaps_in*weight_reg;
            end
        end
    end
    
    
    
endmodule // pe
