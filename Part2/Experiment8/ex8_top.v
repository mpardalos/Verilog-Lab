module ex8_top(
    CLOCK_50, 
    KEY,

    HEX0, HEX1, HEX2, HEX3, HEX4,
    LEDR
);

parameter LFSR_BITS=16;

input CLOCK_50;
input [3:0] KEY;

output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4;
output [9:0] LEDR;

wire tick_ms;
wire tick_hs;

wire [LFSR_BITS-1:0] prbs;

// LFSR


// LFSR display
wire [3:0] BCD0, BCD1, BCD2, BCD3, BCD4;

bin2bcd_16(prbs, BCD0, BCD1, BCD2, BCD3, BCD4);

hex_to_7seg hex0(HEX0, BCD0);
hex_to_7seg hex1(HEX1, BCD1);
hex_to_7seg hex2(HEX2, BCD2);
hex_to_7seg hex3(HEX3, BCD3);
hex_to_7seg hex4(HEX4, BCD4);



endmodule