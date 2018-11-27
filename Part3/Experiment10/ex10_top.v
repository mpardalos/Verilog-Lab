module ex10_top (
    SW, CLOCK_50,
    DAC_CS, DAC_SDI, DAC_LD, DAC_SCK
);

input [9:0] SW;
input CLOCK_50;
output DAC_CS, DAC_SDI, DAC_LD, DAC_SCK;

wire CLOCK_10K;

clktick #(.MAX_COUNT(5000)) div5000(CLOCK_50, 1'b1, CLOCK_10K);

spi2dac spi2dac_1(
    CLOCK_50,
    SW, 
    CLOCK_10K,
    DAC_SDI, DAC_CS, DAC_SCK, DAC_LD);

endmodule