module delay(
    N, clk, trigger,
    timeout
);

parameter N_BITS;

input clk;
input trigger;
input [N_BITS-1:0] N;

output timeout;
reg timeout;

reg in_countdown;
reg [N_BITS-1:0] count;

initial begin
    timeout=0;
    count=0;
end

always @(posedge clk) begin
    if (trigger == 1'b1 && in_countdown == 1'b0) begin
        in_countdown <= 1'b1;
        count <= N-1'b1;
    end

    if (count == 0 && in_countdown == 1'b1) begin
        in_countdown <= 1'b0;
        timeout <= 1'b1;
    end

    if (count != 0 && in_countdown == 1'b1) begin
        count <= count - 1'b1;
    end

    if (in_countdown == 1'b0) begin
        timeout <= 1'b0;
    end
end

endmodule