module reaction_counter( tick_ms, reset, stop, count );

parameter COUNT_BITS = 14;

input tick_ms;
input reset;
input stop;

output [COUNT_BITS-1:0] count;
reg     count;

parameter S_IDLE     = 1'b0;
parameter S_COUNTING = 1'b1;
reg state;
initial state = S_IDLE;

always @(posedge tick_ms)
    case (state)
        S_IDLE: if (reset == 1'b1) begin
            count <= 0;
            state <= S_COUNTING;
        end
        S_COUNTING: 
            if (stop == 1'b1) 
                state = S_IDLE;
            else 
                count <= count + 1'b1;
    endcase

endmodule