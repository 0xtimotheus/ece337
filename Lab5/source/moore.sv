module moore(input logic clk, input logic n_rst, input logic i, output logic o);

logic [2:0] state;
logic [2:0] nstate;

//assign o = state[2];

always_ff @( posedge clk, negedge n_rst) begin
    if(~n_rst) begin
        state <= 3'b000;
        o <= 1'b0;
    end else begin
        state <= nstate;
        o <= nstate[2];
    end
end

always_comb begin
    case (state)
        3'b000: nstate = i ? 3'b001 : 3'b000;  
        3'b001: nstate = i ? 3'b010 : 3'b000; 
        3'b010: nstate = i ? 3'b010 : 3'b011; 
        3'b011: nstate = i ? 3'b100 : 3'b000; 
        3'b100: nstate = i ? 3'b010 : 3'b000; 
        default: nstate = 3'b000;
    endcase
end

endmodule