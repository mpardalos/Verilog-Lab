module ex11_top (
    SW, CLOCK_50,
    DAC_CS, DAC_SDI, DAC_LD, DAC_SCK, PWM_OUT
);

input [9:0] SW;
input CLOCK_50;

output DAC_CS; 
output DAC_SDI; 
output DAC_LD; 
output DAC_SCK; 
output PWM_OUT;

wire CLOCK_10K;
clktick #(.MAX_COUNT(5000)) div5000(
    CLOCK_50, 
    1'b1, 
    CLOCK_10K);

spi2dac spi2dac_1(
    CLOCK_50,
    SW, 
    CLOCK_10K,
    DAC_SDI, DAC_CS, DAC_SCK, DAC_LD);

pwm #(.N_BIT(10)) pwm_1(
    CLOCK_50, 
    SW, 
    CLOCK_10K, 
    PWM_OUT);

endmodule