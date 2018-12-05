module pulsegen(sysclk, in, out);

input sysclk;
input in;
output out;
reg out = 0;

reg already_pulsed = 0;
always @(posedge sysclk)
    if (in == 1'b1 && already_pulsed == 1'b0) begin
        out <= 1'b1;
        already_pulsed <= 1'b1;
    end
    else if (in == 1'b1 && already_pulsed == 1'b1) begin
        out <= 1'b0;
    end 
    else if (in == 1'b0 && already_pulsed == 1'b1) begin
        already_pulsed <= 1'b0;
    end

endmodule