module processor(sysclk, data_valid, data_in, data_out);

input           sysclk;		// system clock
input [9:0]     data_valid; // High when data_in is valid
input [9:0]     data_in;    // 10-bit input data
output [9:0]    data_out;	// 10-bit output data

wire            sysclk;
wire [9:0]      data_in;
reg [9:0]       data_out;
wire [9:0]      x,y;

parameter 		ADC_OFFSET = 10'h181;
parameter 		DAC_OFFSET = 10'h200;

/********************* I/O *****************************/
// x is input in 2's complement
assign x = data_in[9:0] - ADC_OFFSET;

// Signed right shift
assign y = x + {echo[9], echo[9], echo[9:2]};

always @(posedge sysclk) begin
    //  Now clock y output with system clock
    data_out <=  y + DAC_OFFSET;
end
/********************************************************/


wire valid_pulse;
pulsegen pulse_valid(
    .sysclk(sysclk),
    .in(data_valid),
    .out(valid_pulse)
);


/******************** FIFO control *****************************/
wire       buffer_full;
wire [9:0] echo;
wire buffer_write;
reg  buffer_read;

assign buffer_write = valid_pulse;
always @(posedge sysclk)
    buffer_read <= buffer_full & valid_pulse;

delay_fifo buffer(
    .clock(sysclk),
    .data(x),
    .rdreq(buffer_read),
    .wrreq(buffer_write),
    .full(buffer_full),
    .q(echo));
/************************************************************/

endmodule