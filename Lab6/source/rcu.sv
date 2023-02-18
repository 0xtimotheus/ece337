module rcu (
    input logic clk,
    input logic n_rst,
    input logic new_packet_detected,
    input logic packet_done,
    input logic framing_error,
    output logic sbc_clear,
    output logic sbc_enable,
    output logic load_buffer,
    output logic enable_timer
);
    typedef enum {IDLE=1, START=2, DATA=3, STOP=4, CHECK=5, ERROR=6, LOAD=7} statereg; 
    statereg state;
    statereg nstate;

    assign enable_timer = state == DATA | state == STOP;
    assign sbc_clear = state == START;
    assign sbc_enable = state == STOP;
    assign load_buffer = state == LOAD;

    always_ff @ (posedge clk, negedge n_rst) begin
        if(~n_rst) begin
            state <= IDLE;
        end else begin
            state <= nstate;
        end
    end

    always_comb begin
        nstate = IDLE;
        case(state)
            IDLE:         nstate = new_packet_detected ? START : IDLE;
            START:        nstate = DATA;
            DATA:         nstate = packet_done ? STOP : DATA;
            STOP:         nstate = CHECK;
            CHECK:        nstate = framing_error ? ERROR : LOAD;
            ERROR, LOAD:  nstate = IDLE;
        endcase
    end
endmodule