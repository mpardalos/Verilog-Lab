module ex13_top(
  CLOCK_50,
  // DAC ports
  DAC_CS,
  DAC_SDI,
  DAC_LD,
  DAC_SCK,
  
  PWM_OUT
);

input CLOCK_50;

// DAC ports
output DAC_CS;
output DAC_SDI;
output DAC_LD;
output DAC_SCK;
output PWM_OUT;

wire DAC_CS;
wire DAC_SDI;
wire DAC_LD;
wire DAC_SCK;
wire PWM_OUT;

// 10kHz Clock
wire CLOCK_10K;
clktick #(.MAX_COUNT(5000)) div5000(CLOCK_50, 1'b1, CLOCK_10K);

// ROM
wire [9:0] A;
counter #(
    .N_BIT(10),
    .MAX_COUNT(1023)
) address_counter(CLOCK_50, CLOCK_10K, A);
ROM sinerom(A, CLOCK_10K, D);

// Output
wire [9:0] D;
pwm     pwm1(CLOCK_50, D, CLOCK_10K, PWM_OUT);
spi2dac spi2dac1(CLOCK_50, D, CLOCK_10K, DAC_SDI, DAC_CS, DAC_SCK, DAC_LD);

endmodule // ex13_top