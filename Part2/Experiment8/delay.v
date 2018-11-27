module delay(
    N, clk, trigger,
    timeout
);

parameter N_BITS=7;

input clk;
input trigger;
input [N_BITS-1:0] N;

output timeout;
reg timeout;

reg [N_BITS-1:0] count;

initial begin
    timeout=0;
    count=0;
end

always @(posedge clk) 
    if (trigger == 1'b1) 
        if (count == N-1) begin
            timeout <= 1'b1;
            count <= 0;
        end
        else begin
            timeout <= 0;
            count <= count + 1;
        end

endmodule