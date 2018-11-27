module div50000(
    clkin,
    enable, 
    tick
);

parameter N_BIT = 16;
parameter MAX_COUNT = 16'd50000;

input clkin;
input enable;
output tick;

reg tick;
reg [N_BIT-1:0] count;

initial count = 16'd0;

always @ (posedge clkin)
    if (enable == 1'b1)
        if (count == MAX_COUNT) begin
            tick <= 1'b1;
            count <= 0;
        end
        else begin
            tick <= 1'b0;
            count <= count + 1'b1;
        end


endmodule