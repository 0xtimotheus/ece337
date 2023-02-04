module moore(logic input clk, logic input n_rst, logic input i, logic output o);

logic [3:0] state;
logic [3:0] nstate;

assign o = state[3];

always_ff @( posedge clk, negedge n_rst) begin
    if(~n_rst) state <= 3'b000;
    else state <= nstate;
end

always_comb begin
    case (state)
        000: nstate = i ? 3'b001 : 3'b000; break; 
        001: nstate = i ? 3'b010 : 3'b000; break;
        010: nstate = i ? 3'b010 : 3'b011; break;
        011: nstate = i ? 3'b100 : 3'b000; break;
        100: nstate = i ? 3'b010 : 3'b000; break;
        default: nstate = 3'b000;
    endcase
end

endmodule