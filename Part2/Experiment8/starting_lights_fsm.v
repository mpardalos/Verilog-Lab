module starting_lights_fsm(
    clk, tick, trigger, timeout,
    en_lfsr, start_delay, ledr
);

input clk;
input tick;
input trigger;
input timeout;

output en_lfsr;
output start_delay;
output [9:0] ledr;

always @(posedge clk)