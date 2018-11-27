module pwm(
    clk, data_in, load,
    pwm_out
);

parameter N_BIT=10;

input clk;
input [N_BIT-1:0] data_in;
input load;

output pwm_out;


reg [N_BIT-1:0] d;
reg [N_BIT-1:0] count;
reg pwm_out;

initial count = 0;

always @(posedge clk)
    if (load == 1) d <= data_in;

always @(posedge clk) begin
    count <= count + 1'b1;

    if (count > d) pwm_out <= 1'b0;
    else           pwm_out <= 1'b1;
end

endmodule