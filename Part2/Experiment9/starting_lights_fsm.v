module starting_lights_fsm(
    clk, tick, trigger, timeout,
    en_lfsr, start_delay, ledr
);

input clk;
input tick;
input trigger;
input timeout;

output       en_lfsr;
output       start_delay;
output [9:0] ledr;

reg       en_lfsr = 1;
reg       start_delay;
reg [9:0] ledr;

parameter S_WAIT       = 13'b0000000000001;
parameter S_LED0       = 13'b0000000000010;
parameter S_LED1       = 13'b0000000000100;
parameter S_LED2       = 13'b0000000001000;
parameter S_LED3       = 13'b0000000010000;
parameter S_LED4       = 13'b0000000100000;
parameter S_LED5       = 13'b0000001000000;
parameter S_LED6       = 13'b0000010000000;
parameter S_LED7       = 13'b0000100000000;
parameter S_LED8       = 13'b0001000000000;
parameter S_LED9       = 13'b0010000000000;
parameter S_LED10      = 13'b0100000000000;
parameter S_DELAY_WAIT = 13'b1000000000000;
reg [12:0] state = S_WAIT;

// state transitions
always @(posedge tick)
    case (state)
        S_WAIT:  if (trigger == 1'b1) state <= S_LED0;
        S_LED0:  state <= S_LED1;
        S_LED1:  state <= S_LED2;
        S_LED2:  state <= S_LED3;
        S_LED3:  state <= S_LED4;
        S_LED4:  state <= S_LED5;
        S_LED5:  state <= S_LED6;
        S_LED6:  state <= S_LED7;
        S_LED7:  state <= S_LED8;
        S_LED8:  state <= S_LED9;
        S_LED9:  state <= S_LED10;
        S_LED10: state <= S_DELAY_WAIT;
        S_DELAY_WAIT: if (timeout == 1'b1) state <= S_WAIT;
    endcase

// start_delay
always @(posedge clk)
    case (state)
        S_LED10: start_delay <= 1'b1;
        default: start_delay <= 1'b0;
    endcase

// LFSR
always @(posedge clk)
    case (state)
        S_LED10:      en_lfsr <= 1'b0;
        S_DELAY_WAIT: en_lfsr <= 1'b0;
        default:      en_lfsr <= 1'b1;
    endcase

// LED output
always @(posedge clk)
    case (state)
      S_WAIT:  ledr <= 10'b0000000000;
      S_LED0:  ledr <= 10'b0000000000;
      S_LED1:  ledr <= 10'b1000000000;
      S_LED2:  ledr <= 10'b1100000000;
      S_LED3:  ledr <= 10'b1110000000;
      S_LED4:  ledr <= 10'b1111000000;
      S_LED5:  ledr <= 10'b1111100000;
      S_LED6:  ledr <= 10'b1111110000;
      S_LED7:  ledr <= 10'b1111111000;
      S_LED8:  ledr <= 10'b1111111100;
      S_LED9:  ledr <= 10'b1111111110;
      S_LED10: ledr <= 10'b1111111111;
    endcase

endmodule