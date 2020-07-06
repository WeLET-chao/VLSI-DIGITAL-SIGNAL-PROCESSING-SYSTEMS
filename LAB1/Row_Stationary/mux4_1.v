module mux4_1(input [2:0] s,        // select signal
              input [20:0] a,       // path 0
              input [20:0] b,       // path 1
              input [20:0] c,
              output reg [20:0] d);

always @(*) begin
    case (s)
        3'b001: d  = a;
        3'b010: d  = b;
        3'b100: d  = c;
        default: d = 0;
    endcase
end

endmodule // mux2_1
