module mealy(input logic clk, input logic n_rst, input logic i, output logic o);

logic [1:0] state;
logic [1:0] nstate;
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
        2'b00: begin
            nstate = i ? 2'b01 : 2'b00;
            nout = 0;
        end
        2'b01: begin 
            nstate = i ? 2'b10 : 2'b00;
            nout = 0; 
        end
        2'b10: begin
            nstate = i ? 2'b10 : 2'b11; 
            nout = 0;
        end
        2'b11: begin 
            nstate = i ? 2'b01 : 2'b00;
            nout = i ? 1 : 0;
        end
        default: nstate = 2'b00;
    endcase
end

endmodule