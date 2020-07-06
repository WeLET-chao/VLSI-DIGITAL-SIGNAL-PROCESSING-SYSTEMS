module buffer(input clk,
              input rst_n,
              input [7:0] data_in,
              output reg [7:0] data_out);
    
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            data_out <= 0;
        else 
            data_out <= data_in;
    end

endmodule // buffer
