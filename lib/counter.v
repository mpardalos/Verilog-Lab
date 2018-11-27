module counter(
    clk, enable,
    out
);

parameter N_BIT=10;
parameter MAX_COUNT=1023;

input clk;
input enable;

output [N_BIT-1:0] out;

reg [N_BIT-1:0] out;
initial out = 0;

always @(posedge clk) begin
    if (out == MAX_COUNT)
        out <= 0;
    else
        out <= out + 1'b1;
end


endmodule