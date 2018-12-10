module lfsr(clk, enable, data_out);

parameter N_BIT = 5;
parameter STAGE_1 = 2;
parameter STAGE_2 = 5;

input clk;
input enable;
output [N_BIT:1] data_out;

reg [N_BIT:1] sreg = 1;

always @ (posedge clk)
    if (enable == 1'b1)
        sreg <= {sreg[N_BIT-1:1], sreg[STAGE_1] ^ sreg[STAGE_2]};

assign data_out = sreg;

endmodule