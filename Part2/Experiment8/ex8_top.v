module ex8_top(
    CLOCK_50, 
    KEY,

    HEX0, HEX1, HEX2, HEX3, HEX4,
    LEDR
);

input CLOCK_50;
input [3:0] KEY;

output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4;
output [9:0] LEDR;

wire [3:0] KEY;
wire [6:0] HEX0, HEX1, HEX2, HEX3, HEX4;

/*************** Clock divisions ****************/
wire tick_ms;
wire tick_hs;
clktick #(
    .N_BIT(16),
    .MAX_COUNT(50000)
) div50000 (
    .clkin(CLOCK_50),
    .enable(1'b1),
    .tick(tick_ms)
);

clktick #(
    .N_BIT(16),
    .MAX_COUNT(500)
) div5000 (
    .clkin(tick_ms),
    .enable(1'b1),
    .tick(tick_hs)
);

/*************** FSM ****************/
starting_lights_fsm FSM (
    .clk(tick_ms),
    .tick(tick_hs),
    .trigger(~KEY[3]),
    .timeout(timeout),

    .en_lfsr(en_lfsr),
    .start_delay(delay_trigger),
    .ledr(LEDR)
);

/******************** LFSR *********************/
parameter LFSR_BITS = 5;
wire en_lfsr;
wire [LFSR_BITS-1:0] prbs;
lfsr #(
    .N_BIT(LFSR_BITS),
    .STAGE_1(2),
    .STAGE_2(5)
) delay_lfsr (
    .clk(tick_ms),
    .enable(en_lfsr),

    .data_out(prbs)
);

/******************* Delay ********************/
wire timeout;
wire delay_trigger;

// NOTE: Uses tick_hs instead of tick_ms as 
//       in the lab booklet
delay #(
    .N_BITS(LFSR_BITS)
) lights_out_delay (
    .clk(tick_hs),
    .N(prbs),
    .trigger(delay_trigger),

    .timeout(timeout)
);


/*************** LFSR display ****************/
bin2bcd_16 bcddecode(prbs, BCD0, BCD1, BCD2, BCD3, BCD4);

wire [3:0] BCD0, BCD1, BCD2, BCD3, BCD4;

hex_to_7seg hex0(HEX0, BCD0);
hex_to_7seg hex1(HEX1, BCD1);
hex_to_7seg hex2(HEX2, BCD2);
hex_to_7seg hex3(HEX3, BCD3);
hex_to_7seg hex4(HEX4, BCD4);

endmodule