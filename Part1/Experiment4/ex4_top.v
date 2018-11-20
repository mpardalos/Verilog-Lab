module ex4_top (
    SW,
    HEX0, HEX1, HEX2, HEX3, HEX4,
);

    input  [9:0] SW;
    output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4;
    wire   [3:0] BCD0, BCD1, BCD2, BCD3, BCD4;

    bin2bcd_16 bcd_decode({6'b0, SW[9:0]}, BCD0, BCD1, BCD2, BCD3, BCD4);

    hex_to_7seg SEG0(HEX0, BCD0);
    hex_to_7seg SEG1(HEX1, BCD1);
    hex_to_7seg SEG2(HEX2, BCD2);
    hex_to_7seg SEG3(HEX3, BCD3);
    hex_to_7seg SEG4(HEX4, BCD4);

endmodule

