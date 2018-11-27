module ex7_top(
    KEY, HEX0, HEX1
);

input [4:0] KEY;

output [6:0] HEX0;
output [6:0] HEX1;
wire [5:0] bcd0;
wire [5:0] bcd1;

wire [6:0] value;

lfsr7 LFSR(value, KEY[3]);

hex_to_7seg Display0(HEX0, value[3:0]);
hex_to_7seg Display1(HEX1, value[6:3]);

endmodule