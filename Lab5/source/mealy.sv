module mealy(logic input clk, logic input n_rst, logic input i, logic output o);

logic [2:0] state;
logic [2:0] nstate;
logic out;
logic nout;

assign o = out;

always_ff @( posedge clk, negedge n_rst) begin
    if(~n_rst) begin
        state <= 2'b00;
        out <= 1'b0;
    end else begin
        state <= nstate;
        out <= nout;
    end
end

always_comb begin
    case (state)
        00: 
            nstate = i ? 2'b01 : 2'b00;
            nout = 0;
            break; 
        01: 
            nstate = i ? 2'b10 : 2'b00;
            nout = 0;
            break;
        10: 
            nstate = i ? 2'b10 : 2'b11; 
            nout = 0;
            break;
        11: 
            nstate = i ? 2'b01 : 2'b00;
            nout = i ? 1 : 0;
            break;
        default: nstate = 2'b00;
    endcase
end

endmodule