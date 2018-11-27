module ex6_top(
    KEY, 
    CLOCK_50,
    HEX0, HEX1, HEX2, HEX3, HEX4
);

input [1:0] KEY;
input CLOCK_50;

output [6:0] HEX0;
output [6:0] HEX1;
output [6:0] HEX2;
output [6:0] HEX3;
output [6:0] HEX4;

wire [15:0] count;
wire [5:0] bcd0;
wire [5:0] bcd1;
wire [5:0] bcd2;
wire [5:0] bcd3;
wire [5:0] bcd4;

wire tick;

clktick ClockDivider(CLOCK_50, 1'b1, tick);

counter_16 Counter(CLOCK_50, (~KEY[0]) & tick, ~KEY[1], count);

bin2bcd_16 BCDDecoder(count, bcd0, bcd1, bcd2, bcd3, bcd4);

hex_to_7seg Display0(HEX0, bcd0);
hex_to_7seg Display1(HEX1, bcd1);
hex_to_7seg Display2(HEX2, bcd2);
hex_to_7seg Display3(HEX3, bcd3);
hex_to_7seg Display4(HEX4, bcd4);

endmodule