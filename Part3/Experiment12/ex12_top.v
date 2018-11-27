module ex12_top(
    SW, CLOCK_50,
    HEX0, HEX1, HEX2
);

input [7:0] SW;
input CLOCK_50;

output [6:0] HEX0;
output [6:0] HEX1;
output [6:0] HEX2;

wire [9:0] value;

ROM sine_rom(SW, CLOCK_50, value);

hex_to_7seg seg_0(HEX0, value[3:0]);
hex_to_7seg seg_1(HEX1, value[7:4]);
hex_to_7seg seg_2(HEX2, {2'b0, value[9:8]});

endmodule