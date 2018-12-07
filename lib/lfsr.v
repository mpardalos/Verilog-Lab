module lfsr(clk, enable, data_out);

parameter N_BIT;
parameter STAGE_1;
parameter STAGE_2;

input clk;
input enable;
output [N_BIT:1] data_out;

reg [N_BIT:1] sreg;

initial sreg = 1;

always @ (posedge clk)
    if (enable == 1'b1)
        sreg <= {sreg[N_BIT:2], sreg[STAGE_1] ^ sreg[STAGE_2]};

assign data_out = sreg;

endmodule